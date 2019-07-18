
private ["_marker","_distance","_classname"];
_marker = "Survivor_city_1";
_distance = 600;


{
	_x setvariable["cop",true,true];
	if!(typeOf _x isEqualTo "Land_Net_Fence_Gate_F") then {
		[_x] call valor_fnc_lockdoor;
	};
} foreach (nearestobjects[getmarkerpos _marker,["Land_Net_Fence_Gate_F","Land_ConcreteWall_01_l_gate_F","Land_Offices_01_V1_F","Land_NetFence_02_m_gate_v1_F","Land_Mil_Guardhouse"],_distance]);




{
	_classname = typeof _x;
	if!(_classname isKindOf "LANDVEHICLE" || _classname isKindOf "AIR" || _classname isKindOf "SHIP") then {
		_x allowDamage false;
	};
} foreach (allMissionObjects "ALL");




for "_d" from 1 to 6 do {
	[(selectrandom ["babe_raptorb_east_3_F","babe_raptorb_east_5_F","babe_raptorb_east_6_F","babe_raptorb_east_4_F","babe_raptorb_east_2_F","babe_raptor_east_6_F","babe_raptorb_east_F","babe_raptor_east_2_F","babe_raptor_east_3_F","babe_raptor_east_4_F","babe_raptor_east_5_F","babe_raptor_east_F"]),[2885.88,4499.34,0.17691]] spawn valor_fnc_raptorMonitoring_server;
};

