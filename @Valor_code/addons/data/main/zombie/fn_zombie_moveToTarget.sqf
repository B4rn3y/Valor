




_zombie = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];
if(isnull _zombie) exitWith {false};
if(isnull _target) exitWith {false};



_zombie lookAt _target;
_zombie glanceAt _target;
_zombie doWatch _target;
_zombie forceSpeed 10;
_zombie setDestination [getposATL _zombie, "LEADER Direct", true];
_zombie setDestination [(getposATL _target) vectorAdd (velocity _target), "LEADER PLANNED", true];


