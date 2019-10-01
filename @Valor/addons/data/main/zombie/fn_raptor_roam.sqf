



private ["_zombie","_pos","_range"];
_zombie = param[0,objNull,[objNull]];
_pos = param[1,[],[[]]];
_range = param[2,[10,50],[[]]];
if(isnull _zombie) exitWith {};
if(_pos isEqualTo []) exitWith {};


_zombie forceSpeed 2;

_zombie setDestination [getposATL _zombie, "LEADER Direct", true];
_zombie setDestination [([_pos, (_range select 0), (_range select 1), 10, 0, 20, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];

//[2885.88,4499.34,0.17691]
//{[(selectrandom ["babe_raptorb_east_3_F","babe_raptorb_east_5_F","babe_raptorb_east_6_F","babe_raptorb_east_4_F","babe_raptorb_east_2_F","babe_raptor_east_6_F","babe_raptorb_east_F","babe_raptor_east_2_F","babe_raptor_east_3_F","babe_raptor_east_4_F","babe_raptor_east_5_F","babe_raptor_east_F"])] spawn valor_fnc_raptorMonitoring;} foreach [1,2,3];