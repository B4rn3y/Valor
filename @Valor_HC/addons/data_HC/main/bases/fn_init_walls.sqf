private ["_query","_res","_classname","_pos","_dir","_vector","_grouP_id","_wall_type_id","_object"];


_query = format["Select id, classname, pos, dir, vector, group_id, wall from base_objects where wall > 0"];
_res = [_query,2,true] call valor_fnc_db_sync;


{

	_id = _x select 0;
	_classname = _x select 1;
	_pos = _x select 2;
	_dir = call compile (_x select 3);
	_vector = _x select 4;
	_grouP_id = _x select 5;
	_wall_type_id = _x select 6;
	_object = _classname createVehicle [0,0,10];
	waitUntil {!isnil "_object"};
	waitUntil {!isnull _object};
	_object setdir _dir;
	_object setVectorUp _vector;
	_object setposatl _pos;
	_object setdir _dir;
	_object allowDamage false;
	_object setVectorUp _vector;

	_object setvariable["valor_wall_ids",[_id,_grouP_id, _wall_type_id],true];

	if([_object] call valor_fnc_lockdoor) then {
		diag_log format["Valor Server :: The object %1 has been locked",_classname];
	};



} foreach _res;




Valor_wall_init_finished = true;



















