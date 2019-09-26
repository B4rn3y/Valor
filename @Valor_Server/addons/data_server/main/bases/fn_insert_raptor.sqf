

private ["_base_id","_query"];

_base_id = param[0,-1,[0]];
_pos = param[1,[],[[]]];
_group_id = param[2,objNull,[objNull]];
_config_id = param[3,-1,[0]];
_range = param[4,[10,50],[[]]];
if(_base_id isEqualTo -1) exitWith {diag_log "Valor ERROR :: Raptor insert Unknown _base_id"};
if(isnull _group_id) exitWith {diag_log "Valor ERROR :: Raptor insert Unknown _group_id"};
if(_config_id isEqualTo -1) exitWith {diag_log "Valor ERROR :: Raptor insert Unknown _config_id"};
if(_pos isEqualTo []) exitWith {diag_log "Valor ERROR :: Raptor insert Unknown _pos"};

_classname_raptor = selectrandom ["babe_raptorb_east_3_F","babe_raptorb_east_5_F","babe_raptorb_east_6_F","babe_raptorb_east_4_F","babe_raptorb_east_2_F","babe_raptor_east_6_F","babe_raptorb_east_F","babe_raptor_east_2_F","babe_raptor_east_3_F","babe_raptor_east_4_F","babe_raptor_east_5_F","babe_raptor_east_F"];


_query = format["Update bases set raptor = '1', raptor_classname = '%2' where base_id= '%1'",_base_id,str _classname_raptor];
[_query,1] call valor_fnc_db_sync;

[_classname_raptor,_pos,_group_id,_range] spawn valor_fnc_raptorMonitoring_server_group;























