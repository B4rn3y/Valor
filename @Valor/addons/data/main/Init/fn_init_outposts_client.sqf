

_allmissionObjects = allMissionObjects "B_CargoNet_01_ammo_F" + allMissionObjects "Land_Net_Fence_Gate_F";



{
	_var = _x getvariable["valor_outpost_ids",[-1,-1,-1]];
	if!(_var isEqualTo [-1,-1,-1]) then {
		_id = _var select 0;
		_config_id = _var select 1;
		_build = _var select 2;
		[_id,_config_id,"",_build] spawn valor_fnc_build_outpost_objects;
	};
} foreach _allmissionObjects;