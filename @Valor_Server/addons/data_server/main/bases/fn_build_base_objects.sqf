



_base_id = param[0,-1,[0]];
_config_id = param[1,-1,[0]];
_gang_id = param[2,-1,[0]];


if(_base_id isEqualTo -1) exitWith {diag_log "Valor Error :: _base_id unknown"};
if(_config_id isEqualTo -1) exitWith {diag_log "Valor Error :: _config_id unknown"};
if(_gang_id isEqualTo -1) exitWith {diag_log "Valor Error :: _gang_id unknown"};


_query = format["Update bases set build = '1' where base_id = '%1'",_base_id];
[_query,1] call valor_fnc_db_sync;

























