
private ["_display","_str_text","_listbox","_array_with_info","_title","_text"];
iF!((call valor_coplevel) >= 2) exitWith {systemchat "Valor :: You cant use that."};
if!(isnull (findDisplay 3009)) exitWith {};
if(!createDialog "applications") exitWith {systemChat "Valor Error :: Could not create the dialog!";};

_display = findDisplay 3009;
if(isnull _display) exitWith {};
_str_text = _display displayCtrl 1100;
_listbox = _display displayCtrl 1500;
_btn_set = _display displayCtrl 2402;
_edit = _display displayCtrl 1400;

_btn_set ctrlSetFade 1;
_edit ctrlSetFade 1;

_btn_set ctrlCommit 0;
_edit ctrlCommit 0;


_edit ctrlSetText "0";
_listbox lbadd "Loading...";

[player] remoteExec["valor_fnc_get_applications",2];