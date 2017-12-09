



_zombie = param[0,objNull,[objNull]];

if(isnull _zombie) exitWith {};




_zombie forceSpeed 2;
_zombie setDestination [getposATL _zombie, "LEADER Direct", true];
_zombie setDestination [([[2885.88,4499.34,0.17691], 0, 70, 1, 0, 0.85, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];


