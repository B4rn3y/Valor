

private ["_base_id","_config_id","_gang_id","_raptor","_raptor_classname","_query","_res","_classname","_pos","_dir","_vector","_inv","_object","_ret","_range"];

_base_id = param[0,-1,[0]];
_config_id = param[1,-1,[0]];
_gang_id = param[2,-1,[0]];
_raptor = param[3,-1,[0]];
_raptor_classname = param[4,"",[""]];

if(_base_id isEqualTo -1) exitWith {diag_log "Valor Error :: _base_id unknown"};
if(_config_id isEqualTo -1) exitWith {diag_log "Valor Error :: _config_id unknown"};
if(_gang_id isEqualTo -1) exitWith {diag_log "Valor Error :: _gang_id unknown"};
if(_raptor isEqualTo -1) exitWith {diag_log "Valor Error :: _raptor unknown"};
if(_raptor_classname isEqualTo "") exitWith {diag_log "Valor Error :: _raptor_classname unknown"};


_query = format["Select id, classname, pos, dir, vector, inventory from base_objects where base_id = '%1'",_base_id];
_res = [_query,2,true] call valor_fnc_db_sync;


{

	_id = _x select 0;
	_classname = _x select 1;
	_pos = _x select 2;
	_dir = call compile (_x select 3);
	_vector = _x select 4;
	_inv = _x select 5;
	_object = _classname createVehicle [0,0,10];
	waitUntil {!isnil "_object"};
	waitUntil {!isnull _object};
	_object setdir _dir;
	_object setVectorUp _vector;
	_object setposatl _pos;
	_object setdir _dir;
	_object allowDamage false;
	_object setVectorUp _vector;
	_object setvariable["valor_base_ids",[_base_id,_gang_id,_config_id,_id],true];
	if(_classname in ["B_CargoNet_01_ammo_F"]) then {
		_ret = [_object,_inv] call valor_fnc_loadVehicleCargo;
		if(_raptor isEqualTo 1) then {
			_range = ([_config_id] call valor_fnc_base_config) select 3;
			[_raptor_classname,_pos,_gang_id,_range] spawn valor_fnc_raptorMonitoring_server_group;
		};
	} else {
		if([_object] call valor_fnc_lockdoor) then {
			diag_log format["Valor Server :: The object %1 has been locked",_classname];
		};
	};

} foreach _res;

























