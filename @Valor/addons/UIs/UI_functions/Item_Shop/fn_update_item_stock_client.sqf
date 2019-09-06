
private ["_DBID","_stock","_display","_header","_tree","_buy_sell_BTN","_switch_BTN","_str_text_name","_str_text_stock","_str_text_Price","_count_header","_count","_d","_data"];
_DBID = param[0,-1,[13]];
_stock = param[1,-1,[13]];
if(_DBID isEqualTo -1 || _stock isEqualTo -1) exitWith {};

disableSerialization;
_display = findDisplay 3007;
_header = _display displayCtrl 1001;
_tree = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;
_str_text_name = _display displayCtrl 1100;
_str_text_stock = _display displayCtrl 1101;
_str_text_Price = _display displayCtrl 1102;


_count_header = 0;
while {true} do
{
	_count = _tree tvCount _count_header;
	if(_count > 0) then {
		for "_d" from 0 to (_count - 1) do {
			_data = _tree tvData [_count_header,_d];
			if!(_data isEqualTo "") then {
				_data = call compile _data;
				if((_data select 0) isEqualTo _DBID) exitWith {
					if(_stock isEqualTo 0) then {
						_tree tvDelete [_count_header,_d];
					} else {
						_data set[3,_stock];
						_tree tvSetData[[_count_header,_d],str(_data)];
					};
				};
			};
		};
	};
};













/*

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


*/
