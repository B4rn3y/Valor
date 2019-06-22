
closedialog 0;
_seller = param[3,[],["",[],objNull]]; // default in DB "survivor_camp"
if(_seller isEqualTo []) exitWith {systemChat "Valor Error :: No Seller Config specified!"};
_classname = typeof player;
Valor_gear = [player] call valor_fnc_gear_to_var;
hideObject player;
VALOR_PREVIEW_MODEL = _classname createVehicleLocal [0,0,0];
VALOR_PREVIEW_MODEL setposatl (player modelToWorld[0,-1,0]);
VALOR_PREVIEW_MODEL setdir (getdir player);

[Valor_gear,VALOR_PREVIEW_MODEL] call valor_fnc_VAR_to_gear_object;

// weapon type: 4-Launcher 2-hgun 1-PrimWeapon

valor_intro_cam = "camera" camCreate [0, 0, 0];
valor_intro_cam cameraEffect ["Internal", "BACK"];
valor_intro_cam camSetFocus [-1, -1];
showCinemaBorder false;
valor_intro_cam camCommit 0;
_pos = getposatl VALOR_PREVIEW_MODEL;
_pos set[2,0.9];
valor_intro_cam camSetTarget _pos;
valor_intro_cam camSetPos (player modelToWorld[0,2,1]);
valor_intro_cam camCommit 0;

disableSerialization;
if(!createDialog "Item_Shop") exitWith {systemChat "Valor Error :: Could not create the dialog!";valor_intro_cam cameraEffect ["TERMINATE","BACK"];camDestroy valor_intro_cam; deleteVehicle VALOR_PREVIEW_MODEL; player hideObject false;};
_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;
_str_text_name = _display displayCtrl 1100;
_str_text_stock = _display displayCtrl 1101;
_str_text_Price = _display displayCtrl 1102;
_listbox lbadd "Loading Items from server...";

_str_text_name ctrlSetStructuredText parseText " <t size='1.1' align='center'>Name</t> ";
_str_text_stock ctrlSetStructuredText parseText " <t size='1.1' align='center'>Stock</t> ";
_str_text_Price ctrlSetStructuredText parseText " <t size='1.1' align='center'>Price</t> ";

showChat false;

[_seller,player] remoteExec["valor_fnc_Itemshop_request",2];
Valor_last_added= [uniform player,"uniform"];
waitUntil {isnull(finddisplay 3007)};
valor_intro_cam cameraEffect ["TERMINATE","BACK"];
camDestroy valor_intro_cam;

if!(isnil "VALOR_PREVIEW_MODEL") then {
	deleteVehicle VALOR_PREVIEW_MODEL;
	VALOR_PREVIEW_MODEL = nil;
};
 player hideObject false;
showChat true;

Valor_last_added = nil;