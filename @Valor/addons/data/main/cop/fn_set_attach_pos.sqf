private ["_veh","_classname_attach_object","_str_text","_place_id","_cancel_id","_replace_id","_attach_pos"];


_veh = param[0,objNull,[objNull]];

if(isnull _veh) exitWith {};
if!(playerside isEqualTo opfor) exitWith {};
if(isnil "VALOR_IN_TRADER") exitWith {};

_classname_attach_object = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "classname_siren");
if(_classname_attach_object isEqualTo "") exitWith {};

VALOR_SIREN = _classname_attach_object createVehicle [0,0,0];
VALOR_SIREN allowDamage false;
VALOR_ATTACH_VEHICLE = _veh;

VALOR_SIREN_PLACE_Y = 0;
Valor_siren_place_Z = 1.5;

VALOR_SIREN attachto[_veh,[0,VALOR_SIREN_PLACE_Y,Valor_siren_place_Z]];
VALOR_SIREN setdir 0;


_str_text = (findDisplay 46) ctrlCreate ["RscStructuredText", -1];
_str_text ctrlSetPosition [0.5505,0.6936,0.521715,0.70606];
_str_text ctrlSetStructuredText parsetext format["<t color='%1' size='1'>Page UP</t> - Raise Object  <br/><t size='1' color='%1'>Page DOWN</t> - Lower Object <br/><t color='%1' size='1'>POS 1</t> - Move object forward  <br/><t color='%1' size='1'>END</t> - Move object backwards  <br/>","#0007D8"];
_str_text ctrlCommit 0;


_place_id = player addaction["Place Object",{VALOR_SIREN_PLACED = true;}];
_cancel_id = player addaction["Cancel",{VALOR_SIREN_PLACED = false;}];


waitUntil {!isnil "VALOR_SIREN_PLACED"};

player removeAction _place_id;
player removeAction _cancel_id;

if!(VALOR_SIREN_PLACED) exitWith {
	ctrlDelete _str_text;
	deleteVehicle VALOR_SIREN;
	VALOR_SIREN_PLACE_Y = nil;
	Valor_siren_place_Z = nil;
	VALOR_SIREN = nil;
	VALOR_ATTACH_VEHICLE = nil;
	VALOR_SIREN_PLACED = nil;
};

VALOR_SIREN_PLACED = nil;

sleep 0.1;

_place_id = player addaction["Confirm Placement",{VALOR_SIREN_PLACED = 1;}];
_replace_id = player addaction["Replace",{VALOR_SIREN_PLACED = "Replace";}];
_cancel_id = player addaction["Cancel",{VALOR_SIREN_PLACED = false;}];

waitUntil {!isnil "VALOR_SIREN_PLACED"};

player removeAction _place_id;
player removeAction _replace_id;
player removeAction _cancel_id;

if(VALOR_SIREN_PLACED isEqualTo false) exitWith {
	ctrlDelete _str_text;
	deleteVehicle VALOR_SIREN;
	VALOR_SIREN_PLACE_Y = nil;
	Valor_siren_place_Z = nil;
	VALOR_SIREN = nil;
	VALOR_ATTACH_VEHICLE = nil;
	VALOR_SIREN_PLACED = nil;
};

if(VALOR_SIREN_PLACED isEqualTo "Replace") exitWith {
	ctrlDelete _str_text;
	deleteVehicle VALOR_SIREN;
	VALOR_SIREN_PLACE_Y = nil;
	Valor_siren_place_Z = nil;
	VALOR_SIREN = nil;
	VALOR_ATTACH_VEHICLE = nil;
	VALOR_SIREN_PLACED = nil;
	sleep 0.1;
	[_veh] spawn valor_fn_set_attach_pos;
};

_attach_pos = [0,VALOR_SIREN_PLACE_Y,Valor_siren_place_Z];
_id = _veh getvariable["DBID",-1];
if(_id isEqualTo -1) exitWith {["ERROR: DBID unknown"] spawn valor_fnC_exp_hint;};


[[0,_id,_attach_pos],"valor_fnc_update_attach_pos",2] call valor_fnc_remoteexec;

ctrlDelete _str_text;
VALOR_SIREN_PLACE_Y = nil;
Valor_siren_place_Z = nil;
VALOR_SIREN = nil;
VALOR_ATTACH_VEHICLE = nil;
VALOR_SIREN_PLACED = nil;