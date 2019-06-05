

private ["_all_vehicles"];

_all_vehicles = allMissionObjects "LandVehicle" + allMissionObjects "Air" + allMissionObjects "Ship";

{
	_x addaction["<t color='#0000ff'>Show Vehicle Status</t>",Valor_fnc_showVehicleDamage,[],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player",20];
	if((typeof _x) isKindOf "helicopter") then {
		_x addEventHandler["RopeAttach",Valor_fnc_rope_attached];
	};
} foreach _all_vehicles;