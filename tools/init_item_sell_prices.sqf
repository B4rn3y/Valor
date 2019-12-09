import mysql.connector
from mysql.connector import Error

connection = mysql.connector.connect(
    host='213.202.230.152',
    database='valor',
    user='admin',
    password='sdD5heWTGLp9SQKSFXJFsBKQE')

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

def createBlank():
    classes = []
    itemTypes = []
    
    sqlCast("TRUNCATE TABLE `item_sell_prices_test`")
    loottable_classnames = sqlExec("Select classname, type from loottable_classnames")
    item_sell_price_classnames = sqlExec("Select classname, displaytext from item_sell_prices")
    print (str(len(loottable_classnames)) + "   -   " + str(len(item_sell_price_classnames)))

    found = None
    for i in loottable_classnames:
        if not (i[0] in classes):
            classes.append(i[0])
            itemTypes.append(i[1])

    for index, i in enumerate(classes):
        print(str(index) + "  " + str(i))
        classname = i
        itemType = itemTypes[index]
        displayText = "empty"
        sql_modify_Query = "INSERT INTO `item_sell_prices_test` (`classname`, `displaytext`, `price`) VALUES ('" + str(classname) + "', '" + displayText + "', " + format(0, '.6f') + ")"
        cursor = connection.cursor()
        cursor.execute(sql_modify_Query)
        connection.commit()
        cursor.close()

def copyDisplayText():
    displaytexts = sqlExec("Select `classname`, `displaytext`, `type` from `item_sell_prices`")
    
    for i in displaytexts:
        sql_modify_Query = "UPDATE `item_sell_prices_test` SET `displaytext` = '" + str(i[1]) + "' WHERE `classname` = '" + str(i[0]) + "'"
        sqlCast(sql_modify_Query)
        sql_modify_Query = "UPDATE `item_sell_prices_test` SET `type` = '" + str(i[2]) + "' WHERE `classname` = '" + str(i[0]) + "'"
        sqlCast(sql_modify_Query)
        print (str(i[0]) + "  -  " + str(i[1]))

 

createBlank()
copyContentText()




