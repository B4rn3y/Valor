

private ["_all_vehicles"];

_all_vehicles = allMissionObjects "LandVehicle" + allMissionObjects "Air" + allMissionObjects "Ship";

{
	_x addaction["<t color='#0000ff'>Show Vehicle Status</t>",Valor_fnc_showVehicleDamage];
} foreach _all_vehicles;