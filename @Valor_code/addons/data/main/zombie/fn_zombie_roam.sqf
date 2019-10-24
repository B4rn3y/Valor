private ["_zombie","_listener"];




_zombie = param[0,objNull,[objNull]];

if(isnull _zombie) exitWith {};


if((floor random 5) isEqualTo 2) then {
	_zombie spawn {
		sleep random [10,12,15];
		_listener = [];
		{if((_x distance _this) < 40) then {_listener pushBack _x;};} foreach playableUnits;
		if!(_listener isEqualTo []) then {
			[_this,(format["idle_%1",floor random 35])] remoteexeccall["say3D",_listener];
		};
	};
};

_zombie forceSpeed 2;
_zombie setDestination [getposATL _zombie, "LEADER Direct", true];
_zombie setDestination [([_zombie, 0, 40, 1, 0, 0.85, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];


