

_display = findDisplay 3004;
if(isnull _display) exitWith {};

_rank = [getplayeruid player] call valor_fnc_getGroupRank;
iF(_rank isEqualTo 3) exitWith {systemchat "Valor :: The leader cant leave the gang, set a new leader or delete the group."};
if(_rank isEqualTo 0) exitWith {systemchat "Valor :: For some reason you are not in a gang or your rank is wrong O.o"};
_members = valor_group select 1;

_entry = [];
{
	_pid = _x select 0;
	if(_pid isEqualTo getplayeruid player) exitWith {_entry = _x};
} foreach _members;

if(_entry isEqualTo []) exitWith {diag_log "Valor :: Cant find Pid in array"};


_members = _members - [_entry];

[1,player,valor_group select 0,getplayeruid player,0] remoteexec["valor_fnc_syncGroupDB",2];
[0,valor_group select 0,_members] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];

valor_group = [];
player setvariable["Valor_group_id",nil,true];
if!(isnull (finddisplay 3004)) then {[true] call valor_fnc_opengroupmenu;};