
private ["_requester","_classname","_stock","_price","_shop","_type","_query"];
_requester = param[0,objNull,[objnull]];
_classname = param[1,"",[""]];
_price = param[2,-1,[-1]];

if(_classname isEqualTo "" || _price isEqualTo -1 || isnull _requester ) exitWith {
	format["VALOR ERROR :: Could not insert %1 into the DB",_classname] remoteExec["systemChat",_requester];
};
_query = "";

_query = format["Insert into item_sell_prices (classname,price) VALUES ('%1','%2')",( _classname),_price];

[_query,1] call valor_fnc_db_sync;

format["VALOR SERVER :: Inserted %1 into the DB",_classname] remoteExec["systemChat",_requester];


