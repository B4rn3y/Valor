
private ["_unit","_killer","_instigator","_person_add"];

_unit = param[0,objNull,[objNull]];
_killer = param[1,objNull,[objNull]];
_instigator = param[2,objNull,[objNull]];

if(isnull _killer && isnull _instigator) exitWith {};


_person_add = if(isnull _killer) then {_instigator} else {_killer};
//_xp_add =  getnumber(missionConfigFile >> "Valor_settings" >> "level_system" >> "raptor_killed");


if(_person_add isEqualTo player) then {
	["Bloodsucker"] spawn valor_fnc_onEntityKilled;
} else {
	["Bloodsucker"] remoteExec["valor_fnc_onEntityKilled",[_person_add]];
};



