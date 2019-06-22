
private ["_requester","_classname","_stock","_price","_shop","_type","_query"];
_requester = param[0,objNull,[objnull]];
_classname = param[1,"",[""]];
_stock = param[2,0,[0]];
_price = param[3,-1,[-1]];
_shop = param[4,"survivor_city",["",[]]];
_type = param[5,"",[""]]; // VAlID "weapon" "item" "backpack" "magazine"

if(_classname isEqualTo "" || _price isEqualTo -1 || isnull _requester || _type isEqualTo "") exitWith {
	format["VALOR ERROR :: Could not insert %1 into the DB",_classname] remoteExec["systemChat",_requester];
};
_query = "";

_query = format["Insert into item_shop (classname,price,stock,seller,type) VALUES ('%1','%2','%3','%4','%5')",(str _classname),_price,_stock,[_shop],(str _type)];

[_query,1] call valor_fnc_db_sync;

format["VALOR ERROR :: Inserted %1 into the DB",_classname] remoteExec["systemChat",_requester];


