private ["_seller","_classname","_pos","_error","_display","_header","_tree","_tv","_buy_sell_BTN","_switch_BTN","_box"];
if(isnil "VALOR_PREVIEW_MODEL") then {
	closedialog 0;
};
_seller = param[3,[],["",[],objNull]]; // default in DB "survivor_camp"
VALOR_SELLER_SHOP = _seller;
if(_seller isEqualTo []) exitWith {systemChat "Valor Error :: No Seller Config specified!"};
_classname = typeof player;
Valor_gear = [player] call valor_fnc_gear_to_var;
hideObject player;
if(isnil "VALOR_PREVIEW_MODEL") then {
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
	_pos set[2,(_pos select 2)+0.9];
	valor_intro_cam camSetTarget _pos;
	valor_intro_cam camSetPos (player modelToWorld[0,2,1]);
	valor_intro_cam camCommit 0;

};



_error = false;
disableSerialization;
if(isnull (findDisplay 3007)) then {
	if(!createDialog "Item_Shop") exitWith {_error = true;};
};

if(_error) exitWith{systemChat "Valor Error :: Could not create the dialog!";valor_intro_cam cameraEffect ["TERMINATE","BACK"];camDestroy valor_intro_cam; deleteVehicle VALOR_PREVIEW_MODEL; player hideObject false;};



_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_tree = _display displayCtrl 1500;
iF(isnull _tree) then {
	_tree = (finddisplay 3007) ctrlCreate ["RscTreeSearch", 1500];
	_tree ctrlSetFont "PuristaMedium";
	_tree ctrlSetFontHeight 0.04;
	_tree ctrlSetPosition [0.00507843 * safezoneW + safezoneX,0.0324073 * safezoneH + safezoneY,0.236799 * safezoneW,0.899444 * safezoneH];
	_tree ctrlSetBackgroundColor [0,0,0,0.25];
	_tree ctrlCommit 0;
	//_tv ctrlAddEventHandler ["TreeDblClick","_this spawn {}"];

};
tvClear _tree;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;
tvClear _tree;
_tree tvadd[[], "Loading Items from server..."];
_buy_sell_BTN ctrlSetText "BUY";
_buy_sell_BTN ctrlRemoveAllEventHandlers "ButtonClick";
_buy_sell_BTN ctrlSetEventHandler ["ButtonClick","[] spawn valor_fnc_ItemShop_buy;"];


[[_seller,player],"valor_fnc_Itemshop_request",2] call valor_fnc_remoteexec;
//[_seller,player] remoteExec["valor_fnc_Itemshop_request",2];

showChat false;
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
VALOR_SELLER_SHOP = nil;



if!(isnil "Valor_Notice_Loot_box") exitWith {};

0 spawn {
	Valor_Notice_Loot_box = true;
	_box = (getposatl player) nearestobject "B_supplyCrate_F";
	if(isnull _box) exitWith {hint "Error :: Could not find the Lootbox"};
	Valor_box = _box;


	["Hint_LootBox",
		{
			if!(isnil "Valor_box") then {
				drawIcon3D ["", [1,1,1,1], (Valor_box modelToWorld [0,0,1]), 0, 0, 0, "Loot-Box", 1, 0.05, "PuristaMedium"];
			};

		}
	] call valor_fnc_stackOnEachFrame;

	sleep 30;

	["Hint_LootBox",{}] call valor_fnc_stackOnEachFrame;

};



