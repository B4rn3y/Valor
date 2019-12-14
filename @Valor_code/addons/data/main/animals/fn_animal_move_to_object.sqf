private ["_animal","_listener"];




_animal = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];

if(isnull _animal || isnull _target) exitWith {};




_animal forceSpeed 2;
_animal setDestination [getposATL _animal, "LEADER Direct", true];

_animal setDestination [getposatl _target, "LEADER PLANNED", true];


