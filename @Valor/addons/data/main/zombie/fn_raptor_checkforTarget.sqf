




private ["_zombie","_see_range","_targets","_the_target"];
_zombie = param[0,objNull,[objNull]];

if(isnull _zombie) exitWith {[]};
_see_range = 40;

_targets = nearestObjects[_zombie,["MAN"],_see_range];

_targets = _targets select {(isplayer _x && ((_zombie distance _x) <= _see_range)) && !(_x getvariable["valor_zmbienoaggro",false]) && alive _x && ([_zombie,_x] call valor_fnc_zombie_checkVisibility)};



_see_range = _see_range * 1.5;
if(_targets isEqualTo []) then {
	_targets = nearestObjects[_zombie,["LandVehicle","Air"],_see_range];
	_targets = _targets select {(count(crew _x) > 0 && ((_zombie distance _x) <= _see_range)) && {((isEngineOn _x) || (speed _x > 0))}};

};

if(_targets isEqualTo []) exitWith {[]};

_the_target = selectRandom _targets;

_zombie setvariable["VALOR_Target",_the_target];

[_the_target]


