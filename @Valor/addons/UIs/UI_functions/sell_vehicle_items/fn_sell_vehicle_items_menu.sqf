private ["_display","_find_price_int","_ret","_arr_vehicle_items","_items","_backpacks","_magazines","_weapons","_amount_conf","_classname","_amount","_foreachindex","_d","_price","_sell_btn"];





_display = findDisplay 3014;
if(isnull _display) exitWith {};
disableSerialization;

if(isnil "VALOR_LAST_VEHICLE") exitWith {["ERROR: Var nil"] spawn valor_fnc_exp_hint;};
if(isnull VALOR_LAST_VEHICLE) exitWith {["You havent been in a vehicle as driver recently"] spawn valor_fnc_exp_hint;};
if((VALOR_LAST_VEHICLE distance player) > 30) exitWith {["No vehicle you have driven is close enough"] spawn valor_fnc_exp_hint;};
if(isnil "Valor_prices_save") exitWith {["ERROR: Var 2 nil"] spawn valor_fnc_exp_hint;};

_sell_btn = _display displayCtrl 2400;

_find_price_int = {
	_ret = [];
	{
		if((_x select 0) isEqualTo _this) exitWith {_ret = _x;};
	} foreach Valor_prices_save;
	_ret
};

sleep random 1;

_arr_vehicle_items = [];
_items = getItemCargo VALOR_LAST_VEHICLE;
_backpacks = getBackpackCargo VALOR_LAST_VEHICLE;
_magazines = getMagazineCargo VALOR_LAST_VEHICLE;
_weapons = getWeaponCargo VALOR_LAST_VEHICLE;

_amount_conf = _items select 1;
{
	_classname = _x;
	_amount = _amount_conf select _foreachindex;
	for "_d" from 1 to _amount do {
		_arr_vehicle_items pushback _classname;
	};
} foreach (_items select 0);


_amount_conf = _backpacks select 1;
{
	_classname = _x;
	_amount = _amount_conf select _foreachindex;
	for "_d" from 1 to _amount do {
		_arr_vehicle_items pushback _classname;
	};
} foreach (_backpacks select 0);

_amount_conf = _magazines select 1;
{
	_classname = _x;
	_amount = _amount_conf select _foreachindex;
	for "_d" from 1 to _amount do {
		_arr_vehicle_items pushback _classname;
	};
} foreach (_magazines select 0);

_amount_conf = _weapons select 1;
{
	_classname = _x;
	_amount = _amount_conf select _foreachindex;
	for "_d" from 1 to _amount do {
		_arr_vehicle_items pushback _classname;
	};
} foreach (_weapons select 0);



clearWeaponCargoGlobal VALOR_LAST_VEHICLE;
clearMagazineCargoGlobal VALOR_LAST_VEHICLE;
clearItemCargoGlobal VALOR_LAST_VEHICLE;
clearBackpackCargoGlobal VALOR_LAST_VEHICLE;
VALOR_LAST_VEHICLE setvariable["Update_this",true,true];

_price = 0;
{
	_conf = _x call _find_price_int;
	iF!(_conf isEqualTo []) then {
		_price = _price + (_conf select 1);
		Valor_shop_sold_items pushback _conf;
	};
} foreach _arr_vehicle_items;


Valor_cash = Valor_cash  + round (_price);
[format["You sold items/an item for $%1",round _price]] spawn valor_fnc_exp_hint;



_sell_btn ctrlEnable false;

Valor_prices_save = nil;

_str_text = _display displayCtrl 1100;
_str_text ctrlSetStructuredText parseText format["You sold the inventory for $%1.",round (_price)];








