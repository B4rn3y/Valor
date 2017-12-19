Valor_alive = 0;
[5] call valor_fnc_step_update;
disableUserInput true;
sleep random 1;
if!(isnil "Valor_Punishing") exitWith {};
Valor_Punishing = true;


cutText ["", "BLACK OUT", 3];
sleep 3.3;
playsound "Punish_melody";
player playAction "Salute";
sleep 5;
player setposatl [7358.6,9266.9,22.0882];
player setdir 123.866;






_position = [7356.95,9268.04,22.0882];
_dir = 123.454;
_guard = "C_man_w_worker_F" createVehiclelocal [0,0,0];
_guard setposatl _position;
waitUntil {_guard distance _position < 1};
_guard setdir _dir;


removeUniform _guard;
removeVest _guard;
removeBackpack _guard;
removeGoggles _guard;
removeHeadGear _guard;
RemoveAllWeapons _guard;



_guard addweapon "rhs_weap_ak74m_2mag_camo";
{_guard addPrimaryWeaponItem _x} foreach ["rhs_acc_dtk","rhs_acc_ekp8_02","rhs_30Rnd_545x39_AK"];
_guard addUniform "CUP_U_O_RUS_Gorka_Green";
_guard addVest "CUP_V_PMC_CIRAS_Black_Empty";
_guard addBackpack "B_Kitbag_rgr";
_guard addHeadgear "CUP_H_PMC_Cap_Back_EP_Tan";
_guard addGoggles "G_MM_bandana_worn_co";

_guard setVariable ["BIS_fnc_animalBehaviour_disable", true];
_guard setVariable ["BIS_enableRandomization", false];
{_guard disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","ANIM"];

_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_attachToObject setdir _dir;
_guard reveal _attachToObject;
_attachToObject disableCollisionWith _guard;
_guard disableCollisionWith _attachToObject;
_guard attachto[_attachToObject,[0,0,0]];
_guard switchMove "cargo_base_idle";
_guard addEventHandler["AnimDone", {(_this select 0) switchmove (_this select 1);}];
_guard allowdamage false;
_guard removeAllEventHandlers "HandleDamage";








valor_intro_cam = "camera" camCreate [0, 0, 0];
valor_intro_cam cameraEffect ["Internal", "BACK"];
valor_intro_cam camSetFocus [-1, -1];
showCinemaBorder false;
valor_intro_cam camCommit 0;
valor_intro_cam camSetTarget player;
valor_intro_cam camSetPos [7360.78,9265.46,1.00137329];
valor_intro_cam camCommit 0;
cutText ["", "BLACK IN", 2];
sleep 2;

valor_intro_cam camSetPos [7360.78,9265.46,22.90137329];
valor_intro_cam camCommit 7;
sleep 10;

valor_intro_cam camSetTarget [7360.78,9265.47,1.00137329];
valor_intro_cam camSetPos [7360.78,9265.46,24.60137329];
valor_intro_cam camCommit 3;
sleep 3;
valor_intro_cam camSetPos [7360.78,9265.46,90.60137329];
valor_intro_cam camSetTarget [7359.61,9266.26,0.00143433];
valor_intro_cam camCommit 7;

cutText ["", "BLACK OUT", 6.5];
sleep 7;

deleteVehicle _guard;
_position = [7356.95,9268.04,22.0882];
_dir = 128.454;
_priest = "C_man_w_worker_F" createVehiclelocal [0,0,0];
_priest setposatl _position;
waitUntil {_priest distance _position < 1};
_priest setdir _dir;
player setdir (123.866 + 180);

removeUniform _priest;
removeVest _priest;
removeBackpack _priest;
removeGoggles _priest;
removeHeadGear _priest;
RemoveAllWeapons _priest;





_priest addUniform "CUP_U_C_Priest_01";


_priest setVariable ["BIS_fnc_animalBehaviour_disable", true];
_priest setVariable ["BIS_enableRandomization", false];
{_priest disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","ANIM"];

_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_attachToObject setdir _dir;
_priest reveal _attachToObject;
_attachToObject disableCollisionWith _priest;
_priest disableCollisionWith _attachToObject;
_priest attachto[_attachToObject,[0,0,0]];
_priest switchMove "Acts_Kore_IdleNoWeapon_loop";
_priest allowdamage false;
_priest removeAllEventHandlers "HandleDamage";
_priest addEventHandler["AnimDone", {(_this select 0) switchmove (_this select 1);}];






sleep 2;
valor_intro_cam camSetTarget [7357.58,9267.76,23.394];
valor_intro_cam camSetPos [7357.15,9265.47,23.3442];
valor_intro_cam camCommit 0;
cutText ["", "BLACK IN", 3];



valor_intro_cam camSetPos [7355.37,9266.83,23.3535];
valor_intro_cam camCommit 7;
sleep 4;
cutText ["", "BLACK OUT", 2.8];
sleep 3;
deleteVehicle _priest;


_position = [7356.95,9268.04,22.0882];
_dir = 123.454;
_guard = "C_man_w_worker_F" createVehiclelocal [0,0,0];
_guard setposatl _position;
waitUntil {_guard distance _position < 1};
_guard setdir _dir;


removeUniform _guard;
removeVest _guard;
removeBackpack _guard;
removeGoggles _guard;
removeHeadGear _guard;
RemoveAllWeapons _guard;



_guard addweapon "rhs_weap_ak74m_2mag_camo";
{_guard addPrimaryWeaponItem _x} foreach ["rhs_acc_dtk","rhs_acc_ekp8_02","rhs_30Rnd_545x39_AK"];
_guard addUniform "CUP_U_O_RUS_Gorka_Green";
_guard addVest "CUP_V_PMC_CIRAS_Black_Empty";
_guard addBackpack "B_Kitbag_rgr";
_guard addHeadgear "CUP_H_PMC_Cap_Back_EP_Tan";
_guard addGoggles "G_MM_bandana_worn_co";

_guard setVariable ["BIS_fnc_animalBehaviour_disable", true];
_guard setVariable ["BIS_enableRandomization", false];
{_guard disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","ANIM"];

_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_attachToObject setdir _dir;
_guard reveal _attachToObject;
_attachToObject disableCollisionWith _guard;
_guard disableCollisionWith _attachToObject;
_guard attachto[_attachToObject,[0,0,0]];
_guard switchMove "cargo_base_idle";
_guard addEventHandler["AnimDone", {(_this select 0) switchmove (_this select 1);}];
_guard allowdamage false;
_guard removeAllEventHandlers "HandleDamage";

player setdir 123.866;



valor_intro_cam camSetPos [7358.88,9257.96,1.2036];
valor_intro_cam camSetTarget player;
valor_intro_cam camCommit 0;
player playAction "CIVIL";
cutText ["", "BLACK IN", 3];
sleep 5;
player setVelocity [6,-2.75,1];
if!(isDamageAllowed player) then {player allowDamage true;};
_w8 = diag_ticktime + 20;
waitUntil {if(diag_tickTime > _w8) exitWith {true};!(alive player);};
if(alive player) then {player setdamage 1;};
Valor_Punishing = nil;
deleteVehicle _guard;
valor_intro_cam cameraEffect ["TERMINATE","BACK"];
camDestroy valor_intro_cam;
disableUserInput false;
