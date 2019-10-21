

private ["_display","_str_text","_listbox","_array_with_info","_cur_sel","_entry"];

_display = findDisplay 3008;
if(isnull _display) exitWith {};
_str_text = _display displayCtrl 1100;
_listbox = _display displayCtrl 1500;


_array_with_info = getArray(missionConfigFile >> "Valor_settings" >> "rules_and_info" >> "message");

_cur_sel = lbCurSel _listbox;
if(_cur_sel isEqualTo -1) exitWith {};


_entry = _array_with_info select _cur_sel;
_text = _entry select 1;
if(typeName _text isEqualTo "SCALAR") exitWith {_str_text ctrlSetStructuredText parsetext "";};
if(typeName _text isEqualTo "ARRAY") exitWith {_text = call compile (_text select 0); _str_text ctrlSetStructuredText parsetext _text;};

_str_text ctrlSetStructuredText parsetext _text;