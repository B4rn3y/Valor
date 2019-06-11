
private ["_promote","_display","_listbox_member","_sel","_rank","_pid","_members","_entry","_current_rank","_new_entry","_index"];
_promote = param[0,false,[false]];
diag_log str _promote;
_display = findDisplay 3004;
if(isnull _display) exitWith {};
_listbox_member = _display displayCtrl 1500;
_sel = lbCurSel _listbox_member;
if(_sel isEqualTo -1) exitWith {systemchat "Valor :: You havent selected anyone"};

_rank = [getplayeruid player] call valor_fnc_getGroupRank;
iF!(_rank isEqualTo 3) exitWith {systemchat "Valor :: Only the leader can promote or demote"};

_pid_tofind = _listbox_member lbData _sel;
if(_pid_tofind isEqualTo "") exitWith {diag_log "Valor :: No Pid"};
if(_pid_tofind isEqualTo getplayeruid player) exitWith {systemchat "Valor :: Thats u, u ****!"};

_members = valor_group select 1;

_entry = [];
{
	_pid = _x select 0;
	if(_pid isEqualTo _pid_tofind) exitWith {_entry = _x};
} foreach _members;

if(_entry isEqualTo []) exitWith {diag_log "Valor :: Cant find Pid in array"};

_current_rank = _entry select 1;
diag_log str [_current_rank, _promote];
if(_current_rank isEqualTo 2 && _promote) exitWith {systemchat "Valor :: You cant use the Promote Button for that"};
if(_current_rank isEqualTo 1 && !_promote) exitWith {systemchat "Valor :: You cant use the Demote Button for that"};
_rank = 1;
if(_promote) then {_rank = _current_rank + 1} else {_rank = _current_rank - 1};

_new_entry = [_entry select 0,_rank,_entry select 2];

_index = _members find _entry;
_members set[_index,_new_entry];



[1,player,valor_group select 0,_entry select 0,_rank] remoteexec["valor_fnc_syncGroupDB",2];
[0,valor_group select 0,_members] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];

