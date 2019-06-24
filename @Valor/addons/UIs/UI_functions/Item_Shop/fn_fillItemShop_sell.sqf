
private ["_items","_display","_header","_listbox","_buy_sell_BTN","_switch_BTN","_classnames_prices","_prices","_classnames_gear","_index","_classname","_price","_config"];
_items = param[0,[],["",[],objNull]];


_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;

if(isnull _display) exitWith {};
lbClear _listbox;
if(_items isEqualTo []) exitWith {_listbox lbadd "Nothing you have on you can be saled O.o"};

_classnames_prices = [];
_prices = [];
{
	_classnames_prices pushBack (_x select 0);
	_prices pushBack (_x select 1);
} foreach _items;





_classnames_gear = [];
{
	if(typeName _x isEqualTo "STRING") then {
		if!(_x isEqualTo "") then {
			_index = _classnames_prices find _x;
			if!(_index isEqualTo -1) then {
				_classnames_gear pushBack [_x,_prices select _index];
			};
		};
	} else {
		{
			if!(_x isEqualTo "") then {
				_index = _classnames_prices find _x;
				if!(_index isEqualTo -1) then {
					_classnames_gear pushBack [_x,_prices select _index];
				};
			};
		} foreach _x;
	};
} foreach Valor_gear;



{
	_classname = _x select 0;
	_price = _x select 1;
	_config = [_classname] call valor_fnc_getconfig;
	if!(_price isEqualTo 0) then {
		_id = _listbox lbadd format["$%1 - %2",([_price] call valor_fnc_numbertext),getText(configFile >> _config >> _classname >> "displayName")];
		_listbox lbSetPicture[_id,getText(configFile >> _config >> _classname >> "picture")];
		_listbox lbSetTooltip[_id,getText(configFile >> _config >> _classname >> "descriptionshort")];
		_listbox lbSetData[_id,str([_classname,_price,_config])];
	};

} foreach _classnames_gear;