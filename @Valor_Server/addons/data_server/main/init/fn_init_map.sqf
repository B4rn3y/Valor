
private ["_marker","_distance","_classname"];
_marker = "Survivor_city_1";
_distance = 600;


{
	_x setvariable["cop",true,true];
	if!(typeOf _x isEqualTo "Land_Net_Fence_Gate_F") then {
		[_x] call valor_fnc_lockdoor;
	};
} foreach (nearestobjects[getmarkerpos _marker,["Land_Net_Fence_Gate_F","Land_ConcreteWall_01_l_gate_F","Land_Offices_01_V1_F","Land_NetFence_02_m_gate_v1_F"],_distance]);




{
	_classname = typeof _x;
	if!(_classname isKindOf "LANDVEHICLE" || _classname isKindOf "AIR" || _classname isKindOf "SHIP") then {
		_x allowDamage false;
	};
} foreach (allMissionObjects "ALL");

