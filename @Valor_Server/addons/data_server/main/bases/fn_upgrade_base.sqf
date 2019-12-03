private ["_base_id","_config_id","_layout_id","_container","_pos","_max","_max_lvl","_query","_res","_this_layout","_new_box","_box","_delete_DB","_needed_stage","_d","_classname","_dir","_vec","_inv","_stage","_object","_delete","_delete_DB_2","_str","_arr","_new_arr","_entry_list"];


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

_max = false;
_max_lvl = [_config_id] call valor_fnc_get_max_base_level;
if(_max_lvl isEqualTo (_layout_id +1)) then {
	_max = true;
};

if(_max) then {
	_query = format["Update bases set classname = '%2' where base_id = '%1'",_base_id, str(getText(missionConfigFile >> "Valor_settings" >> "bases" >> "base_box_max_level"))];
	[_query,1] call valor_fnc_db_sync;
};


_query = format["Select classname, pos, dir, vector, inventory, id, layout_id from base_objects where base_id = '%1'",_base_id];
_res = [_query,2,true] call valor_fnc_db_sync;

_this_layout = _layout_id + 1;

_base_box_classname = getarray(missionConfigFile >> "Valor_settings" >> "bases" >> "base_box_classnames");

_new_box = [];
_box = objNull;

_delete_DB = [];
_needed_stage = [];
for "_d" from _this_layout to _max_lvl do {
	_needed_stage pushBack _d;
};

{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = call compile(_x select 2);
	_vec = _x select 3;
	_inv = _x select 4;
	_id = _x select 5;
	_stage = call compile(_x select 6);

	if(_layout_id in _stage && !(_this_layout in _stage)) then {
		deletevehicle nearestObject[_pos,_classname];
	};

	if(_this_layout in _stage && !(_layout_id in _stage)) then {
		_object = _classname createVehicle [0,0,10];
		waitUntil {!isnil "_object"};
		waitUntil {!isnull _object};
		_object setdir _dir;
		_object setVectorUp _vec;
		_object setposatl _pos;
		_object setdir _dir;
		_object allowDamage false;
		_object setVectorUp _vec;
		_object setvariable["valor_base_ids",[_base_id,_config_id,_this_layout],true];

		if(_classname in _base_box_classname) then {
			_new_box = _x;
			[_object] call valor_fnc_clear_vehicle;
			_box = _object;
		};

		if([_object] call valor_fnc_lockdoor) then {
			diag_log format["Valor Server :: The object %1 has been locked",_classname];
		};
	};

	_delete = true;
	{
		if(_x in _needed_stage) then {_delete = false;};
	} foreach _stage;

	if(_delete) then {
		_delete_DB pushBackUnique _id;
	};

} foreach _res;





if!(_delete_DB isEqualTo []) then {
	_delete_DB_2 = [];
	{
		_delete_DB_2 pushBack str _x;
	} foreach _delete_DB;

	_str = str _delete_DB_2;
	_arr = toArray _str;
	_new_arr = [];

	{
		switch (_x) do
		{
			case 91:
			{
				_new_arr pushback 40;
			};

			case 93:
			{
				_new_arr pushback 41;
			};

			case 34:
			{
				_new_arr pushback 39;
			};

			default
			{
				_new_arr pushback _x;
			};
		};
	} foreach _arr;



	_query = format["Delete from base_objects where id in %1",toString _new_arr];
	[_query,1] call valor_fnc_db_sync;

};




if!(_new_box isEqualTo []) then {
	_query = format["Delete from base_objects where id = '%1'",_new_box select 5];
	[_query,1] call valor_fnc_db_sync;

	_query = format["Update bases set pos = '%1', dir = '%2', vector = '%3', inventory = '%4', layout_id = '%5' where base_id = '%6'",_new_box select 1, call compile(_new_box select 2),_new_box select 3,[_box] call valor_fnc_getvehiclecargo,(_layout_id + 1),_base_id];
	[_query,1] call valor_fnc_db_sync;

	_query = format["Select entry_list,owner from bases where base_id = '%1'",_base_id];
	_entry_list = [_query,2] call valor_fnc_db_sync;
	_owner = _entry_list select 1;
	_entry_list = _entry_list select 0;

	_box setvariable["valor_base_ids",[_base_id,_config_id,_layout_id+1,_entry_list,_owner],true];
};

sleep 10;
missionNamespace setvariable[format["valor_base_%1",_base_id],nil];




sleep 60;

if(isnull _box) exitWith {};
_box setposatl (_new_box select 1);
_box setdir (_new_box select 2);
_box setVectorUp (_new_box select 3);











