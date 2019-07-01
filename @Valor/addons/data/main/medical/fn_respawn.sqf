


private ["_marker","_pos","_radius","_pos_spawn"];
valor_hunger = 100;
valor_thirst = 100;
Valor_cash = 0;
valor_gear = [];
[Valor_gear] spawn valor_fnc_VAR_to_gear;
waitUntil {!isnil "Valor_gear_loaded"};


player setvariable["revived",nil,true];
player setvariable["reviving",nil,true];


closeDialog 0;
valor_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy valor_deathCamera;

0 call valor_fnc_openLoadingScreen;

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
valor_alive = 1;
[] call valor_fnc_syncPlayerToDB;
[] call valor_fnc_closeLoadingScreen;