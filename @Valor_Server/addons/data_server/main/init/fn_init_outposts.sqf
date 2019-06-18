


_query = "Select outpost_id, config_id, build, inventory from outposts";
_res = [_query,2,true] call valor_fnc_db_sync;







{
	_outpost_id = _x select 0;
	_config_id = _x select 1;
	_build = _x select 2;
	_inventory = _x select 3;

	_ret = [_config_id] call valor_fnc_outpost_config;
	_markerpos = (_ret select 3) select 0;
	_markertext = format["[Undone] %1 Outpost",_ret select 5];

	iF(_build isEqualTo 1) then {
		Valor_outposts_build pushBackUnique _config_id;
		_markertext = format["[Done] %1 Outpost",_ret select 5];
	};

	_marker = createMarker [format["Valor_outpost_marker_%1",_config_id], _markerpos];
	_marker setMarkerType "mil_box";
	_marker setMarkerText _markertext;

	[_outpost_id,_config_id,_inventory,_build] spawn valor_fnc_build_outpost_objects;



} foreach _res;

sleep 3;
Valor_outpost_init_finished = true;