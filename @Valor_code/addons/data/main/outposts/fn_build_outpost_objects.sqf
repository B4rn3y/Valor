
private ["_outpost_id","_config_id","_inventory","_build","_classname","_pos","_dir","_vector","_public","_addaction","_object","_ret"];

_outpost_id = param[0,-1,[0]];
_config_id = param[1,-1,[0]];
_inventory = param[2,"",["",[]]];
_build = param[3,-1,[0]];
if(_outpost_id isEqualTo -1) exitWith {diag_log "Valor Error :: _outpost_id unknown"};
if(_config_id isEqualTo -1) exitWith {diag_log "Valor Error :: _config_id unknown"};
if(_build isEqualTo -1) exitWith {diag_log "Valor Error :: _build unknown"};

_isserver = if(isServer && !HC_AVAILABLE) then {true} else {false};
if(!hasInterface && !isDedicated && HC_AVAILABLE) then {
	_isserver = true;
};
_base_box_classname = getarray(missionConfigFile >> "Valor_settings" >> "bases" >> "base_box_classnames");

if(_build isEqualTo 1) then {

	{
		_classname = _x select 0;
		_pos = _x select 1;
		_dir = _x select 2;
		_vector = _x select 3;
		_public = _x select 4;
		_addaction = "";
		if(_public && _isserver) then {
			_object = _classname createVehicle [0,0,10];
			waitUntil {!isnil "_object"};
			waitUntil {!isnull _object};
			_object setdir _dir;
			_object setVectorUp _vector;
			_object setposatl _pos;
			_object setdir _dir;
			_object allowDamage false;
			_object setVectorUp _vector;
			_object setvariable["valor_outpost_ids",[_outpost_id,_config_id,_build],true];
			if(_classname in _base_box_classname) then {
				_ret = [_object,_inventory] call valor_fnc_loadVehicleCargo;
			};
		};

		iF!(_public) then {
			_object = _classname createVehiclelocal [0,0,10];
			waitUntil {!isnil "_object"};
			waitUntil {!isnull _object};
			_object setdir _dir;
			_object setVectorUp _vector;
			_object setposatl _pos;
			_object setdir _dir;
			_object allowDamage false;
			_object setVectorUp _vector;
			_object setvariable["valor_outpost_ids",[_outpost_id,_config_id,_build]];
			if(count _x isEqualTo 6) then {
				_addaction = _x select 5;
				call compile _addaction;
			};
		};

	} foreach (([_config_id] call valor_fnc_outpost_config) select 0);
} else {

	{
		_classname = _x select 0;
		_pos = _x select 1;
		_dir = _x select 2;
		_vector = _x select 3;
		_public = _x select 4;
		if(_public && _isserver) then {
			_object = _classname createVehicle [0,0,10];
			waitUntil {!isnil "_object"};
			waitUntil {!isnull _object};
			_object setdir _dir;
			_object setVectorUp _vector;
			_object setposatl _pos;
			_object setdir _dir;
			_object allowDamage false;
			_object setVectorUp _vector;
			_object setvariable["valor_outpost_ids",[_outpost_id,_config_id,_build],true];
			if(_classname in _base_box_classname) then {
				_ret = [_object,_inventory] call valor_fnc_loadVehicleCargo;
			};
		};

		iF!(_public) then {
			_object = _classname createVehiclelocal [0,0,10];
			waitUntil {!isnil "_object"};
			waitUntil {!isnull _object};
			_object setdir _dir;
			_object setVectorUp _vector;
			_object setposatl _pos;
			_object setdir _dir;
			_object allowDamage false;
			_object setVectorUp _vector;
			_object setvariable["valor_outpost_ids",[_outpost_id,_config_id,_build]];
			if(count _x isEqualTo 6) then {
				_addaction = _x select 5;
				call compile _addaction;
			};
		};
	} foreach (([_config_id] call valor_fnc_outpost_config) select 1);
};

























