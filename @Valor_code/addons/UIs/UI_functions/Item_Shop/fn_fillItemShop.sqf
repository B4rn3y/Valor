private ["_items","_display","_header","_tree","_buy_sell_BTN","_switch_BTN","_p_weapons","_hgun_weapons","_sweapon","_magazines","_uniforms","_vests","_backpacks","_items_sort","_headgear","_goggles","_type","_master_index","_DBid","_classname","_price","_stock","_infinite","_config","_index"];
_items = param[0,[],["",[],objNull]];


_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_tree = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;

if(isnull _display) exitWith {};
tvclear _tree;
if(_items isEqualTo []) exitWith {_tree tvadd [[],"This trader has nothing to sale O.o"]};
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
	_type = _x select 4;
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

//_items = _p_weapons + _hgun_weapons + _sweapon + _magazines + _uniforms + _vests + _headgear + _goggles + _backpacks + _items_sort;


_master_index = 0;
{
	_header = _x select 1;
	if((count (_x select 0)) > 0) then {
		_master_index = _tree tvAdd[[],_header];
		{
			_DBid = _x select 0;
			_classname = _x select 1;
			_price = _x select 2;
			_stock = _x select 3;
			_type = _x select 4;
			_infinite = _x select 5;
			_config = [_classname] call valor_fnc_getconfig;
			if(_stock > 0) then {
				_index = _tree tvadd[[_master_index],format["[$%1] %2",([_price] call valor_fnc_numbertext),getText(configFile >> _config >> _classname >> "displayName")]];
				_tree tvSetPicture[[_master_index,_index],getText(configFile >> _config >> _classname >> "picture")];
				_tree tvSetTooltip[[_master_index,_index],getText(configFile >> _config >> _classname >> "descriptionshort")];
				_tree tvSetData[[_master_index,_index],str([_DBid,_classname,_price,_stock,_type,_config,_infinite])];
			};
		} foreach (_x select 0);
	};

} foreach [
	[_p_weapons,"Primary Weapons"],
	[_sweapon,"Secondary Weapons"],
	[_hgun_weapons,"Hamdgun Weapons"],
	[_magazines,"Magazines"],
	[_uniforms,"Uniforms"],
	[_vests,"Vests"],
	[_backpacks,"Backpacks"],
	[_headgear,"Headgear"],
	[_goggles,"Goggles"],
	[_items_sort,"Items"]
];


tvExpandAll _tree;


_tree ctrlRemoveAllEventHandlers "TreeSelChanged";
_tree ctrlAddEventHandler ["TreeSelChanged","_this spawn valor_fnc_ItemShop_lb_changed"];
