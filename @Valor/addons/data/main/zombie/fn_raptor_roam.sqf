



_zombie = param[0,objNull,[objNull]];

if(isnull _zombie) exitWith {};




_zombie forceSpeed 2;
_zombie setDestination [getposATL _zombie, "LEADER Direct", true];
_zombie setDestination [([[2885.88,4499.34,0.17691], 0, 70, 1, 0, 0.85, 0] call BIS_fnc_findSafePos), "LEADER PLANNED", true];


//{[(selectrandom ["babe_raptorb_east_3_F","babe_raptorb_east_5_F","babe_raptorb_east_6_F","babe_raptorb_east_4_F","babe_raptorb_east_2_F","babe_raptor_east_6_F","babe_raptorb_east_F","babe_raptor_east_2_F","babe_raptor_east_3_F","babe_raptor_east_4_F","babe_raptor_east_5_F","babe_raptor_east_F"])] spawn valor_fnc_raptorMonitoring;} foreach [1,2,3];