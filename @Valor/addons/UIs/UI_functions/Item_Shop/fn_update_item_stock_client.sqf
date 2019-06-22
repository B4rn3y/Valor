
private ["_DBID","_stock","_display","_header","_listbox","_buy_sell_BTN","_switch_BTN","_str_text_name","_str_text_stock","_str_text_Price","_btn_text","_d","_data"];

_DBID = param[0,-1,[13]];
_stock = param[1,-1,[13]];
if(_DBID isEqualTo -1 || _stock isEqualTo -1) exitWith {};

disableSerialization;
_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;
_str_text_name = _display displayCtrl 1100;
_str_text_stock = _display displayCtrl 1101;
_str_text_Price = _display displayCtrl 1102;

if(isnull _display) exitWith {};

_btn_text = ctrlText _buy_sell_BTN;

if!(_btn_text isEqualTo "BUY") exitWith {};


for "_d" from 0 to ((lbSize _listbox)-1) do {
	_data = _listbox lbData _d;
	if!(_data isEqualTo "") then {
		_data = call compile _data;
		if((_data select 0) isEqualTo _DBID) exitWith {
			iF(_stock isEqualTo 0) then {
				_listbox lbDelete _d;
			} else {
				_data set[3,_stock];
				_listbox lbSetData[_d,str(_data)];
			};
		};
	};
};



