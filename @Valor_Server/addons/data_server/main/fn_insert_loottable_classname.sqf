
private ["_requester","_classname","_stock","_price","_shop","_type","_query"];
_requester = param[0,objNull,[objnull]];
_classname = param[1,"",[""]];
_min_prob = param[2,-1,[0]];
_max_prob = param[3,-1,[0]];
_type = param[4,"",[""]];
_table_type = param[5,"",[""]];
_spawn_with = param[6,[],[[]]];

if(_classname isEqualTo "" || _min_prob isEqualTo -1 || _max_prob isEqualTo -1 || isnull _requester || _type isEqualTo "" || _table_type isEqualTo "" || _spawn_with isEqualTo []) exitWith {
	format["VALOR ERROR :: Could not insert %1 into the DB",_classname] remoteExec["systemChat",_requester];
};
_query = "";

_query = format["Insert into loottable_classnames (classname,min_prob,max_prob,type,table_type,spawn_with) VALUES ('%1','%2','%3','%4','%5','%6')", _classname,_min_prob,_max_prob,_type,_table_type,_spawn_with];

[_query,1] call valor_fnc_db_sync;

format["VALOR :: Inserted %1 into the DB",_classname] remoteExec["systemChat",_requester];


