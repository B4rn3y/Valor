

_shop_type = param[3,"",[""]];
if(_shop_type isEqualTo "") exitWith {["ERROR: Show Type unknown"] spawn valor_fnc_exp_hint;};
if(isnil "VALOR_LAST_VEHICLE") exitWith {["ERROR: Var nil"] spawn valor_fnc_exp_hint;};
if(isnull VALOR_LAST_VEHICLE) exitWith {["You havent been in a vehicle as driver recently"] spawn valor_fnc_exp_hint;};
if((VALOR_LAST_VEHICLE distance player) > 30) exitWith {["No vehicle you have driven is close enough"] spawn valor_fnc_exp_hint;};


createDialog "sell_vehicle_items";

_display = findDisplay 3014;
disableSerialization;

_str_text = _display displayCtrl 1100;
_sell_btn = _display displayCtrl 2400;
_sell_btn ctrlEnable false;

_str_text ctrlSetStructuredText parseText "Sending request to Server....";
Valor_shop_sold_items = [];
_arr_vehicle_items = [];
_items = getItemCargo VALOR_LAST_VEHICLE;
_backpacks = getBackpackCargo VALOR_LAST_VEHICLE;
_magazines = getMagazineCargo VALOR_LAST_VEHICLE;
_weapons = getWeaponCargo VALOR_LAST_VEHICLE;

if(_items isEqualTo [[],[]] && _backpacks isEqualTo [[],[]] && _magazines isEqualTo [[],[]] && _weapons isEqualTo [[],[]]) exitWith {
	_str_text ctrlSetStructuredText parseText "The vehicle is empty.";
};


{
	_classname = _x;
	_arr_vehicle_items pushback _classname;
} foreach (_items select 0);

{
	_classname = _x;
	_arr_vehicle_items pushback _classname;
} foreach (_backpacks select 0);

{
	_classname = _x;
	_arr_vehicle_items pushback _classname;
} foreach (_magazines select 0);

{
	_classname = _x;
	_arr_vehicle_items pushback _classname;
} foreach (_weapons select 0);



_finished_array = [];

{
	if!(_x isEqualTo "") then {
		_finished_array pushBackUnique _x;
	};
} foreach _arr_vehicle_items;



_arr = toArray str _finished_array;
_fin_array = [];
{
    switch (_x) do
    {
        case 34:
        {
            _fin_array pushback 39;
        };

        case 91:
        {
            _fin_array pushback 40;
        };

        case 93:
        {
            _fin_array pushback 41;
        };

        default
        {
            _fin_array pushBack _x;
        };
    };
} foreach _arr;

_str = (toString _fin_array);

[[player,_str,true],"valor_fnc_get_item_sell_prices",2] call valor_fnc_remoteexec;


waitUntil {isnull(findDisplay 3014)};

Valor_prices_save = nil;

if!(Valor_shop_sold_items isEqualTo []) then {
	diag_log str [Valor_shop_sold_items,_shop_type];
	[[Valor_shop_sold_items,_shop_type],"valor_fnc_Itemshop_insert_update_new_item_sold",2] call valor_fnc_remoteexec;
};
Valor_shop_sold_items = nil;





























