


private ["_display","_str_text","_listbox","_btn_set","_edit","_btn_decline","_btn_accept","_cur_sel","_data","_value","_grp_name","_pid","_bank","_playtime"];

_display = findDisplay 3009;
if(isnull _display) exitWith {};
_str_text = _display displayCtrl 1100;
_listbox = _display displayCtrl 1500;
_btn_set = _display displayCtrl 2402;
_edit = _display displayCtrl 1400;
_btn_decline = _display displayCtrl 2401;
_btn_accept = _display displayCtrl 2400;



_cur_sel = lbCurSel _listbox;
if(_cur_sel isEqualTo -1) exitWith {};

_data = _listbox lbData _cur_sel;
if(_data isEqualTo "") exitWith {_str_text ctrlSetStructuredText parsetext "";};
_value = _listbox lbValue _cur_sel;

if(_value isEqualTo 1) then {
	_btn_decline ctrlSetFade 0;
	_btn_accept ctrlSetFade 0;
	_btn_set ctrlSetFade 1;
	_edit ctrlSetFade 1;

	_btn_decline ctrlCommit 0;
	_btn_accept ctrlCommit 0;
	_btn_set ctrlCommit 0;
	_edit ctrlCommit 0;

	_data = call compile _data;
	_name = _data select 0;
	_grp_name = _data select 1;
	_pid = _data select 2;
	_bank = _data select 3;
	_playtime = _data select 4;

	_str_text ctrlSetStructuredText parsetext format["<t size='1.5'>%1</t><br/><br/><t size='1.0'>Playtime:</t><br/><t color='#01DF01' size='1.8'>%2 hours</t><br/><t size='1.0'>Bank:</t><br/><t color='#01DF01' size='1.8'>%3</t><br/><t size='1.0'>Group Name:</t><br/><t color='#01DF01' size='1.8'>%4</t> ",_name,([_playtime * 60,"HH:MM"] call BIS_fnc_secondsToString),_bank,_grp_name];
} else {
	_btn_decline ctrlSetFade 1;
	_btn_accept ctrlSetFade 1;
	_btn_set ctrlSetFade 0;
	_edit ctrlSetFade 0;

	_btn_decline ctrlCommit 0;
	_btn_accept ctrlCommit 0;
	_btn_set ctrlCommit 0;
	_edit ctrlCommit 0;

	_str_text ctrlSetStructuredText parsetext "";
};