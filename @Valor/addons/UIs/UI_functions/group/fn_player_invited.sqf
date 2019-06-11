

_group_id = param[0,-1,[0]];
if(_group_id isEqualTo -1) exitWith {};
_group_member = param[1,[],[[]]];
if(_group_member isEqualTo []) exitWith {};
_group_name = param[2,"",[""]];
if(_group_name isEqualTo "") exitWith {};



_action = [
	format["You have been invited to the group %1, do you want to join this group?",_group_name],
	"Valor Group Sytem",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};

_group_member pushback [getplayeruid player,1,name player];
player setvariable["Valor_group_id",_group_id,true];
Valor_group = [_group_id,_group_member,_group_name];

[4,player,valor_group select 0] remoteexec["valor_fnc_syncGroupDB",2];
[0,valor_group select 0,_group_member] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];





