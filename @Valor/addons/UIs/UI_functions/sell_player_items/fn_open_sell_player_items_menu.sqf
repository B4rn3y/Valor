
private ["_display","_str_text","_sell_btn","_tv","_TV","_index_0","_arr_player_items","_a_I","_finished_array","_arr","_fin_array","_str"];

_shop_type = param[3,"",[""]];
if(_shop_type isEqualTo "") exitWith {["ERROR: Show Type unknown"] spawn valor_fnc_exp_hint;};


createDialog "sell_player_items";

_display = findDisplay 3013;
disableSerialization;

_str_text = _display displayCtrl 1100;
_sell_btn = _display displayCtrl 2400;
_sell_btn ctrlEnable false;


_tv = (finddisplay 3013) ctrlCreate ["RscTreeSearch", 1111];
_tv ctrlSetFont "PuristaMedium";
_tv ctrlSetFontHeight 0.035;
_tv ctrlSetPosition [0.00252566,0.0505048,0.615151,0.781818];
_tv ctrlSetBackgroundColor [0,0,0,0.25];
_tv ctrlCommit 0;
//_tv ctrlAddEventHandler ["TreeDblClick","_this spawn {}"];
_tv ctrlAddEventHandler ["TreeSelChanged","_this call valor_fnc_TreeSelChanged_sell_player_items_menu"];
tvClear _TV;
Valor_shop_sold_items = [];
_index_0 = _tv tvadd[[],"Loading Info, please wait..."];

_arr_player_items = [];

if!((uniform player) isEqualTo "") then {
	_arr_player_items pushback (uniform player);
};

if!((uniformitems player) isEqualTo []) then {
	{
		_arr_player_items pushback _x;
	} foreach (uniformitems player);
};


if!((vest player) isEqualTo "") then {
	_arr_player_items pushback (vest player);
};

if!((vestitems player) isEqualTo []) then {
	{
		_arr_player_items pushback _x;
	} foreach (vestitems player);
};



if!((backpack player) isEqualTo "") then {
	_arr_player_items pushback (backpack player);
};

if!((backpackitems player) isEqualTo []) then {
	{
		_arr_player_items pushback _x;
	} foreach (backpackitems player);
};



if!((primaryWeapon player) isEqualTo "") then {
	_arr_player_items pushback (primaryWeapon player);
};

if!((primaryWeaponItems player) isEqualTo []) then {
	{
		_arr_player_items pushback _x;
	} foreach (primaryWeaponItems player);
};




if!((secondaryWeapon player) isEqualTo "") then {
	_arr_player_items pushback (secondaryWeapon player);
};

if!((secondaryWeaponItems player) isEqualTo []) then {
	{
		_arr_player_items pushback _x;
	} foreach (secondaryWeaponItems player);
};




if!((handgunWeapon player) isEqualTo "") then {
	_arr_player_items pushback (handgunWeapon player);
};

if!((handgunItems player) isEqualTo []) then {
	{
		_arr_player_items pushback _x;
	} foreach (handgunItems player);
};


if!((headgear player) isEqualTo "") then {
	_arr_player_items pushback (headgear player);
};


if!((goggles player) isEqualTo "") then {
	_arr_player_items pushback (goggles player);
};

if!((hmd player) isEqualTo "") then {
	_arr_player_items pushback (hmd player);
};

if!((hmd player) isEqualTo "") then {
	_arr_player_items pushback (hmd player);
};

if!((binocular player) isEqualTo "") then {
	_arr_player_items pushback (binocular player);
};

_a_I = (assigneditems player) - [hmd player] - [binocular player];
{
	_arr_player_items pushback _x
} foreach _a_I;





_finished_array = [];

{
	if!(_x isEqualTo "") then {
		_finished_array pushBackUnique _x;
	};
} foreach _arr_player_items;



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
test = _str;
[[player,_str],"valor_fnc_get_item_sell_prices",2] call valor_fnc_remoteexec;


waitUntil {isnull(findDisplay 3013)};

[[Valor_shop_sold_items,_shop_type],"valor_fnc_Itemshop_insert_update_new_item_sold",2] call valor_fnc_remoteexec;

Valor_shop_sold_items = nil;





























