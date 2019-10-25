
private ["_jailtime","_markerpos","_time","_distance","_next_crate","_var","_removed","_crate_add_weapon","_type_config"];

_jailtime = param[0,-1,[-1]];
if(_jailtime isEqualTo -1) exitWith {};
waitUntil {!isnil "valor_init_done"};
Valor_thirst = 100;
Valor_hunger = 100;

_markerpos = getMarkerPos "cop_jail";
player setposatl _markerpos;
valor_arrested = 1;
[7] call valor_fnc_step_update;
_jailtime = _jailtime * 60;
_time = servertime + _jailtime;
_distance = 5;
player setvariable["valor_restrained",nil,true];
_next_crate = (nearestObjects[player,["valor_CargoNet"],120]) select {_var = nil; _var = _x getVariable "cop"; !isnil "_var"};
if!(_next_crate isEqualTo []) then {
	_next_crate = _next_crate select 0;
};
_removed = false;
_crate_add_weapon = {if(typename _next_crate isEqualTo "ARRAY") exitWith {};_next_crate addWeaponCargoGlobal[_this,1];_removed = true;};
if!((primaryWeapon player) isEqualTo "") then {
	(primaryWeapon player) call _crate_add_weapon;
	player removeWeapon (primaryWeapon player);
};
if!((secondaryWeapon player) isEqualTo "") then {
	(secondaryWeapon player) call _crate_add_weapon;
	player removeWeapon (secondaryWeapon player);
};
if!((handgunWeapon player) isEqualTo "") then {
	(handgunWeapon player) call _crate_add_weapon;
	player removeWeapon (handgunWeapon player);
};

{
	if(isclass(configFile >> "CfgWeapons" >> _x)) then {
		_type_config = getnumber(configFile >> "CfgWeapons" >> _x >> "type");
		if(_type_config in [1,2,4]) then {
			_x call _crate_add_weapon;
			player removeItemFromUniform _x;
		};
	};
} foreach (uniformitems player);

{
	if(isclass(configFile >> "CfgWeapons" >> _x)) then {
		_type_config = getnumber(configFile >> "CfgWeapons" >> _x >> "type");
		if(_type_config in [1,2,4]) then {
			_x call _crate_add_weapon;
			player removeItemFromVest _x;
		};
	};
} foreach (vestItems player);

{
	if(isclass(configFile >> "CfgWeapons" >> _x)) then {
		_type_config = getnumber(configFile >> "CfgWeapons" >> _x >> "type");
		if(_type_config in [1,2,4]) then {
			_x call _crate_add_weapon;
			player removeItemFromBackpack _x;
		};
	};
} foreach (backpackItems player);

if(_removed) then {
	[[_next_crate,1],"valor_fnc_savecrate",2] call valor_fnc_remoteexec;
};

while{(_time - servertime) > 0} do {
	hintsilent parseText format[" <t size='1.1' align='center'>Time left:</t><br/><t size='1.4' align='center'>%1</t>",[(_time - servertime), "MM:SS.MS"] call BIS_fnc_secondsToString];
	if(((player distance _markerpos) > _distance) && alive player) exitWith { };
	if(!alive player) exitWith {};
	sleep 0.09;
};
hintSilent "";
valor_arrested = 0;
[7] call valor_fnc_step_update;
if!(alive player) exitWith {};
if(player distance _markerpos > _distance) exitWith { ["You escaped the jail"] spawn valor_fnc_exp_hint;(format["Valor :: %1 escaped the jail.",profileName]) remoteExec["systemChat",opfor]};
["You are free now"] spawn valor_fnc_exp_hint;
player setposatl (getMarkerPos "cop_respawn");

