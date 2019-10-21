

private ["_display","_str_text","_tv","_sell_btn","_selectionPath","_type","_items_sold","_price_mult","_classname","_compiled_arr","_price","_items_w_prices","_find_price_int","_ret","_find_type","_pr"];



_display = findDisplay 3013;
if(isnull _display) exitWith {};
disableSerialization;

_str_text = _display displayCtrl 1100;
_tv = _display displayCtrl 1111;
_sell_btn = _display displayCtrl 2400;
_sell_btn ctrlEnable false;

_selectionPath = tvCurSel _tv;
_type = "";

_items_sold = [];
_price_mult = 1.25;
_classname = _tv tvData _selectionPath;
if(91 in(toArray _classname)) then {
	_compiled_arr = call compile _classname;
	_classname = _compiled_arr select 0;
	_type = _compiled_arr select 1;
	if((count _compiled_arr) > 2) then {
		_classname = "";
	};
};

if(_classname isEqualTo "") exitWith {};
_price = _tv tvValue _selectionPath;
if(_price isEqualTo -1) exitWith {["This item cant be sold"] spawn valor_fnc_exp_hint};
_items_w_prices = call compile (_tv tvData [0]);

_find_price_int = {
	_ret = 0;
	{
		if((_x select 0) isEqualTo _this) exitWith {_ret = _x select 1;};
	} foreach _items_w_prices;
	_ret
};

_find_type = {
	_ret = "item";
	{
		if((_x select 0) isEqualTo _this) exitWith {_ret = _x select 2;};
	} foreach _items_w_prices;
	_ret
};

switch (_type) do
{
	case "u":
	{
		player removeItemFromUniform _classname;
		_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
	};

	case "v":
	{
		player removeItemFromVest _classname;
		_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
	};

	case "b":
	{
		player removeItemFromBackpack _classname;
		_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
	};

	case "p":
	{
		player removePrimaryWeaponItem _classname;
		_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];

	};

	case "s":
	{
		player removeSecondaryWeaponItem _classname;
		_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
	};

	case "h":
	{
		player removeHandgunItem _classname;
		_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
	};

	case "a":
	{
		player unassignItem _classname;
		player removeItem _classname;
		_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
	};

	default
	{
		if(_classname isEqualTo (uniform player)) exitWith {

			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
			{
				_pr = _x call _find_price_int;
				if!(_pr isEqualTo 0) then {
					_items_sold pushback[_x,_pr *_price_mult,(_x call _find_type)];
					_price = _price + _pr;
				};
			} foreach (uniformItems player);
			removeUniform player;
		};

		if(_classname isEqualTo (vest player)) exitWith {
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
			{
				_pr = _x call _find_price_int;
				if!(_pr isEqualTo 0) then {
					_items_sold pushback[_x,_pr *_price_mult,(_x call _find_type)];
					_price = _price + _pr;
				};
			} foreach (vestItems player);
			removeVest player;
		};

		if(_classname isEqualTo (backpack player)) exitWith {
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
			{
				_pr = _x call _find_price_int;
				if!(_pr isEqualTo 0) then {
					_items_sold pushback[_x,_pr *_price_mult,(_x call _find_type)];
					_price = _price + _pr;
				};
			} foreach (backpackItems player);
			removeBackpackGlobal player;
		};

		if(_classname isEqualTo (primaryWeapon player)) exitWith {
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
			{
				_pr = _x call _find_price_int;
				if!(_pr isEqualTo 0) then {
					_items_sold pushback[_x,_pr *_price_mult,(_x call _find_type)];
					_price = _price + _pr;
				};
			} foreach (primaryWeaponItems player);
			player removeWeaponGlobal _classname;
		};

		if(_classname isEqualTo (secondaryWeapon player)) exitWith {
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
			{
				_pr = _x call _find_price_int;
				if!(_pr isEqualTo 0) then {
					_items_sold pushback[_x,_pr *_price_mult,(_x call _find_type)];
					_price = _price + _pr;
				};
			} foreach (secondaryWeaponItems player);
			player removeWeaponGlobal _classname;
		};

		if(_classname isEqualTo (handgunWeapon player)) exitWith {
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
			{
				_pr = _x call _find_price_int;
				if!(_pr isEqualTo 0) then {
					_items_sold pushback[_x,_pr *_price_mult,(_x call _find_type)];
					_price = _price + _pr;
				};
			} foreach (handgunitems player);
			player removeWeaponGlobal _classname;
		};

		if(_classname isEqualTo (headgear player)) exitWith {
			removeHeadgear player;
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
		};

		if(_classname isEqualTo (goggles player)) exitWith {
			removeGoggles player;
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
		};

		if(_classname isEqualTo (hmd player)) exitWith {
			player unassignItem _classname;
			player removeItem _classname;
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
		};

		if(_classname isEqualTo (binocular player)) exitWith {
			player unassignItem _classname;
			player removeItem _classname;
			_items_sold pushback[_classname,_price *_price_mult,(_classname call _find_type)];
		};

	};

};

Valor_shop_sold_items append _items_sold;
Valor_cash = Valor_cash  + round(_price * (missionNamespace getvariable["Valor_skill_ST",1]));
[format["You sold items/an item for $%1",_price]] spawn valor_fnc_exp_hint;

_tv tvDelete _selectionPath;

_sell_btn ctrlEnable false;










