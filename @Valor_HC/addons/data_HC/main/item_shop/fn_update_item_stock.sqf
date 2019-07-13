
private ["_DBID","_stock","_query"];
_DBID = param[0,-1,[13]];
_stock = param[1,-1,[13]];
if(_DBID isEqualTo -1 || _stock isEqualTo -1) exitWith {};

_query = format["Update item_shop set stock = '%1' where id = '%2';",_stock,_DBID];
[_query,1] call valor_fnc_db_sync;

