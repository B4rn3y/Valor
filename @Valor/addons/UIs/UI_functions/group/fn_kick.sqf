

private ["_promote","_display","_listbox_member","_sel","_rank","_pid","_members","_entry","_pid_loop","_his_rank","_he"];
_promote = [0,false,[false]];
_display = findDisplay 3004;
if(isnull _display) exitWith {};
_listbox_member = _display displayCtrl 1500;
_sel = lbCurSel _listbox_member;
if(_sel isEqualTo -1) exitWith {systemchat "Valor :: You havent selected anyone"};

_rank = [getplayeruid player] call valor_fnc_getGroupRank;


_pid = _listbox_member lbData _sel;
if(_pid isEqualTo "") exitWith {diag_log "Valor :: No Pid"};
if(_pid isEqualTo getplayeruid player) exitWith {systemchat "Valor :: Thats u, u ****!"};

_members = valor_group select 1;

_entry = [];
{
	_pid_loop = _x select 0;
	if(_pid isEqualTo _pid_loop) exitWith {_entry = _x};
} foreach _members;

if(_entry isEqualTo []) exitWith {diag_log "Valor :: Cant find Pid in array"};
_his_rank = _entry select 1;
if(_his_rank >= _rank) exitWith {systemchat "Valor :: You cant kick this person"};


_members = _members - [_entry];
//valor_group set[1,_members];
_he = [_pid] call valor_fnc_findPlayerToUID;
if!(isnull _he) then {
	[1,valor_group select 0] remoteexec["valor_fnc_syncGroup",_he];
	_he setvariable["Valor_group_id",nil,true];
};

[1,player,valor_group select 0,_pid,0] remoteexec["valor_fnc_syncGroupDB",2];
[0,valor_group select 0,_members] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];


