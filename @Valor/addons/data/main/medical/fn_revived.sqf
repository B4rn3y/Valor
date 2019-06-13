
private ["_unit","_obj"];
_unit = param[0,objNull,[objNull]];
if(isnull _unit) exitWith {};

Valor_gear = [_unit] call valor_fnc_gear_to_VAR;
[Valor_gear] spawn valor_fnc_VAR_to_gear;
waitUntil {!isnil "Valor_gear_loaded"};


player setvariable["revived",nil,true];
player setvariable["reviving",nil,true];

closeDialog 0;
valor_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy valor_deathCamera;

player setDir (getdir _unit);
player setPosASL (visiblePositionASL _unit);
deleteVehicle _unit;
valor_alive =1;
0 call valor_fnc_syncPlayerToDB;
if(!(surfaceIsWater (visiblePositionASL player)))then{

	player setDamage 0.3;

	// spawn visual effects
	[] spawn {
		private["_obj"];
		player playMoveNow "Incapacitated";

		sleep 4;

		player playMoveNow "amovppnemstpsraswrfldnon";

	};

};

