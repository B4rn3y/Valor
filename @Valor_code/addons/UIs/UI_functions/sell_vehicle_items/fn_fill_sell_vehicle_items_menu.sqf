
private ["_item_w_prices","_display","_str_text","_sell_btn","_find_price_int","_ret","_arr_vehicle_items","_items","_backpacks","_magazines","_weapons","_amount_conf","_classname","_amount","_foreachindex","_d","_price"];

if(isnil "VALOR_LAST_VEHICLE") exitWith {["ERROR: Var nil"] spawn valor_fnc_exp_hint;};
if(isnull VALOR_LAST_VEHICLE) exitWith {["You havent been in a vehicle as driver recently"] spawn valor_fnc_exp_hint;};
if((VALOR_LAST_VEHICLE distance player) > 30) exitWith {["No vehicle you have driven is close enough"] spawn valor_fnc_exp_hint;};

_item_w_prices = param[0,[],[[]]];


_display = findDisplay 3014;
if(isnull _display) exitWith {};
Valor_prices_save = _item_w_prices;
disableSerialization;

_str_text = _display displayCtrl 1100;
_sell_btn = _display displayCtrl 2400;
_sell_btn ctrlEnable false;


_find_price_int = {
	_ret = 0;
	{
		if((_x select 0) isEqualTo _this) exitWith {_ret = _x select 1;};
	} foreach _item_w_prices;
	_ret
};



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


_price = 0;
{
	_price = _price + (_x call _find_price_int);
} foreach _arr_vehicle_items;



_str_text ctrlSetStructuredText parseText format["Do you really want to sell the entire inventory of %1(%2m) for $%3",gettext(configFile >> "CfgVehicles" >> (typeof VALOR_LAST_VEHICLE) >> "displayname"),round(player distance VALOR_LAST_VEHICLE),round(_price)];
_sell_btn ctrlEnable true;