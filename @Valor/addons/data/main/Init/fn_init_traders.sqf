private ["_box1","_trader","_attachToObject","_position","_dir"];

// create box for item shop ["B_supplyCrate_F",[3789.1,8844.84,0],24.7621]
_box1 = "B_supplyCrate_F" createVehicleLocal [0,0,0];
_box1 setposatl [3789.1,8844.84,0];
_box1 setdir 24.7621;
_box1 allowdamage false;
[_box1] call valor_fnc_clear_vehicle;


private ["_trader","_attachToObject","_position","_dir"];
_position = [3787.37,8838.06,0.00149536];
_dir = 267.165;
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
_trader addaction["Carshop",valor_fnc_opencarshop,["survivor_city",[3835.22,8835.58,0.00442505],26]];



_position = [3838.7,8878.4,0.903809];
_dir = 207;
_trader = "C_man_w_worker_F" createVehiclelocal [0,0,0];
_trader setposatl _position;
waitUntil {_trader distance _position < 1};
_trader setdir _dir;

removeUniform _trader;
removeVest _trader;
removeBackpack _trader;
removeGoggles _trader;
removeHeadGear _trader;
RemoveAllWeapons _trader;

_trader addweapon "rhs_weap_ak74m_2mag_camo";
{_trader addPrimaryWeaponItem _x} foreach ["rhs_acc_dtk","rhs_acc_ekp8_02","rhs_30Rnd_545x39_AK"];
_trader addUniform "CUP_U_O_RUS_Gorka_Green";
_trader addVest "CUP_V_PMC_CIRAS_Black_Empty";
_trader addBackpack "B_Kitbag_rgr";
_trader addHeadgear "CUP_H_PMC_Cap_Back_EP_Tan";
_trader addGoggles "G_MM_bandana_worn_co";

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
_trader switchMove "AidlPercMstpSrasWrflDnon_G01";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader addEventHandler["AnimDone", {(_this select 0) switchmove selectrandom["AidlPercMstpSrasWrflDnon_G01","AidlPercMstpSrasWrflDnon_G02","AidlPercMstpSrasWrflDnon_G03","AidlPercMstpSrasWrflDnon_G04"];}];
_trader addaction["Object Shop",{}];
_trader addaction["Shop",valor_fnc_openItemShop,"cop_shop_1"];



_position = [3801.65,8827.84,0.00143433];
_dir = 332.472;
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
_trader setvariable["Quest_Queue",0];
_trader addaction["Talk to",valor_fnc_openQuestMenu];





_position = [3788.19,8847.31,0.57077];
_dir = 115.727;
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
_trader addaction["Shop",valor_fnc_openItemShop,"survivor_city"];


_position = [3799.74,8827.1,0.00146484];
_dir = 27;
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







_position = [3810.17,8842.8,0.00143433];
_dir = 292;
_trader = "C_man_w_worker_F" createVehiclelocal [0,0,0];
_trader setposatl _position;
waitUntil {_trader distance _position < 1};
_trader setdir _dir;


removeUniform _trader;
removeVest _trader;
removeBackpack _trader;
removeGoggles _trader;
removeHeadGear _trader;
RemoveAllWeapons _trader;


// AidlPercMstpSrasWrflDnon_G01 AidlPercMstpSrasWrflDnon_G02 AidlPercMstpSrasWrflDnon_G03 AidlPercMstpSrasWrflDnon_G04

// acts_millerIdle Acts_JetsOfficerSpilling Acts_JetsCrewaidRCrouch_loop_m Acts_JetsCrewaidR_idle
_trader addweapon "rhs_weap_ak74m_2mag_camo";
{_trader addPrimaryWeaponItem _x} foreach ["rhs_acc_dtk","rhs_acc_ekp8_02","rhs_30Rnd_545x39_AK"];
_trader addUniform "CUP_U_O_RUS_Gorka_Green";
_trader addVest "CUP_V_PMC_CIRAS_Black_Empty";
_trader addBackpack "B_Kitbag_rgr";
_trader addHeadgear "CUP_H_PMC_Cap_Back_EP_Tan";
_trader addGoggles "G_MM_bandana_worn_co";

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
_trader switchMove "AidlPercMstpSrasWrflDnon_G02";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader addEventHandler["AnimDone", {(_this select 0) switchmove selectrandom["AidlPercMstpSrasWrflDnon_G01","AidlPercMstpSrasWrflDnon_G02","AidlPercMstpSrasWrflDnon_G03","AidlPercMstpSrasWrflDnon_G04"];}];




_position = [3805.76,8834.59,0.00143433];
_dir = 301;
_trader = "C_man_w_worker_F" createVehiclelocal [0,0,0];
_trader setposatl _position;
waitUntil {_trader distance _position < 1};
_trader setdir _dir;


removeUniform _trader;
removeVest _trader;
removeBackpack _trader;
removeGoggles _trader;
removeHeadGear _trader;
RemoveAllWeapons _trader;



_trader addweapon "rhs_weap_ak74m_2mag_camo";
{_trader addPrimaryWeaponItem _x} foreach ["rhs_acc_dtk","rhs_acc_ekp8_02","rhs_30Rnd_545x39_AK"];
_trader addUniform "CUP_U_O_RUS_Gorka_Green";
_trader addVest "CUP_V_PMC_CIRAS_Black_Empty";
_trader addBackpack "B_Kitbag_rgr";
_trader addHeadgear "CUP_H_PMC_Cap_Back_EP_Tan";
_trader addGoggles "G_MM_bandana_worn_co";

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
_trader switchMove "AidlPercMstpSrasWrflDnon_G01";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader addEventHandler["AnimDone", {(_this select 0) switchmove selectrandom["AidlPercMstpSrasWrflDnon_G01","AidlPercMstpSrasWrflDnon_G02","AidlPercMstpSrasWrflDnon_G03","AidlPercMstpSrasWrflDnon_G04"];}];






