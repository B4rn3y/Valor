






private ["_query","_res","_base_id","_config_id","_layout_id","_owner","_entry_list","_classname","_pos","_dir","_vector","_inventory","_cop","_raptor","_raptor_classname"];


_query = "Select base_id, config_id, layout_id, owner, entry_list, classname, pos, dir, vector, inventory, cop, raptor, raptor_classname from bases";
_res = [_query,2,true] call valor_fnc_db_sync;




{
	_base_id = _x select 0;
	_config_id = _x select 1;
	_layout_id = _x select 2;
	_owner = _x select 3;
	_entry_list = _x select 4;
	_classname = _x select 5;
	_pos = _x select 6;
	_dir = call compile(_x select 7);
	_vector = _x select 8;
	_inventory = _x select 9;
	_cop = _x select 10;
	_raptor = _x select 11;
	_raptor_classname = call compile (_x select 12);


	[_base_id,_config_id,_layout_id,_owner,_entry_list,_classname,_pos,_dir,_vector,_inventory,_cop,_raptor,_raptor_classname] spawn valor_fnc_build_base_objects;
} foreach _res;



Valor_base_init_finished = true;



































