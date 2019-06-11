
private ["_rank","_action"];


_rank = [getplayeruid player] call valor_fnc_getGroupRank;
if!(_rank isEqualTo 3) exitWith {systemchat "Valor :: Only the leader can do that"};


_action = [
	format["Do you really want to delte this group?"],
	"Valor Group Sytem",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};


_action = [
	format["Are you really sure about that?"],
	"Valor Group Sytem",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};

[3,player,valor_group select 0] remoteexec["valor_fnc_syncGroupDB",2];
[1,valor_group select 0] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];


