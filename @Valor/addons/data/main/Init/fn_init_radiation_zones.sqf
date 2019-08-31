

private ["_radiation_zones","_pos","_radius","_trg","_mkr_point","_foreachindex","_mkr_radius","_houses","_spawn_positions"];
_radiation_zones = getArray(missionConfigFile >> "Valor_settings" >> "radiation" >> "radiation_zones");


{
	_pos = _x select 0;
	_radius = _x select 1;
	if(typeName _pos isEqualTo "STRING") then {
		_pos = getMarkerPos _pos;
	};
	_trg = createTrigger ["EmptyDetector", _pos,false];
	_trg setTriggerArea [_radius, _radius, 0, false];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements ["(vehicle player) in thisList", format["[%1,%2] spawn valor_fnc_radiation;",_pos,_radius], ""];

	_mkr_point = createMarkerlocal[format["Valor_radiation_Zone_2_%1",_foreachindex],_pos];
	_mkr_point setMarkerTypeLocal "mil_dot";
	_mkr_point setMarkerBrushLocal "Solid";
	_mkr_point setMarkerTextLocal "Radiation Zone";

	_mkr_radius = createMarkerlocal[format["Valor_radiation_Zone_1_%1",_foreachindex],_pos];
	_mkr_radius setMarkerShapeLocal "ellipse";
	_mkr_radius setMarkerSizeLocal [_radius,_radius];
	_mkr_radius setMarkerBrushLocal "Solid";

	_houses = nearestObjects[_pos,["House"],_radius];

	{
		_spawn_positions = getarray(missionConfigFile >> "Houses_spawn_config" >> (typeof _x) >> "pos");
		if!(_spawn_positions isEqualTo []) then {
			_x setvariable["Valor_radiation_zone",true];
		};
	} foreach _houses;

} foreach _radiation_zones;

