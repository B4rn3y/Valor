###########################################
###        Item Price Calculator        ###
###         Date: 23.OKT.2019           ###
###            Author: Inch             ###
###########################################

import mysql.connector
from mysql.connector import Error

###########################################
#################CONFIG####################
###########################################

# Login @ MySQL
connection = mysql.connector.connect(
    host='213.202.230.152',
    database='valor',
    user='admin',
    password='sdD5heWTGLp9SQKSFXJFsBKQE')

# TypeMultiplier
# Multiplier for each Item Type
itemTypeMultiplier = [
    ['uniform', 0.15],
    ['headgear', 0.3],
    ['item', 1.0],
    ['pweapon', 2],
    ['magazine', 0.3],
    ['hweapon', 1.5],
    ['vest', 0.4],
    ['goggles', 0.4],
    ['backpack', 1.5]]

# Multiplier for each Loottable
tableTypeMultiplier = [
    ['firestation', 2.0],
    ['medical', 4.0],
    ['farming', 1.0],
    ['industrial', 1.0],
    ['general', 1.0],
    ['food', 1.0],
    ['l_military', 2.0],
    ['m_military', 3.0],
    ['h_military', 4.0],
    ['radiation_zone', 4.0],
    ['loot_drop', 4.0]]

# Special Items [classname, prob, price, lootable, itemType, tableType, displayText]
specialItems = [
    ["valor_woodenlog", 0, 10, True, "item", "industrial", "Wooden Log"],
    ["valor_cliff_stone_medium", 0, 25, False, "item", "industrial", "Stone"],
    ["valor_cement_bag", 0, 50, False, "item", "industrial", "Cementbag"],
    ["valor_cinder_blocks", 0, 50, False, "item", "industrial", "Cinderblock"],
    ["valor_woodenboard", 0, 25, False, "item", "industrial", "Woodenboard"]
]

# Parameter for both linear functions
max_price = 200  # start value = max_price
min_price = 10  # price cant drop under min_price
first_modifier = 6  # first_modifier until envelop_point
second_modifier = 0.2  # second_modifier after envelop_point
envelop_point = 25


###########################################
################FUNCTIONS##################
###########################################

def refinePrice(x, base=5):
    return base * round(x / base)

def sqlExec(sql):
    cursor = connection.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    return result

def sqlCast(sql):
    cursor = connection.cursor()
    cursor.execute(sql)
    connection.commit()
    cursor.close()

###########################################
###################MAIN####################
###########################################

itemProb = []  # [["classname", "itemType", [["tableType", prob]["tableType", prob]] ]]

try:

    loottable_classnames = sqlExec("Select `classname`, `max_prob`, `table_type` from `loottable_classnames`")
    item_sell_prices = sqlExec("Select `classname`, `type` from `item_sell_prices_test`")
    
    
    # Insert Elements from loottable into itemProb
    for row in loottable_classnames:
        classname = row[0]
        itemType = "item"
        prob = (float(row[1]) - 1)
        tableType = row[2]
        redundant = False

        for x in item_sell_prices:
            if (x[0] == classname):
                itemType = x[1]
                break

        for x in itemProb:
            if (x[0] == classname):
                redundant = True
                itemProb[itemProb.index(x)][2].append([tableType, prob])
                break

        if (not redundant):
            itemProb.append([classname, itemType, [[tableType, prob]]])
    
    #Add SpecialItems to itemProb
    for i in specialItems:
        if (i[3]):
            itemProb.append([i[0], i[4], [[i[5], i[1]]]])
    
    #Get existing sellprices
    existsList = sqlExec("SELECT `classname` FROM `item_sell_prices_test`")
    exists = []
    for i in existsList:
        exists.append(i[0])
    
    #Calculate Prices from itemProb & insert into sellprices table
    for row in itemProb:

        classname = row[0]
        itemType = row[1]
        displayText = None

        prob = 0
        for x in row[2]:
            prob += x[1]

        sell_price = min_price

        itemMultiplier = 1
        tableMultiplier = 0

        if (prob <= envelop_point):
            sell_price = max_price - (first_modifier * prob)
        else:
            sell_price = (max_price - (first_modifier * envelop_point)) - (second_modifier * prob)

        for x in row[2]:
            for y in tableTypeMultiplier:
                if (x[0] == y[0]):
                    if (tableMultiplier < y[1]):
                        tableMultiplier = y[1]

        for x in itemTypeMultiplier:
            if (x[0] == itemType):
                itemMultiplier = x[1]

        sell_price = sell_price * itemMultiplier * tableMultiplier

        ########Special Item Multiplier#########

        # High lootzone Clothes (Ghillies...)
        if ("blueprint" in classname):
            sell_price = sell_price * 3
        # Level 3 Blueprints
        if ("valor_blueprint3" in classname or "valor_blueprint6" in classname):
            sell_price = sell_price * 2
        # Castle Blueprint
        if ("valor_blueprint7" in classname):
            sell_price = sell_price * 3
        
        ########Special Items#########
        
        #Set Fix price & Displayed Text if configured
        for i in specialItems:
            if i[0] == classname:
                if (i[1] == 0):
                    sell_price = i[2]
                displayText = i[6]
        
        if (displayText == None):
            displayText = classname

        ########Apply Price########

        if (sell_price < min_price):
            sell_price = min_price

        sell_price = refinePrice(sell_price)

        ########UPDATE########
        if not (classname in exists): #Insert new Element
            print(classname + " NEEDS TO BE INSERTED...")
            sqlCast("INSERT INTO `item_sell_prices_test` (`classname`, `displaytext`, `price`, `type`) VALUES ('" + str(classname) + "', '" + displayText + "', " + format(sell_price, '.6f') + ", '" + itemType + "')")
        else: #Update price value
            sqlCast("UPDATE `item_sell_prices_test` SET `price` = " + format(sell_price, '.6f') + " WHERE `classname` = '" + classname + "'")
        
        print (" --- UPDATED    " + classname + " ---")


except Error as e:
    print("Error reading data from MySQL table", e)
finally:
    print("==========================")
    print("PRICE CALCULATION FINISHED")
    print("==========================")
    if (connection.is_connected()):
        connection.close()
        print("MySQL connection is closed")
