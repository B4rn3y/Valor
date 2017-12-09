



_zombie = param[0,objNull,[objNull]];

if(isnull _zombie) exitWith {};




_zombie forceSpeed 2;
_zombie setDestination [getposATL _zombie, "LEADER Direct", true];
_zombie setDestination [([_zombie, 0, 40, 1, 0, 0.85, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];


