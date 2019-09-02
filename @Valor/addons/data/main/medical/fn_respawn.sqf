private ["_init","_new_player_unit","_old_player_unit","_old_group","_marker","_pos","_radius","_pos_spawn"];



_init = param[0,false,[false]];

if!(_init) then {
	if((call valor_coplevel) isEqualTo 0 && playerside isEqualTo opfor) then {
		_new_player_unit = (createGroup opfor) createUnit["C_man_w_worker_F",player,[],0,"CAN_COLLIDE"];
		_old_player_unit = player;
		selectPlayer _new_player_unit;
		waitUntil {_new_player_unit isEqualTo player};
		deleteVehicle _old_player_unit;
	};
};

_old_group = group player;
[player] joinSilent (createGroup opfor);
deleteGroup _old_group;

Valor_poising = false;
Valor_radiation = 0;
valor_hunger = 100;
valor_thirst = 100;
Valor_cash = 0;
valor_gear = [];
valor_alive = 1;
[Valor_gear] spawn valor_fnc_VAR_to_gear;
waitUntil {!isnil "Valor_gear_loaded"};

if!(_init) then {
	player setvariable["revived",nil,true];
	player setvariable["reviving",nil,true];


	closeDialog 0;
	valor_deathCamera cameraEffect ["TERMINATE","BACK"];
	camDestroy valor_deathCamera;

	0 call valor_fnc_openLoadingScreen;

	if!(Valor_group isEqualTo []) then {
		player setVariable["Valor_group_id",[(Valor_group select 0),(Valor_group select 2)],true];
	} else {
		player setVariable["Valor_group_id",[-1,"ERROR"],true];
	};

	0 spawn valor_fnc_init_skills;  // init the skills

	0 call valor_fnc_setupHUD;  // setup HUD

	if(getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "fatigue_enabled") isEqualTo 0) then {player enableFatigue false;} else {player enableFatigue true;};
	player addEventHandler["GetInMan",{_this spawn valor_fnc_GetInEVH}];
	player addEventHandler["Killed", {_this spawn valor_fnc_onPlayerKilled}];
	player addEventHandler["handleDamage",{}];
	player addEventHandler["Respawn", {}];
	player addEventHandler["InventoryClosed", {_this call valor_fnc_inventory_closed}];
	player addEventHandler["InventoryOpened", {_this spawn valor_fnc_inventory_opened}];
	player addEventHandler["Put", {_this call valor_fnc_on_put}];
	player addEventHandler["Take", {_this call valor_fnc_on_take}];
	player addEventHandler["GetOutMan",{_this call valor_fnc_GetOutMan}];
	player removeAllMPEventHandlers "MPHit";
	player removeAllMPEventHandlers "MPKilled";
	player removeAllMPEventHandlers "MPRespawn";
};

switch (playerside) do
{
	case opfor:
	{
		_marker = getarray(missionConfigFile >> "Valor_settings" >> "Spawn_Points" >> "opfor_spawnPoints");
		_marker = selectRandom _marker;
		player setposatl (getmarkerpos _marker);

	};

	case civilian:
	{
		_marker = getarray(missionConfigFile >> "Valor_settings" >> "Spawn_Points" >> "civilian_spawnPoints");
		_marker = selectRandom _marker;
		_pos = getmarkerpos (_marker select 0);
		_radius = _marker select 1;
		_pos_spawn = [_pos, 0, _radius, 1, 0, 20, 1] call BIS_fnc_findSafePos;
		_pos_spawn pushback 0;
		player setposatl _pos_spawn;
	};
};




[] call valor_fnc_syncPlayerToDB;

[_init] call valor_fnc_closeLoadingScreen;