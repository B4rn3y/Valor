

private ["_promote","_display","_listbox_member","_sel","_rank","_pid","_members","_entry","_pid_loop","_action","_new_entry","_index"];
_promote = [0,false,[false]];
_display = findDisplay 3004;
if(isnull _display) exitWith {};
_listbox_member = _display displayCtrl 1500;
_sel = lbCurSel _listbox_member;
if(_sel isEqualTo -1) exitWith {systemchat "Valor :: You havent selected anyone"};

_rank = [getplayeruid player] call valor_fnc_getGroupRank;
if!(_rank isEqualTo 3) exitWith {systemchat "Valor :: Only the leader can do that"};

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

_action = [
	format["Do you really want to make %1 the new leader of the group",(_entry select 2)],
	"Valor Group Sytem",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};


_new_entry = [_entry select 0,3,_entry select 2];

_index = _members find _entry;
_members set[_index,_new_entry];



_entry = [];
_player_pid = getplayeruid player;
{
	_pid_loop = _x select 0;
	if(_player_pid isEqualTo _pid_loop) exitWith {_entry = _x};
} foreach _members;
if(_entry isEqualTo []) exitWith {diag_log "Valor :: Cant find Pid in array"};


_new_entry = [_entry select 0,2,_entry select 2];

_index = _members find _entry;
_members set[_index,_new_entry];


//[2,player,valor_group select 0,_pid,getplayeruid player] remoteexec["valor_fnc_syncGroupDB",2];
[[2,player,valor_group select 0,_pid,getplayeruid player],"valor_fnc_syncGroupDB",2] call valor_fnc_remoteexec;

[0,valor_group select 0,_members] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];




