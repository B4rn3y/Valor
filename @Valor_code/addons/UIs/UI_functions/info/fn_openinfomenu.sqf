
private ["_display","_str_text","_listbox","_array_with_info","_title","_text"];

if!(isnull (findDisplay 3008)) exitWith {};
if(!createDialog "info") exitWith {systemChat "Valor Error :: Could not create the dialog!";};

_display = findDisplay 3008;
if(isnull _display) exitWith {};
_str_text = _display displayCtrl 1100;
_listbox = _display displayCtrl 1500;


_array_with_info = getArray(missionConfigFile >> "Valor_settings" >> "rules_and_info" >> "message");


{
	_title = _x select 0;
	_text = _x select 1;
	_listbox lbadd _title;

} foreach _array_with_info;

if((count _array_with_info) > 0) then {
	_listbox lbSetCurSel 0;
};