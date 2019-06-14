


private ["_container","_base_id","_config_id","_gang_id","_requester","_query","_pos_container","_near_players","_man_close","_man","_veh_close","_time"];

_container = param[0,objNull,[objNull]];
_container enableSimulation false;
_base_id = param[1,-1,[0]];
_config_id = param[2,-1,[0]];
_gang_id = param[3,-1,[0]];
_requester = param[4,objNull,[objNull]];

if(_base_id isEqualTo -1) exitWith {diag_log "Valor Error :: _base_id unknown";_container enableSimulation true;};
if(_config_id isEqualTo -1) exitWith {diag_log "Valor Error :: _config_id unknown";_container enableSimulation true;};
if(_gang_id isEqualTo -1) exitWith {diag_log "Valor Error :: _gang_id unknown";_container enableSimulation true;};
if(_requester isEqualTo objNull) exitWith {diag_log "Valor Error :: _requester unknown";_container enableSimulation true;};
if(_container isEqualTo objNull) exitWith {diag_log "Valor Error :: _container unknown";_container enableSimulation true;};
if(missionNamespace getvariable[format["Base_build_ID_%1",_base_id],false]) exitWith {};
_pos_container = getposatl _container;
deleteVehicle _container;
sleep random 5;
if(missionNamespace getvariable[format["Base_build_ID_%1",_base_id],false]) exitWith {};
missionNamespace setvariable[format["Base_build_ID_%1",_base_id],true];
_query = format["Update bases set build = '1' where base_id = '%1'",_base_id];
[_query,1] call valor_fnc_db_sync;


_near_players = {
	_man_close = nearestobjects[_pos_container,["Man"],200];
	_man = [];
	{if(isplayer _x) then {_man pushback _x};} foreach _man_close;
	_man
};




_veh_close = nearestobjects[_pos_container,["Landvehicle","Air","Ship"],100];

"Valor Server :: The Server is waiting for all Vehicles to leave a radius of 100m around the crate to spawn the base. If this status cant be reached in 3 minutes the server is gonna spawn the base." remoteexec["systemchat",(call _near_players)];
_time = 0;
waitUntil{sleep 1; _time = _time + 1; if(_time >= 180) exitWith {}; _veh_close = nearestobjects[_pos_container,["Landvehicle","Air","Ship"],100]; _veh_close isEqualTo []};



{
	deleteVehicle _x;
} foreach (nearestObjects[_pos_container,["Land_CncBarrierMedium_F"],10]);


"Valor Server :: The Server is now starting building the base." remoteexec["systemchat",(call _near_players)];
[_base_id,_config_id,_gang_id,0,"babe_raptorb_east_5_F"] spawn valor_fnc_build_base_objects;


_base_id spawn {sleep 60;missionNamespace setvariable[format["Base_build_ID_%1",_this],nil];};






















