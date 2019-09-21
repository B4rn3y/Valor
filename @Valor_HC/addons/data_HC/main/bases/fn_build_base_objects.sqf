private ["_base_id","_config_id","_layout_id","_owner","_entry_list","_classname","_pos","_dir","_vector","_inventory","_cop","_raptor","_raptor_classname","_query","_res","_inv","_object","_ret","_range"];


_base_id = param[0,-1,[0]];
_config_id = param[1,-1,[0]];
_layout_id = param[2,-1,[0]];
_owner = param[3,"",[""]];
_entry_list = param[4,[],[[]]];
_classname = param[5,"",[""]];
_pos = param[6,[],[[]]];
_dir = param[7,-1,[0]];
_vector = param[8,[],[[]]];
_inventory = param[9,"",[""]];
_cop = param[10,-1,[0]];
_raptor = param[11,-1,[0]];
_raptor_classname = param[12,"",[""]];



if(_base_id isEqualTo -1 || _config_id isEqualTo -1 || _layout_id isEqualTo -1 || _classname isEqualTo "") exitWith {};


_query = format["Select id, classname, pos, dir, vector, inventory, layout_id from base_objects where base_id = '%1'",_base_id];
_res = [_query,2,true] call valor_fnc_db_sync;

_res pushBack [-1,_classname,_pos,str(_dir),_vector,_inventory,[_layout_id]];

{

	_id = _x select 0;
	_classname = _x select 1;
	_pos = _x select 2;
	_dir = call compile (_x select 3);
	_vector = _x select 4;
	_inv = _x select 5;
	_stage = call compile(_x select 6);
	if(_layout_id in _stage) then {
		_object = _classname createVehicle [0,0,10];
		waitUntil {!isnil "_object"};
		waitUntil {!isnull _object};
		_object setdir _dir;
		_object setVectorUp _vector;
		_object setposatl _pos;
		_object setdir _dir;
		_object allowDamage false;
		_object setVectorUp _vector;
		if(_classname in ["B_CargoNet_01_ammo_F"]) then {
			_object setvariable["valor_base_ids",[_base_id,_config_id,_layout_id,_entry_list,_owner],true];
			_ret = [_object,_inv] call valor_fnc_loadVehicleCargo;
			if(_raptor isEqualTo 1) then {
				_range = ([_config_id,_layout_id] call valor_fnc_base_config) select 2;
				[_raptor_classname,_pos,_entry_list,_range] spawn valor_fnc_raptorMonitoring_server_group;
			};
		} else {
			_object setvariable["valor_base_ids",[_base_id,_config_id,_layout_id],true];
			if(typeof _object isEqualTo "valor_drawBridge") then {
				_object animate["draw",1];
			};
			if([_object] call valor_fnc_lockdoor) then {
				diag_log format["Valor Server :: The object %1 has been locked",_classname];
			};
		};
	};

} foreach _res;
























