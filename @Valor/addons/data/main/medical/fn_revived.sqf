
private ["_unit","_dir","_pos","_new_player_unit","_old_player_unit","_old_old_player_unit","_old_group","_obj"];
_unit = param[0,objNull,[objNull]];
if(isnull _unit) exitWith {};
Valor_gear = [_unit] call valor_fnc_gear_to_VAR;
VALOR_CASH = _unit getvariable["cash",0];
_dir = getdir _unit;
_pos = visiblePositionASL _unit;

if((call valor_coplevel) isEqualTo 0 && playerside isEqualTo opfor) then {
	_new_player_unit = (createGroup opfor) createUnit["C_man_w_worker_F",player,[],0,"CAN_COLLIDE"];
	_old_player_unit = _unit;
	_old_old_player_unit = player;
	selectPlayer _new_player_unit;
	waitUntil {_new_player_unit isEqualTo player};
	_old_player_unit spawn {sleep 1; deleteVehicle _this};
	_old_old_player_unit spawn {sleep 1; deleteVehicle _this};
};

_old_group = group player;
[player] joinSilent (createGroup opfor);
deleteGroup _old_group;




[Valor_gear] spawn valor_fnc_VAR_to_gear;
waitUntil {!isnil "Valor_gear_loaded"};


player setvariable["revived",nil,true];
player setvariable["reviving",nil,true];

if!(Valor_group isEqualTo []) then {
	player setVariable["Valor_group_id",[(Valor_group select 0),(Valor_group select 2)],true];
} else {
	player setVariable["Valor_group_id",[-1,"ERROR"],true];
};

0 spawn valor_fnc_init_skills;  // init the skills


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

closeDialog 0;
valor_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy valor_deathCamera;

0 call valor_fnc_setupHUD;  // setup HUD

player setDir _dir;
player setPosASL _pos;

valor_alive =1;
0 call valor_fnc_syncPlayerToDB;
if(!(surfaceIsWater _pos))then{

	player setDamage 0.3;

	// spawn visual effects
	[] spawn {
		private["_obj"];
		player playMoveNow "Incapacitated";

		sleep 4;

		player playMoveNow "amovppnemstpsraswrfldnon";

	};

};

