
private ["_display","_header","_listbox","_buy_sell_BTN","_switch_BTN","_index","_btn_text","_data","_classname","_price","_config","_remove_id","_save","_foreachindex","_save_id","_find_classname_price","_search","_ret","_d","_dat","_price_extra"];

disableSerialization;
_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;

if(isnull _display) exitWith {};
_index = lbCurSel _listbox;
if(_index isEqualTo -1) exitWith {};

_btn_text = ctrlText _buy_sell_BTN;

if!(_btn_text isEqualTo "SELL") exitWith {};



_data = _listbox lbdata _index;
if(_data isEqualTo "") exitWith {};
_buy_sell_BTN ctrlEnable false;
_data = call compile _data;
_classname = _data select 0;
_price = _data select 1;
_config = _data select 2;

_remove_id = -1;

{
	_save = _foreachindex;
	if(typeName _x isEqualTo "STRING") then {
		if(_x isEqualTo _classname) exitWith {_remove_id = _foreachindex;};
	} else {
		{
			if(_x isEqualTo _classname) exitWith {_remove_id = [_save,_foreachindex];};
		} foreach _x;
	};

} foreach valor_gear;


if(_remove_id isEqualTo -1) exitWith {_buy_sell_BTN ctrlEnable true;titleText["The item could not be found in your inventory O.o","PLAIN DOWN"]};

_save_id = -1;
if(typeName _remove_id isEqualTo "ARRAY") then {
	_save_id = _remove_id select 1;
	_remove_id = _remove_id select 0;
};


_find_classname_price = {
	_search = _this;
	_ret = 0;
	for "_d" from 0 to (lbSize _listbox -1) do {
		_dat = _listbox lbData _d;
		_dat = call compile _dat;
		if((_dat select 0) isEqualTo _this) exitWith {_ret = _x select 1;};
	};
	_ret
};


_names = [_classname];





switch (_remove_id) do
{
	case 0:
	{
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (uniformitems player);
		removeUniform player;
		removeUniform VALOR_PREVIEW_MODEL;
	};

	case 1:
	{
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (backpackitems player);
		removeBackpackGlobal player;
		removeBackpack VALOR_PREVIEW_MODEL;
	};

	case 2:
	{
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (primaryWeaponItems player);
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (primaryWeaponMagazine player);
		player removeWeapon _classname;
		VALOR_PREVIEW_MODEL removeWeapon _classname;
	};

	case 3:
	{
		player removePrimaryWeaponItem _classname;
		VALOR_PREVIEW_MODEL removePrimaryWeaponItem _classname;
	};

	case 4:
	{
		player removePrimaryWeaponItem _classname;
		VALOR_PREVIEW_MODEL removePrimaryWeaponItem _classname;
	};

	case 5:
	{
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (secondaryWeaponItems player);
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (secondaryWeaponMagazine player);
		player removeWeapon _classname;
		VALOR_PREVIEW_MODEL removeWeapon _classname;
	};

	case 6:
	{
		player removeSecondaryWeaponItem _classname;
		VALOR_PREVIEW_MODEL removeSecondaryWeaponItem _classname;
	};

	case 7:
	{
		player removeSecondaryWeaponItem _classname;
		VALOR_PREVIEW_MODEL removeSecondaryWeaponItem _classname;
	};

	case 8:
	{
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (handgunItems player);
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (handgunMagazine player);
		player removeWeapon _classname;
		VALOR_PREVIEW_MODEL removeWeapon _classname;
	};

	case 9:
	{
		player removeHandgunItem _classname;
		VALOR_PREVIEW_MODEL removeHandgunItem _classname;
	};

	case 10:
	{
		player removeHandgunItem _classname;
		VALOR_PREVIEW_MODEL removeHandgunItem _classname;
	};

	case 11:
	{
		player removeItemFromUniform _classname;
	};

	case 12:
	{
		{
			_price_extra = _x call _find_classname_price;
			_price = _price + _price_extra;
			if!(_x isEqualTo "") then {
				_names pushback _x;
			};
		} foreach (vestItems player);
		removeVest player;
		removeVest VALOR_PREVIEW_MODEL;
	};

	case 13:
	{
		player removeItemFromVest _classname;
	};

	case 14:
	{
		removeHeadgear player;
		removeHeadgear VALOR_PREVIEW_MODEL;
	};

	case 15:
	{
		removeGoggles player;
		removeGoggles VALOR_PREVIEW_MODEL;
	};

	case 16:
	{
		player unassignItem _classname;
		player removeItem _classname;
	};

	case 17:
	{
		player removeItemFromBackpack _classname;
	};


};

_buy_sell_BTN ctrlEnable true;
titletext[format["You sold a %1 for $%2",getText(configFile >> _config >> _classname >> "displayName"),([_price] call valor_fnc_numbertext)],"PLAIN DOWN"];

Valor_bankacc = Valor_bankacc + _price;


_entry = toArray str _names;
_ret = [];
{
	switch (_x) do
	{
		case 91:
		{
			_ret pushBack 40;
		};

		case 93:
		{
			_ret pushBack 41;
		};

		case 34:
		{
			_ret pushBack 39;
		};

		default
		{
			_ret pushBack _x;
		};
	};
} foreach _entry;


_names = tostring _ret;

[[_names,VALOR_SELLER_SHOP],"valor_fnc_incrementStock",2] call valor_fnc_remoteexec;
//[_names,VALOR_SELLER_SHOP] remoteexec["valor_fnc_incrementStock",2];