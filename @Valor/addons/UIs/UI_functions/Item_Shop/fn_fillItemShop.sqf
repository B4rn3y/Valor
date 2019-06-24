private ["_items","_display","_header","_listbox","_buy_sell_BTN","_switch_BTN","_str_text_name","_str_text_stock","_str_text_Price","_p_weapons","_hgun_weapons","_sweapon","_magazines","_uniforms","_vests","_backpacks","_items_sort","_headgear","_goggles","_type","_DBid","_classname","_price","_stock","_config"];
_items = param[0,[],["",[],objNull]];


_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;

if(isnull _display) exitWith {};
lbClear _listbox;
if(_items isEqualTo []) exitWith {_listbox lbadd "This trader has nothing to sale O.o"};
// VAlID "pweapon" "sweapon" "hweapon" "uniform" "vest" "backpack" "headgear" "goggles" "magazine" "item"
_p_weapons = [];
_hgun_weapons = [];
_sweapon = [];
_magazines = [];
_uniforms = [];
_vests = [];
_backpacks = [];
_items_sort = [];
_headgear = [];
_goggles = [];

{
	_type = call compile(_x select 4);
	switch (_type) do
	{
		case "pweapon":
		{
			_p_weapons pushBack _x;
		};

		case "sweapon":
		{
			_sweapon pushBack _x;
		};

		case "hweapon":
		{
			_hgun_weapons pushBack _x;
		};

		case "magazine":
		{
			_magazines pushBack _x;
		};

		case "uniform":
		{
			_uniforms pushBack _x;
		};

		case "vest":
		{
			_vests pushBack _x;
		};

		case "backpack":
		{
			_backpacks pushBack _x;
		};

		case "item":
		{
			_items_sort pushBack _x;
		};

		case "headgear":
		{
			_headgear pushBack _x;
		};

		case "goggles":
		{
			_goggles pushBack _x;
		};
	};
} foreach _items;

_items = _p_weapons + _hgun_weapons + _sweapon + _magazines + _uniforms + _vests + _headgear + _goggles + _backpacks + _items_sort;

{
	_DBid = _x select 0;
	_classname = call compile (_x select 1);
	_price = _x select 2;
	_stock = _x select 3;
	_type = call compile (_x select 4);
	_infinite = _x select 5;
	_config = [_classname] call valor_fnc_getconfig;
	if!(_stock isEqualTo 0) then {
		_id = _listbox lbadd format["$%1 - %2",([_price] call valor_fnc_numbertext),getText(configFile >> _config >> _classname >> "displayName")];
		_listbox lbSetPicture[_id,getText(configFile >> _config >> _classname >> "picture")];
		_listbox lbSetTooltip[_id,getText(configFile >> _config >> _classname >> "descriptionshort")];
		_listbox lbSetData[_id,str([_DBid,_classname,_price,_stock,_type,_config,_infinite])];
	};

} foreach _items;