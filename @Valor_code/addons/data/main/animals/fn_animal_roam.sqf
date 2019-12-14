private ["_animal","_listener"];




_animal = param[0,objNull,[objNull]];
_ridden_pos = param[1,[],[[]]];

if(isnull _animal) exitWith {};




_animal forceSpeed 2;
_animal setDestination [getposATL _animal, "LEADER Direct", true];
if(_ridden_pos isEqualTo []) then {
	_animal setDestination [([_animal, 0, 40, 1, 0, 0.85, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];
} else {
	_animal setDestination [([_ridden_pos, 0, 40, 1, 0, 0.85, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];
};

