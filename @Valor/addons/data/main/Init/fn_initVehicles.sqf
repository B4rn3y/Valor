

private ["_all_vehicles"];

_all_vehicles = allMissionObjects "LandVehicle" + allMissionObjects "Air" + allMissionObjects "Ship";
{
	_x addaction["<t color='#0000ff'>Show Vehicle Status</t>",Valor_fnc_showVehicleDamage,[],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player",20];
	_x addaction["Refuel",Valor_fnc_refuelVehicle,[],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player && ((""valor_canisterfuel"" in uniformitems player) || (""valor_canisterfuel"" in vestItems player) || (""valor_canisterfuel"" in backpackItems player))",20];
	if((typeof _x) isKindOf "helicopter") then {
		_x addEventHandler["RopeAttach",Valor_fnc_rope_attached];
	};
} foreach _all_vehicles;



_Map_center = [worldSize / 2, worldsize / 2, 0];
_objs_classnames = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "Objects_refueling");
if(_objs_classnames isEqualTo []) exitWith {};
_objs = nearestObjects[_Map_center,_objs_classnames,worldsize];

{
	_x addaction["Refill Fuelcans",Valor_fnc_refuelFuelcan,[],1.5,false,false,"","((_target distance player) <= 4.2) && vehicle player isEqualTo player && ((""valor_canisterfuel_empty"" in uniformitems player) || (""valor_canisterfuel_empty"" in vestItems player) || (""valor_canisterfuel_empty"" in backpackItems player))",20];
} foreach _objs;

