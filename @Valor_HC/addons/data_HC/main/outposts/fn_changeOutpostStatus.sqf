

private ["_config_id","_outpost_id","_container","_pos_container","_query","_near_players","_man_close","_man","_veh_close","_time"];

_config_id = param[0,-1,[0]];
_outpost_id = param[1,-1,[0]];
_container = param[2,objNull,[objNull]];
_container enableSimulation false;
if(_container isEqualTo objNull) exitWith {diag_log "Valor Error :: _container unknown";_container enableSimulation true;};
if(_config_id isEqualTo -1) exitWith {};
if(_outpost_id isEqualTo -1) exitWith {};
if(missionNamespace getvariable[format["Outpost_build_ID_%1",_outpost_id],false]) exitWith {};
_pos_container = getposatl _container;

sleep random 5;
if(missionNamespace getvariable[format["Outpost_build_ID_%1",_outpost_id],false]) exitWith {};
missionNamespace setvariable[format["Outpost_build_ID_%1",_outpost_id],true];

deleteVehicle _container;


_query = format["Update outposts set build = '1', inventory = '[]' where config_id = '%1'",_config_id];
[_query,1] call valor_fnc_db_sync;

_ret = [_config_id] call valor_fnc_outpost_config;
_markertext = format["[Done] %1 Outpost",_ret select 5];
_markername = format["Valor_outpost_marker_%1",_config_id];
_markername setMarkerText _markertext;



_near_players = {
	_man_close = nearestobjects[_pos_container,["Man"],200];
	_man = [];
	{if(isplayer _x) then {_man pushback _x};} foreach _man_close;
	_man
};




_veh_close = nearestobjects[_pos_container,["Landvehicle","Air","Ship"],100];

"Valor Server :: The Server is waiting for all Vehicles to leave a radius of 100m around the crate to spawn the outpost. If this status cant be reached in 3 minutes the server is gonna spawn the outpost." remoteexec["valor_fnc_exp_hint",(call _near_players)];
_time = 0;
waitUntil{sleep 1; _time = _time + 1; if(_time >= 180) exitWith {}; _veh_close = nearestobjects[_pos_container,["Landvehicle","Air","Ship"],100]; _veh_close isEqualTo []};


[_outpost_id,_config_id] remoteexec["valor_fnc_upgrade_outpost",0];
























_outpost_id spawn {sleep 60;missionNamespace setvariable[format["Outpost_build_ID_%1",_this],nil];};