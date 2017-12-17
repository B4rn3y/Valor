


private ["_trader","_attachToObject","_position","_dir"];
_position = [7326.21,9236,0.00143433];
_dir = 262.959;
_trader = "CUP_C_C_Worker_05" createVehiclelocal [0,0,0];
_trader setposatl _position;
waitUntil {_trader distance _position < 1};
_trader setdir _dir;

_trader addweapon "CUP_arifle_AK47";
removeGoggles _trader;
_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
_trader setVariable ["BIS_enableRandomization", false];
{_trader disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","ANIM"];

_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_attachToObject setdir _dir;
_trader reveal _attachToObject;
_attachToObject disableCollisionWith _trader;
_trader disableCollisionWith _attachToObject;
_trader attachto[_attachToObject,[0,0,0]];
_trader switchMove "Acts_carFixingWheel";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader addEventHandler["AnimDone", {(_this select 0) switchmove (_this select 1);}];





_position = [7285.06,9271.79,0.00164795];
_dir = 228.001;
_trader = "CUP_C_C_Woodlander_01" createVehiclelocal [0,0,0];
_trader setposatl _position;
waitUntil {_trader distance _position < 1};
_trader setdir _dir;

_trader addweapon "rhs_weap_ak74";
removeGoggles _trader;
_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
_trader setVariable ["BIS_enableRandomization", false];
{_trader disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","ANIM"];

_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_attachToObject setdir _dir;
_trader reveal _attachToObject;
_attachToObject disableCollisionWith _trader;
_trader disableCollisionWith _attachToObject;
_trader attachto[_attachToObject,[0,0,0]];
_trader switchMove "Acts_SittingWounded_loop";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader addEventHandler["AnimDone", {(_this select 0) switchmove (_this select 1);}];





_position = [7350.57,9270.7,7.04651];
_dir = 49.1908;
_trader = "CUP_C_C_Villager_03" createVehiclelocal [0,0,0];
_trader setposatl _position;
waitUntil {_trader distance _position < 1};
_trader setdir _dir;

_trader addweapon "CUP_arifle_AK74M";
removeGoggles _trader;
_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
_trader setVariable ["BIS_enableRandomization", false];
{_trader disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","ANIM"];

_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_attachToObject setdir _dir;
_trader reveal _attachToObject;
_attachToObject disableCollisionWith _trader;
_trader disableCollisionWith _attachToObject;
_trader attachto[_attachToObject,[0,0,0]];
_trader switchMove "Acts_CivilShocked_1";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader addEventHandler["AnimDone", {(_this select 0) switchmove selectrandom["Acts_CivilShocked_1","Acts_CivilShocked_2"];}];


_position = [7285.07,9274.36,0.0017395];
_dir = 203.486;
_trader = "babe_raptor_2_F" createVehiclelocal [0,0,0];
_trader setposatl _position;
waitUntil {_trader distance _position < 1};
_trader setdir _dir;



_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
_trader setVariable ["BIS_enableRandomization", false];
{_trader disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","ANIM"];

_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_attachToObject setdir _dir;
_trader reveal _attachToObject;
_attachToObject disableCollisionWith _trader;
_trader disableCollisionWith _attachToObject;
_trader attachto[_attachToObject,[0,0,0]];
_trader switchMove "babe_raptor_idle";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader setvariable["counter",0];
_trader addEventHandler["AnimDone", {(_this select 0) switchmove (_this select 1);(_this select 0) setvariable["counter",(((_this select 0) getvariable["counter",0]) + 1)]; if(((_this select 0) getvariable["counter",0]) > 30) then {(_this select 0) say3d selectrandom["rap_1","rap_10","rap_11","rap_12","rap_13","rap_14","rap_15","rap_16","rap_17","rap_18","rap_19"]; (_this select 0) setvariable ["counter",0];};}];




