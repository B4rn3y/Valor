private ["_box1","_trader","_attachToObject","_position","_dir"];

// create box for item shop ["B_supplyCrate_F",[3789.1,8844.84,0],24.7621]
_box1 = "B_supplyCrate_F" createVehicleLocal [0,0,0];
_box1 setposatl [3789.1,8844.84,0];
_box1 setdir 24.7621;
_box1 allowdamage false;
[_box1] call valor_fnc_clear_vehicle;

// create box for item shop ["B_supplyCrate_F",[3789.1,8844.84,0],24.7621]
_box2 = "B_supplyCrate_F" createVehicleLocal [0,0,0];
_box2 setposatl [3833.52,8872.43,0.912323];
_box2 setdir 116.323;
_box2 allowdamage false;
[_box2] call valor_fnc_clear_vehicle;

// create box for item shop ["B_supplyCrate_F",[3789.1,8844.84,0],24.7621]  Bandit Trader
_box2 = "B_supplyCrate_F" createVehicleLocal [0,0,0];
_box2 setposatl [10325.3,12084.9,0.0193481];
_box2 setdir 258.022;
_box2 allowdamage false;
[_box2] call valor_fnc_clear_vehicle;

// create box for item shop ["B_supplyCrate_F",[3789.1,8844.84,0],24.7621]  Hero Trader
_box2 = "B_supplyCrate_F" createVehicleLocal [0,0,0];
_box2 setposatl [7348.22,9273.42,6.3038];
_box2 setdir 107.043;
_box2 allowdamage false;
[_box2] call valor_fnc_clear_vehicle;



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
_trader addaction["Carshop",valor_fnc_opencarshop,["survivor_city",[3840.02,8826.65,-0.00354004],24.357],1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player",20];



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

_trader addaction["Shop",valor_fnc_openItemShop,"cop_shop_1",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && (call valor_coplevel)>0",20];



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
//_trader addaction["Talk to",valor_fnc_openQuestMenu,nil,1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player",20];





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
_trader addaction["Shop",valor_fnc_openItemShop,"survivor_city",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player",20];
_trader addaction["Sell Inventory Items",valor_fnc_open_sell_player_items_menu,"survivor_city",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player",20];
_trader addaction["Sell Vehicle Items",valor_fnc_open_sell_vehicle_items_menu,"survivor_city",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player",20];
_trader addaction["Bank Menu",valor_fnc_open_bank_menu,"",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player",20];


_position = [3693.13,8550.28,0.00137329];
_dir = 318.524;
_trader = "CUP_C_C_Villager_01" createVehiclelocal [0,0,0];
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
_trader switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_8_loop";
_trader allowdamage false;
_trader removeAllEventHandlers "HandleDamage";
_trader addEventHandler["AnimDone", {(_this select 0) switchmove selectrandom["Acts_AidlPercMstpSnonWnonDnon_warmup_8_loop"];}];
_trader addaction["Sell Hay Bales",valor_fnc_sell_hay_bale,"",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player",20];



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


// Hero TRADER
_position = [7348.76,9270.63,6.32104];
_dir = 98.7462;
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
_trader addweapon "CUP_srifle_AS50";
{_trader addPrimaryWeaponItem _x} foreach ["optic_LRPS"];
_trader addUniform "CUP_I_B_PMC_Unit_5";
_trader addVest "CUP_V_PMC_CIRAS_Black_Empty";
//_trader addBackpack "CUP_B_USPack_Black";
_trader addHeadgear "H_Beret_Colonel";
_trader addGoggles "CUP_TK_NeckScarf";

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
_trader addaction["You are not a Hero!",{},"",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity < 5000",20];
_trader addaction["Hero Shop LVL 1",valor_fnc_openItemShop,"hero_shop_LVL_1",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity >= 3000 && Valor_humanity < 7500",20];
_trader addaction["Hero Shop LVL 2",valor_fnc_openItemShop,"hero_shop_LVL_2",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity >= 7500 && Valor_humanity < 10000",20];
_trader addaction["Hero Shop LVL 3",valor_fnc_openItemShop,"hero_shop_LVL_3",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity >= 10000",20];



// BANDIT TRADER
_position = [10323.8,12087.7,0.00119019];
_dir = 225.595;
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
_trader addweapon "CUP_srifle_M107_Base";
{_trader addPrimaryWeaponItem _x} foreach ["CUP_optic_Leupold_VX3"];
_trader addUniform "CUP_I_B_PMC_Unit_24";
_trader addVest "CUP_V_PMC_IOTV_Black_Empty";
_trader addBackpack "CUP_B_USPack_Black";
_trader addHeadgear "CUP_H_PMC_Cap_Back_PRR_Grey";
_trader addGoggles "G_Bandanna_beast";

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
_trader addaction["You are not a Bandit!",{},"",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity > 0",20];
_trader addaction["Bandit Shop LVL 1",valor_fnc_openItemShop,"bandit_shop_LVL_1",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity <= 2000 && Valor_humanity > -2500",20];
_trader addaction["Bandit Shop LVL 2",valor_fnc_openItemShop,"bandit_shop_LVL_2",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity <= -2500 && Valor_humanity > -5000",20];
_trader addaction["Bandit Shop LVL 3",valor_fnc_openItemShop,"bandit_shop_LVL_3",1.5,false,false,"","((_target distance player) <= 5) && vehicle player isEqualTo player && Valor_humanity <= -5000",20];

//GUARD S CITY



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






