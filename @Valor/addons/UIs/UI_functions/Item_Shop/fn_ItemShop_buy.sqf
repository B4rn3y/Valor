private ["_display","_header","_listbox","_buy_sell_BTN","_switch_BTN","_str_text_name","_str_text_stock","_str_text_Price","_index","_btn_text","_box","_data","_DB_ID","_classname","_price","_stock","_type","_config","_can_pay","_new_stock","_man_close","_actual_man"];


disableSerialization;
_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_tree = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;

if(isnull _display) exitWith {};
_index = tvCurSel _tree;
if(_index isEqualTo []) exitWith {};


_box = (getposatl player) nearestobject "B_supplyCrate_F";
if(isnull _box) exitWith {hint "Error :: Could not find the Lootbox"};


_data = _tree tvData _index;
if(_data isEqualTo "") exitWith {};
//diag_log _data;
_buy_sell_BTN ctrlEnable false;
_data = call compile _data;
_DB_ID = _data select 0;
_classname = _data select 1;
_price = _data select 2;
_stock = _data select 3;
_type = _data select 4;
_config = _data select 5;
_infinite = _data select 6;

_can_pay = [_price,true] call valor_fnc_pay;

if!(_can_pay) exitWith{titletext[format["You are missing $%1 on your bank!",[((Valor_bankacc - _price)* -1)] call valor_fnc_numbertext],"PLAIN DOWN"]; _buy_sell_BTN ctrlEnable true;};

_new_stock = _stock - 1;
if(_new_stock <= 0 && _infinite isEqualTo 0) then {
	_tree tvDelete _index;
};

if(_new_stock < 0 && _infinite isEqualTo 1) then {
	_new_stock = 1;
};

if(_infinite isEqualTo 0) then {
	_man_close = nearestObjects[player,["MAN"],12];
	_man_close = _man_close - [player];
	_actual_man = [];

	_tree tvSetData[_index,str([_DB_ID,_classname,_price,_new_stock,_type,_config,_infinite])];
	//diag_log str([_DB_ID,_classname,_price,_new_stock,_type,_config,_infinite]);
	{if(isplayer _x) then {_actual_man pushback _x};} foreach _man_close;
	// remote to server

	[[_DB_ID,_new_stock],"valor_fnc_update_item_stock",2] call valor_fnc_remoteexec;
	//[_DB_ID,_new_stock] remoteexec["valor_fnc_update_item_stock",2];
	if(_actual_man isEqualTo []) exitWith {};
	// remote smth
	[_DB_ID,_new_stock] remoteExec["valor_fnc_update_item_stock_client",_actual_man];
};






switch (true) do
{
	case (_type in ["pweapon","sweapon","hweapon"]):
	{
		_box addWeaponCargo[_classname,1];
	};

	case (_type in ["backpack"]):
	{
		_box addBackpackCargo[_classname,1];
	};

	case (_type in ["magazine"]):
	{
		_box addMagazineCargo[_classname,1];
	};

	default
	{
		_box addItemCargo[_classname,1];
	};
};

_buy_sell_BTN ctrlEnable true;
titletext[format["You bought a %1 for $%2, check the Loot-BOX",getText(configFile >> _config >> _classname >> "displayName"),([_price] call valor_fnc_numbertext)],"PLAIN DOWN"];