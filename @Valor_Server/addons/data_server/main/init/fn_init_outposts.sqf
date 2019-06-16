


_query = "Select outpost_id, config_id, build, inventory from outposts";
_res = [_query,2,true] call valor_fnc_db_sync;







{
	_outpost_id = _x select 0;
	_config_id = _x select 1;
	_build = _x select 2;
	_inventory = _x select 3;


	[_outpost_id,_config_id,_inventory,_build] spawn valor_fnc_build_outpost_objects;

} foreach _res;