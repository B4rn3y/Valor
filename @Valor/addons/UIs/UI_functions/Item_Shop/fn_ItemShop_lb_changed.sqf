

//VALOR_PREVIEW_MODEL
private ["_display","_header","_listbox","_buy_sell_BTN","_switch_BTN","_str_text_name","_str_text_stock","_str_text_Price","_index","_btn_text","_data","_DB_ID","_classname","_price","_stock","_type","_config","_type_old","_classname_old","_replaced","_wep"];
disableSerialization;
_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;
_str_text_name = _display displayCtrl 1100;
_str_text_stock = _display displayCtrl 1101;
_str_text_Price = _display displayCtrl 1102;

if(isnull _display) exitWith {};
_index = lbCurSel _listbox;
if(_index isEqualTo -1) exitWith {};

_btn_text = ctrlText _buy_sell_BTN;

if!(_btn_text isEqualTo "BUY") exitWith {};

if(isnil "VALOR_PREVIEW_MODEL") exitWith {},
if(isnull VALOR_PREVIEW_MODEL) exitWith {};

_data = _listbox lbdata _index;
if(_data isEqualTo "") exitWith {};

_data = call compile _data;
_DB_ID = _data select 0;
_classname = _data select 1;
_price = _data select 2;
_stock = _data select 3;
_type = _data select 4;
_config = _data select 5;



_type_old = Valor_last_added select 1;
_classname_old = Valor_last_added select 0;
_replaced = false;
if!(_type_old isEqualTo _type) then {
	_replaced = true;
	switch (_type_old) do
	{
		case "pweapon":
		{
			_wep = primaryWeapon VALOR_PREVIEW_MODEL;
			if!(_wep isEqualTo "") then {
				VALOR_PREVIEW_MODEL removeWeapon _wep;
			};
			VALOR_PREVIEW_MODEL addWeapon _classname_old;
		};

		case "sweapon":
		{
			_wep = secondaryWeapon VALOR_PREVIEW_MODEL;
			if!(_wep isEqualTo "") then {
				VALOR_PREVIEW_MODEL removeWeapon _wep;
			};
			VALOR_PREVIEW_MODEL addWeapon _classname_old;
		};

		case "hweapon":
		{
			_wep = handgunWeapon VALOR_PREVIEW_MODEL;
			if!(_wep isEqualTo "") then {
				VALOR_PREVIEW_MODEL removeWeapon _wep;
			};
			VALOR_PREVIEW_MODEL addWeapon _classname_old;
		};

		case "uniform":
		{
			removeUniform VALOR_PREVIEW_MODEL;
			VALOR_PREVIEW_MODEL forceAddUniform _classname_old;
		};

		case "vest":
		{
			removeVest VALOR_PREVIEW_MODEL;
			VALOR_PREVIEW_MODEL addVest _classname_old;
		};

		case "backpack":
		{
			removeBackpack VALOR_PREVIEW_MODEL;
			VALOR_PREVIEW_MODEL addBackpack _classname_old;
		};

		case "headgear":
		{
			removeHeadgear VALOR_PREVIEW_MODEL;
			VALOR_PREVIEW_MODEL addHeadgear _classname_old;
		};

		case "goggles":
		{
			removeGoggles VALOR_PREVIEW_MODEL;
			VALOR_PREVIEW_MODEL addGoggles _classname_old;
		};
	};


};

if(_replaced) then {
	Valor_last_added = ["",_type];
};

switch (_type) do
{
	case "pweapon":
	{
		_wep = primaryWeapon VALOR_PREVIEW_MODEL;
		if(_replaced) then {
			Valor_last_added set[0,_wep];
		};
		if!(_wep isEqualTo "") then {
			VALOR_PREVIEW_MODEL removeWeapon _wep;
		};
		VALOR_PREVIEW_MODEL addWeapon _classname;
	};

	case "sweapon":
	{
		_wep = secondaryWeapon VALOR_PREVIEW_MODEL;
		if(_replaced) then {
			Valor_last_added set[0,_wep];
		};
		if!(_wep isEqualTo "") then {
			VALOR_PREVIEW_MODEL removeWeapon _wep;
		};
		VALOR_PREVIEW_MODEL addWeapon _classname;
	};

	case "hweapon":
	{
		_wep = handgunWeapon VALOR_PREVIEW_MODEL;
		if(_replaced) then {
			Valor_last_added set[0,_wep];
		};
		if!(_wep isEqualTo "") then {
			VALOR_PREVIEW_MODEL removeWeapon _wep;
		};
		VALOR_PREVIEW_MODEL addWeapon _classname;
	};

	case "uniform":
	{
		if(_replaced) then {
			Valor_last_added set[0,uniform VALOR_PREVIEW_MODEL];
		};
		removeUniform VALOR_PREVIEW_MODEL;
		VALOR_PREVIEW_MODEL forceAddUniform _classname;
	};

	case "vest":
	{
		if(_replaced) then {
			Valor_last_added set[0,vest VALOR_PREVIEW_MODEL];
		};
		removeVest VALOR_PREVIEW_MODEL;
		VALOR_PREVIEW_MODEL addVest _classname;
	};

	case "backpack":
	{
		if(_replaced) then {
			Valor_last_added set[0,backpack VALOR_PREVIEW_MODEL];
		};
		removeBackpack VALOR_PREVIEW_MODEL;
		VALOR_PREVIEW_MODEL addBackpack _classname;
	};

	case "headgear":
	{
		if(_replaced) then {
			Valor_last_added set[0,headgear VALOR_PREVIEW_MODEL];
		};
		removeHeadgear VALOR_PREVIEW_MODEL;
		VALOR_PREVIEW_MODEL addHeadgear _classname;
	};

	case "goggles":
	{
		if(_replaced) then {
			Valor_last_added set[0,goggles VALOR_PREVIEW_MODEL];
		};
		removeGoggles VALOR_PREVIEW_MODEL;
		VALOR_PREVIEW_MODEL addGoggles _classname;
	};
};






diag_log str Valor_last_added;


