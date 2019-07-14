private ["_action","_group_name"];

if(playerSide isEqualTo opfor) exitWith {};

_action = [
	format["Do you really want to apply for the 'Insert name here'? "],
	"Valor",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};

_group_name = "No Group";
if!(Valor_group isEqualTo []) then {
	_group_name = Valor_group select 2;
};


//[profilename, getplayeruid player,valor_playtime,Valor_bankacc,_group_name] remoteExec["valor_fnc_insert_application",2];
[[profilename, getplayeruid player,valor_playtime,Valor_bankacc,_group_name],"valor_fnc_insert_application",2] call valor_fnc_remoteexec;
VALOR_APPLY = true;

systemchat "Valor :: Your application has been received, you will be noticed about the outcome.";
