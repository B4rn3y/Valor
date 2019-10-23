private ["_zombie","_pos","_range","_listener"];





_zombie = param[0,objNull,[objNull]];
_pos = param[1,[],[[]]];
_range = param[2,[10,50],[[]]];
if(isnull _zombie) exitWith {};
if(_pos isEqualTo []) exitWith {};

if(_range isEqualTo [10,50] && (_zombie distance _pos)>100) then {_zombie forceSpeed 10} else {_zombie forceSpeed 2;};

if((floor random 4) isEqualTo 2) then {
	0 spawn {
		sleep random [10,12,15];
		_listener = [];
		{if((_x distance _zombie) < 40) then {_listener pushBack _x;};} foreach playableUnits;
		if!(_listener isEqualTo []) then {
			[_zombie,(selectrandom["rap_1","rap_10","rap_11","rap_12","rap_13","rap_14","rap_15","rap_16","rap_17","rap_18","rap_19"])] remoteexeccall["say3D",_listener];
		};
	};
};


_zombie setDestination [getposATL _zombie, "LEADER Direct", true];
_zombie setDestination [([_pos, (_range select 0), (_range select 1), 10, 0, 20, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];

//[2885.88,4499.34,0.17691]
//{[(selectrandom ["babe_raptorb_east_3_F","babe_raptorb_east_5_F","babe_raptorb_east_6_F","babe_raptorb_east_4_F","babe_raptorb_east_2_F","babe_raptor_east_6_F","babe_raptorb_east_F","babe_raptor_east_2_F","babe_raptor_east_3_F","babe_raptor_east_4_F","babe_raptor_east_5_F","babe_raptor_east_F"])] spawn valor_fnc_raptorMonitoring;} foreach [1,2,3];