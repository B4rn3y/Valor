
_items = param[0,[],["",[],objNull]];


_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_listNbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;
_str_text_name = _display displayCtrl 1100;
_str_text_stock = _display displayCtrl 1101;
_str_text_Price = _display displayCtrl 1102;

if(isnull _display) exitWith {};
if(_items isEqualTo []) exitWith {};


{
	_DBid = _x select 0;
	_classname = call compile (_x select 1);
	_price = _x select 2;
	_stock = _x select 3;
} foreach _items;