










private ["_query","_res","_ammobox_ring","_base_id","_gang_id","_config_id","_build","_classname","_pos","_dir","_vector","_inv","_ammobox","_pos_dependent","_dir_dependent","_vector_dependent","_object","_spawnpos"];



_query = "Select base_id, gang_id, config_id, build, classname, pos, dir, vector, inventory from bases";
_res = [_query,2,true] call valor_fnc_db_sync;




_ammobox_ring = [["Land_CncBarrierMedium_F",[0.00683594,2.19067,-0.776215],356.759,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[2.09888,0.313477,-0.806427],87.4195,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[2.57593,1.82031,-0.707397],307.202,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[1.61206,-1.15283,-0.903564],127.636,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[-1.78735,0.284424,-0.94278],266.912,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[0.212891,-1.91284,-0.993652],176.44,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[-1.1333,-1.38208,-1.01129],230,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[-2.55298,1.51025,-0.902222],33.5687,[-0.0346008,-0.0546216,0.997908]]];


{
	_base_id = _x select 0;
	_gang_id = _x select 1;
	_config_id = _x select 2;
	_build = _x select 3;
	_classname = _x select 4;
	_pos = _x select 5;
	_dir = call compile (_x select 6);
	_vector = _x select 7;
	_inv = _x select 8;

	if(_build isEqualTo 0) then {
		_ammobox = _classname createVehicle [0,0,10];
		_ammobox setdir _dir;
		_ammobox setVectorUp _vector;
		_ammobox setposatl _pos;
		_ammobox setdir _dir;
		_ammobox setVectorUp _vector;
		_ammobox setvariable["valor_base_ids",[_base_id,_gang_id,_config_id],true];
		_ret = [_ammobox,_inv] call valor_fnc_loadVehicleCargo;


		{
			_classname = _x select 0;
			_pos_dependent = _x select 1;
			_dir_dependent = _x select 2;
			_vector_dependent = _x select 3;

			_object = _classname createvehicle[0,0,10];


			_spawnpos = _ammobox modelToWorld _pos_dependent;
			_object setdir (_dir_dependent + getdir _ammobox);
			_object setposatl _spawnpos;
			_object setvectorup (_ammobox vectorModelToWorld _vector_dependent);

		} foreach _ammobox_ring;
	} else {
		[_base_id,_config_id,_gang_id] spawn valor_fnc_build_base_objects;
	};

} foreach _res;




Valor_base_init_finished = true;








