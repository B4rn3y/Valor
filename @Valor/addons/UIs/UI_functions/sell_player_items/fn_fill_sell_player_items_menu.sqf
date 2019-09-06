private ["_item_w_prices","_display","_str_text","_tv","_TV","_find_price","_ret","_index_0","_index","_index_1","_index_2","_a_I","_X","_find_price_int"];

_item_w_prices = param[0,[],[[]]];


_display = findDisplay 3013;
if(isnull _display) exitWith {};
disableSerialization;

_str_text = _display displayCtrl 1100;
_tv = _display displayCtrl 1111;

tvClear _TV;


_find_price = {
	_ret = "NS";
	{
		if((_x select 0) isEqualTo _this) exitWith {_ret = _x select 1;};
	} foreach _item_w_prices;
	_ret
};

_find_price_int = {
	_ret = -1;
	{
		if((_x select 0) isEqualTo _this) exitWith {_ret = _x select 1;};
	} foreach _item_w_prices;
	_ret
};

Valor_items_sold = [];


_index_0 = _tv tvadd[[],"Your Equipment:"];
_tv tvSetData[[_index_0],str(_item_w_prices)];
_index = 0;
if!((uniform player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> "cfgweapons" >> (uniform player) >> "displayname"),((uniform player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> "cfgweapons" >> (uniform player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(uniform player)];
	_tv tvSetValue [[_index_0,_index_1], ((uniform player) call _find_price_int)];
	{
		_index_2 = _tv tvadd[[_index_0,_index_1],format["[%2] %1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "displayname"),((_x) call _find_price)]];
		_tv tvSetPicture[[_index_0,_index_1,_index_2],format["%1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "picture")]];
		_tv tvSetData[[_index_0,_index_1,_index_2],str [_x,"u"]];
		_tv tvSetValue [[_index_0,_index_1,_index_2], ((_x) call _find_price_int)];
	} foreach (uniformitems player);
};

if!((vest player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> "cfgweapons" >> (vest player) >> "displayname"),((vest player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> "cfgweapons" >> (vest player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(vest player)];
	_tv tvSetValue [[_index_0,_index_1], ((vest player) call _find_price_int)];
	{
		_index_2 = _tv tvadd[[_index_0,_index_1],format["[%2] %1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "displayname"),((_x) call _find_price)]];
		_tv tvSetPicture[[_index_0,_index_1,_index_2],format["%1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "picture")]];
		_tv tvSetData[[_index_0,_index_1,_index_2],str [_x,"v"]];
		_tv tvSetValue [[_index_0,_index_1,_index_2], ((_x) call _find_price_int)];
	} foreach (vestitems player);
};

if!((backpack player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> ([backpack player] call valor_fnc_getConfig) >> (backpack player) >> "displayname"),((backpack player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> ([backpack player] call valor_fnc_getConfig) >> (backpack player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(backpack player)];
	_tv tvSetValue [[_index_0,_index_1], ((backpack player) call _find_price_int)];
	{
		_index_2 = _tv tvadd[[_index_0,_index_1],format["[%2] %1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "displayname"),((_x) call _find_price)]];
		_tv tvSetPicture[[_index_0,_index_1,_index_2],format["%1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "picture")]];
		_tv tvSetData[[_index_0,_index_1,_index_2],str [_x,"b"]];
		_tv tvSetValue [[_index_0,_index_1,_index_2], ((_x) call _find_price_int)];
	} foreach (backpackitems player);
};

if!((primaryWeapon player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> "cfgweapons" >> (primaryWeapon player) >> "displayname"),((primaryWeapon player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> "cfgweapons" >> (primaryWeapon player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(primaryWeapon player)];
	_tv tvSetValue [[_index_0,_index_1], ((primaryWeapon player) call _find_price_int)];
	{
		if!(_x isEqualTo "") then {
			_index_2 = _tv tvadd[[_index_0,_index_1],format["[%2] %1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "displayname"),((_x) call _find_price)]];
			_tv tvSetPicture[[_index_0,_index_1,_index_2],format["%1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "picture")]];
			_tv tvSetData[[_index_0,_index_1,_index_2],str [_x,"p"]];
			_tv tvSetValue [[_index_0,_index_1,_index_2], ((_x) call _find_price_int)];
		};
	} foreach (primaryWeaponItems player);
};

if!((secondaryWeapon player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> "cfgweapons" >> (secondaryWeapon player) >> "displayname"),((secondaryWeapon player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> "cfgweapons" >> (secondaryWeapon player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(secondaryWeapon player)];
	_tv tvSetValue [[_index_0,_index_1], ((secondaryWeapon player) call _find_price_int)];
	{
		if!(_x isEqualTo "") then {
			_index_2 = _tv tvadd[[_index_0,_index_1],format["[%2] %1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "displayname"),((_x) call _find_price)]];
			_tv tvSetPicture[[_index_0,_index_1,_index_2],format["%1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "picture")]];
			_tv tvSetData[[_index_0,_index_1,_index_2],str [_x,"s"]];
			_tv tvSetValue [[_index_0,_index_1,_index_2], ((_x) call _find_price_int)];
		};
	} foreach (secondaryWeaponItems player);
};

if!((handgunweapon player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> "cfgweapons" >> (handgunweapon player) >> "displayname"),((handgunweapon player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> "cfgweapons" >> (handgunweapon player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(handgunweapon player)];
	_tv tvSetValue [[_index_0,_index_1], ((handgunweapon player) call _find_price_int)];
	{
		if!(_x isEqualTo "") then {
			_index_2 = _tv tvadd[[_index_0,_index_1],format["[%2] %1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "displayname"),((_x) call _find_price)]];
			_tv tvSetPicture[[_index_0,_index_1,_index_2],format["%1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "picture")]];
			_tv tvSetData[[_index_0,_index_1,_index_2],str [_x,"h"]];
			_tv tvSetValue [[_index_0,_index_1,_index_2], ((_x) call _find_price_int)];
		};
	} foreach (handgunitems player);
};


if!((headgear player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> ([headgear player] call valor_fnc_getConfig) >> (headgear player) >> "displayname"),((headgear player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> ([headgear player] call valor_fnc_getConfig) >> (headgear player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(headgear player)];
	_tv tvSetValue [[_index_0,_index_1], ((headgear player) call _find_price_int)];
};

if!((goggles player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> ([goggles player] call valor_fnc_getConfig) >> (goggles player) >> "displayname"),((goggles player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> ([goggles player] call valor_fnc_getConfig) >> (goggles player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(goggles player)];
	_tv tvSetValue [[_index_0,_index_1], ((goggles player) call _find_price_int)];
};

if!((hmd player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> ([hmd player] call valor_fnc_getConfig) >> (hmd player) >> "displayname"),((hmd player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> ([hmd player] call valor_fnc_getConfig) >> (hmd player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(hmd player)];
	_tv tvSetValue [[_index_0,_index_1], ((hmd player) call _find_price_int)];
};

if!((binocular player) isEqualTo "") then {
	_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> ([binocular player] call valor_fnc_getConfig) >> (binocular player) >> "displayname"),((binocular player) call _find_price)]];
	_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> ([binocular player] call valor_fnc_getConfig) >> (binocular player) >> "picture")]];
	_tv tvSetData[[_index_0,_index_1],(binocular player)];
	_tv tvSetValue [[_index_0,_index_1], ((binocular player) call _find_price_int)];
};

_a_I = (assigneditems player) - [hmd player];

if!(_a_I isEqualTo []) then {
	{
		_index_1 = _tv tvadd[[_index_0],format["[%2] %1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _x >> "displayname"),((_x) call _find_price)]];
		_tv tvSetPicture[[_index_0,_index_1],format["%1",gettext(configfile >> ([_x] call valor_fnc_getConfig) >> _X >> "picture")]];
		_tv tvSetData[[_index_0,_index_1],str [_x,"a"]];
		_tv tvSetValue [[_index_0,_index_1], ((_x) call _find_price_int)];
	} foreach _a_I;
};



tvExpandAll _tv;

