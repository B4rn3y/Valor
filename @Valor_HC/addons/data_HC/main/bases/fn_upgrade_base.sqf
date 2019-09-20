private ["_base_id","_config_id","_layout_id","_container","_pos","_conf","_max","_max_lvl","_classnames","_objects","_var","_bid","_query","_res","_objects_with_pos","_new_box","_box","_classname","_dir","_vector","_inv","_object","_owner"];



_base_id = param[0,-1,[0]];
_config_id = param[1,-1,[0]];
_layout_id = param[2,-1,[0]];
_container = param[3,objNull,[objNull]];

if(_config_id isEqualTo -1) exitWith {};
if(_layout_id isEqualTo -1) exitWith {};
if(_base_id isEqualTo -1) exitWith {};
if(isnull _container) exitWith {};


_pos = getpos _container;
deleteVehicle _container;

sleep random 3;
if((missionNamespace getvariable[format["valor_base_%1",_base_id],false])) exitWith {};

missionNamespace setvariable[format["valor_base_%1",_base_id],true];


_conf = ([_config_id,_layout_id] call valor_fnc_base_config) select 0;

_max = false;
_max_lvl = [_config_id] call valor_fnc_get_max_base_level;
if(_max_lvl isEqualTo (_layout_id +1)) then {
	_max = true;
};

_classnames = [];

{
	_classnames pushBackUnique (_x select 0);
} foreach _conf;


_objects = nearestObjects[_pos,_classnames,150];

{
	_var = _x getvariable ["valor_base_ids",[]];
	iF!(_var isEqualTo []) then {
		_bid = _var select 0;
		if(_bid isEqualTo _base_id) then {
			deleteVehicle _x;
		};
	};
} foreach _objects;


_query = format["Delete from base_objects where base_id = '%1' and layout_id = '%2'",_base_id,_layout_id];
_res = [_query,1] call valor_fnc_db_sync;

_query = format["Select classname, pos, dir, vector, inventory, id from base_objects where base_id = '%1' and layout_id = '%2'",_base_id,(_layout_id + 1)];
_res = [_query,2,true] call valor_fnc_db_sync;


_objects_with_pos = [];
_new_box = [];
_box = objNull;
{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = call compile (_x select 2);
	_vector = _x select 3;
	_inv = _x select 4;
	_id = _x select 5;

	_object = _classname createVehicle [0,0,10];
	waitUntil {!isnil "_object"};
	waitUntil {!isnull _object};
	_object setdir _dir;
	_object setVectorUp _vector;
	_object setposatl _pos;
	_object setdir _dir;
	_object allowDamage false;
	_object setVectorUp _vector;
	_object setvariable["valor_base_ids",[_base_id,_config_id,_layout_id+1],true];
	_objects_with_pos pushBack [_object,_pos];
	if(_classname isEqualTo "B_CargoNet_01_ammo_F") then {
		_new_box = _x;
		[_object] call valor_fnc_clear_vehicle;
		_box = _object;
	};

	if([_object] call valor_fnc_lockdoor) then {
		diag_log format["Valor Server :: The object %1 has been locked",_classname];
	};
} foreach _res;

if!(_new_box isEqualTo []) then {
	_query = format["Delete from base_objects where id = '%1'",_new_box select 5];
	[_query,1] call valor_fnc_db_sync;

	_query = format["Update bases set pos = '%1', dir = '%2', vector = '%3', inventory = '%4', layout_id = '%5' where base_id = '%6'",_new_box select 1, call compile(_new_box select 2),_new_box select 3,[_box] call valor_fnc_getvehiclecargo,(_layout_id + 1),_base_id];
	[_query,1] call valor_fnc_db_sync;

	_query = format["Select entry_list from bases where base_id = '%1'",_base_id];
	_entry_list = [_query,2] call valor_fnc_db_sync;
	_entry_list = _entry_list select 0;

	_box setvariable["valor_base_ids",[_base_id,_config_id,_layout_id+1,_entry_list],true];
};

missionNamespace setvariable[format["valor_base_%1",_base_id],nil];
//[_objects_with_pos] remoteExec["valor_fnc_set_base_objects",-2];




