private ["_unit","_marker_pos","_jailtime"];

_unit = OBJ_focused;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit OR !(_unit getvariable["valor_restrained",false])) exitWith {};

_marker_pos = getmarkerpos "cop_jail";
if((player distance _marker_pos) > 20) exitWith { ["Valor :: You are not close enough to the jail"] spawn valor_fnc_exp_hint;};


_jailtime = 15;
_jailtime = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "jailtime");



[_jailtime] remoteexec["valor_fnc_arrested",_unit];



