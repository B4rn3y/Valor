




private ["_zombie","_see_range","_targets","_the_target"];
_zombie = param[0,objNull,[objNull]];
_ignore_sounds = param[1,false,[false]];

if(isnull _zombie) exitWith {[]};
_see_range = 40;
_distance_hear = 150;
_track_range = _distance_hear + _see_range;
_time_passed_allowed = 40;

_targets = nearestObjects[_zombie,["MAN"],_track_range];

_targets = _targets select {(isplayer _x && ((_zombie distance _x) <= _see_range)) && !(_x getvariable["valor_zmbienoaggro",false]) && alive _x && ([_zombie,_x] call valor_fnc_zombie_checkVisibility)};



_see_range = _see_range * 1.5;
if(_targets isEqualTo []) then {
	_targets = nearestObjects[_zombie,["LandVehicle","Air"],_see_range];
	_targets = _targets select {(count crew _x > 0 && ((_zombie distance _x) <= _see_range)) && {((isEngineOn _x) || (speed _x > 0))}};

};

_hear_target = [];
if!(_ignore_sounds) then {
	if(_targets isEqualTo []) then {
		_hear_target = nearestObjects[_zombie,["MAN"],_track_range];
		_hear_target = _hear_target select {_var = _x getvariable["valor_shot_pos",[getpos _x,0,(serverTime - (_time_passed_allowed + 10))]]; (_zombie distance (_var select 0) < (_var select 1)) && isplayer _x && (servertime < ((_var select 2) + _time_passed_allowed))};
	};
};



if(_targets isEqualTo [] && _hear_target isEqualTo []) exitWith {_zombie setvariable["VALOR_Hear_Pos",[]];[]};

if!(_hear_target isEqualTo []) exitWith {
	_the_target = selectRandom _hear_target;
	_zombie setvariable["VALOR_Target",objNull];
	_zombie setvariable["VALOR_Hear_Pos",(_the_target getVariable ["valor_shot_pos",[getpos _zombie,0,(serverTime - (_time_passed_allowed + 10))]])];

	[]
};

_the_target = selectRandom _targets;

_zombie setvariable["VALOR_Target",_the_target];
_zombie setvariable["VALOR_Hear_Pos",[]];


[_the_target]


