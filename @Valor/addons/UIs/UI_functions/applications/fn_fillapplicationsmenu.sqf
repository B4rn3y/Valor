private ["_applications","_display","_str_text","_listbox","_grp_name","_pid","_bank","_playtime"];

_applications = param[0,[],[[]]];

_display = findDisplay 3009;
if(isnull _display) exitWith {};
_str_text = _display displayCtrl 1100;
_listbox = _display displayCtrl 1500;

lbClear _listbox;

if(_applications isEqualTo []) exitWith {_listbox lbadd "No applications.";};

{
	_name = _x select 0;
	_grp_name = _x select 1;
	_pid = _x select 2;
	_bank = _x select 3;
	_playtime = call compile (_x select 4);
	_id = _listbox lbadd _name;
	_listbox lbSetData[_id,(str [_name,_grp_name,_pid,_bank,_playtime])];
} foreach _applications;