
private ["_requester","_classname","_stock","_price","_shop","_type","_query"];
_requester = param[0,objNull,[objnull]];
_classname = param[1,"",[""]];
_table_type = param[2,"",[""]];

if(_classname isEqualTo "" || isnull _requester || _table_type isEqualTo "") exitWith {
	format["VALOR ERROR :: Could not insert %1 into the DB",_classname] remoteExec["systemChat",_requester];
};
_query = "";

_query = format["Insert into loottable_houses (classname,table_type) VALUES ('%1','%2')", _classname,_table_type];

[_query,1] call valor_fnc_db_sync;

format["VALOR :: Inserted %1 into the DB",_classname] remoteExec["systemChat",_requester];


