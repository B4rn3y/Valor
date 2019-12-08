


private ["_display","_str_text","_listbox","_btn_set","_edit","_cur_sel","_data","_coplevel","_pid","_action","_txt","_nmbr"];

_display = findDisplay 3009;
if(isnull _display) exitWith {};
_str_text = _display displayCtrl 1100;
_listbox = _display displayCtrl 1500;
_btn_set = _display displayCtrl 2402;
_edit = _display displayCtrl 1400;



_cur_sel = lbCurSel _listbox;
if(_cur_sel isEqualTo -1) exitWith {systemchat "Valor :: You havent selected anyone"};

_data = _listbox lbData _cur_sel;
if(_data isEqualTo "") exitWith {systemchat "Valor :: _data is empty O.o";};
_data = call compile _data;
_coplevel = _data select 0;
_name = _data select 1;
_pid = _data select 2;

_txt = ctrlText _edit;
if!([_txt] call valor_fnc_isNumber) exitWith {systemChat "Valor :: You havent entered a number"};
_nmbr = parseNumber _txt;

iF(_nmbr < 0 || _nmbr > 6) exitWith {systemchat "Valor :: You can only change the rank from 0 to 6" };

_action = [
	format["Do you really want to set %1 on Level %2?",_name,_nmbr],
	"Valor",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};



//[_nmbr,_pid] remoteExec["valor_fnc_update_coplevel",2];
[[_nmbr,_pid],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;

systemchat format["Valor :: You set %1 rank to %2",_name,_nmbr];

iF(_nmbr isEqualTo 0) exitWith {
	_listbox lbDelete _cur_sel;
};

_listbox lbSetText[_cur_sel,format["[%2]-%1",_name,_nmbr]];
_listbox lbSetData[_cur_sel,(str [_nmbr,_name,_pid])];
_listbox lbSetValue[_cur_sel,2];
