

private ["_wall_id","_query"];

_wall_id = param[0,-1,[0]];
if(_wall_id isEqualTo -1) exitWith {};

_query = format["Delete from base_objects where id = '%1'",_wall_id];
[_query,1] call valor_fnc_db_sync;

