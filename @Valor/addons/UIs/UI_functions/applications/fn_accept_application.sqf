


private ["_display","_str_text","_listbox","_cur_sel","_data","_grp_name","_pid","_bank","_playtime"];
_accept = param[0,false,[false]];
_display = findDisplay 3009;
if(isnull _display) exitWith {};
_str_text = _display displayCtrl 1100;
_listbox = _display displayCtrl 1500;



_cur_sel = lbCurSel _listbox;
if(_cur_sel isEqualTo -1) exitWith {systemchat "Valor :: You havent selected anyone"};

_data = _listbox lbData _cur_sel;
if(_data isEqualTo "") exitWith {systemchat "Valor :: _data is empty O.o";};
_data = call compile _data;
_name = _data select 0;
_grp_name = _data select 1;
_pid = _data select 2;
_bank = _data select 3;
_playtime = _data select 4;

_action = [
	format["Do you really want to %2 %1?",_name,if(_accept) then {"accept"} else {"decline"}],
	"Valor",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};

_listbox lbDelete _cur_sel;

_online = {
	_ret = objNull;
	{if(getplayeruid _x isEqualTo _pid) exitWith {_ret = _x;}} foreach playableUnits;
	_ret
};

_man = 0 call _online;

if!(isNull _man) exitWith {
	[_accept] remoteExec["valor_fnc_show_application_response",_man];
	if(_accept) then {
		[[1,_pid,0,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
		//[1,_pid,0,true] remoteExec["valor_fnc_update_coplevel",2];
	} else {
		[[0,_pid,0,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
		//[0,_pid,0,true] remoteExec["valor_fnc_update_coplevel",2];
	};
};

if(_accept) then {
	[[1,_pid,2,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
	//[1,_pid,2,true] remoteExec["valor_fnc_update_coplevel",2];
} else {
	[[0,_pid,1,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
	//[0,_pid,1,true] remoteExec["valor_fnc_update_coplevel",2];
};

