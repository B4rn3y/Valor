

_config_id = param[0,-1,[0]];


if(_config_id isEqualTo -1) exitWith {};



_query = format["Update outposts set build = '0' where config_id = '%1'",_config_id];
[_query,1] call valor_fnc_db_sync;


























