private ["_bloodsucker_zones","_pos","_a","_b","_isrecttangle","_trg","_mkr_radius","_foreachindex"];



_bloodsucker_zones = getArray(missionConfigFile >> "Valor_settings" >> "bloodsucker_settings" >> "bloodsucker_zones");


{
	_pos = _x select 0;
	_a = _x select 1;
	_b = _x select 2;
	_isrecttangle = _x select 3;
	if(typeName _pos isEqualTo "STRING") then {
		_pos = getMarkerPos _pos;
	};
	if(typeName _isrecttangle isEqualTo "STRING") then {
		_isrecttangle = call compile _isrecttangle;
	};
	_trg = createTrigger ["EmptyDetector", _pos,false];
	_trg setTriggerArea [_a, _b, 0, _isrecttangle,70];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements ["(vehicle player) in thisList", format["[] spawn valor_fnc_check_bloodsucker_spawn;"], ""];


	_mkr_radius = createMarkerlocal[format["Valor_bloodsucker_Zone_1_%1",_foreachindex],_pos];
	if(_isrecttangle) then {
		_mkr_radius setMarkerShapeLocal "RECTANGLE";
	} else {
		_mkr_radius setMarkerShapeLocal "ellipse";
	};
	_mkr_radius setMarkerSizeLocal [_a,_b];
	_mkr_radius setMarkerBrushLocal "Solid";



} foreach _bloodsucker_zones;

