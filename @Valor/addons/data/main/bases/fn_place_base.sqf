
_config_id = param[0,-1,[0]];
_replace = param[1,false,[false]];
if(_config_id isEqualTo -1) exitWith {systemchat "Valor :: Wrong or unknown base id"};
_exit = false;



if!(isnil "Placing_base") exitWith {systemchat "Valor :: You cant do that yet";_exit = true;};
if(isnil "valor_group") exitWith {diag_log "Valor_group is nil O.o";_exit = true;};
if(valor_group isEqualTo []) exitWith {systemchat "Valor :: You have to be in a group to build a base";_exit = true;};

Placing_base = true;


_max_lvl = [_config_id] call valor_fnc_get_max_base_level;

_objects = [];
for "_d" from 0 to _max_lvl do {
	_cur_objects = ([_config_id,_d] call valor_fnc_base_config) select 0;
	_objects pushback _cur_objects;
};

_all_objects_unique = [];
{
	{
		_all_objects_unique pushBackUnique _x;
	} foreach _x;
} foreach _objects;



_find_entry =
{
	_entry = _this;
	_ret = [];
	{
		_ix = _foreachindex;
		{
			if(_entry isEqualTo _x) exitWith {_ret pushback _ix;};
		} foreach _x;

	} foreach _objects;
	_ret
};



_objects_with_Data = [];
{
	_obj = _x;
	_other_entries = _obj call _find_entry;
	_obj pushback _other_entries;
	_objects_with_Data pushback _obj;
} foreach _all_objects_unique;



_show_objects = [];
_hide_objects = [];


{
	_stage = _x select 4;
	if(_max_lvl in _stage) then {
		_show_objects pushback _x;
	} else {
		_hide_objects pushback _x;
	};
} foreach _objects_with_Data;



valor_objectarray_placed_hidden = [];
{
	_classname = _x select 0;
	_pos_dependent = _x select 1;
	_dir_dependent = _x select 2;
	_vector_dependent = _x select 3;
	_stage = _x select 4;

	_object = _classname createvehiclelocal[0,0,10];
	_player_pos = getposatl player;
	_spawnpos = player modelToWorld _pos_dependent;
	_object setvariable["valor_base_ids",[0,0,0,0]];
	_object setdir (_dir_dependent + getdir player);
	_object setposatl _spawnpos;
	_object hideObject true;
	_object setvectorup (player vectorModelToWorld _vector_dependent);
	valor_objectarray_placed_hidden pushBackUnique [_object,_pos_dependent,_dir_dependent,_vector_dependent,_stage];
} foreach _hide_objects;




valor_objectarray_placed_show = [];
{
	_classname = _x select 0;
	_pos_dependent = _x select 1;
	_dir_dependent = _x select 2;
	_vector_dependent = _x select 3;
	_stage = _x select 4;

	_object = _classname createvehiclelocal[0,0,10];
	_player_pos = getposatl player;
	_spawnpos = player modelToWorld _pos_dependent;
	_object setvariable["valor_base_ids",[0,0,0,0]];
	_object setdir (_dir_dependent + getdir player);
	_object setposatl _spawnpos;
	_object setvectorup (player vectorModelToWorld _vector_dependent);
	valor_objectarray_placed_show pushBackUnique [_object,_pos_dependent,_dir_dependent,_vector_dependent,_stage];
} foreach _show_objects;

valor_all_base_objects = [];
valor_all_base_objects append valor_objectarray_placed_show;
valor_all_base_objects append valor_objectarray_placed_hidden;






_place_id = player addaction["Place",{Valor_base_placed = true;}];
_cancel_id = player addaction["Cancel",{Valor_base_placed = false;}];



[
	"Base_preview",
	{
		{
			_object = _x select 0;
			_pos_dependent = _x select 1;
			_dir_dependent = _x select 2;
			_vector_dependent = _x select 3;

			_player_pos = getposatl player;
			_spawnpos = player modelToWorld _pos_dependent;
			_object setdir (_dir_dependent + getdir player);
			_object setposatl _spawnpos;
			_object setvectorup (player vectorModelToWorld _vector_dependent);

		} foreach valor_all_base_objects;
	}
] call valor_fnc_stackOnEachFrame;


waitUntil {!isnil "Valor_base_placed"};


["Base_preview",{}] call valor_fnc_stackOnEachFrame;
sleep 0.1;

if!(Valor_base_placed) exitWith
{
	{
		deleteVehicle (_x select 0);
	} foreach valor_all_base_objects;
	Valor_base_placed = nil;
	valor_all_base_objects = nil;
	valor_objectarray_placed_hidden = nil;
	valor_objectarray_placed_show = nil;
	Placing_base = nil;
	player removeAction _place_id;
	player removeAction _cancel_id;
};

Valor_base_placed = nil;



player removeAction _place_id;
player removeAction _cancel_id;
_confirm_id = player addaction["Confirm placement",{Valor_base_placed = true;}];
_replace_id = player addaction["Replace",{Valor_base_placed = false;}];
_cancel_id = player addaction["Cancel",{Valor_base_placed = "cancel";}];

waitUntil {!isnil "Valor_base_placed"};

player removeAction _confirm_id;
player removeAction _replace_id;
player removeAction _cancel_id;
["Base_preview",{}] call valor_fnc_stackOnEachFrame;
sleep 0.1;


if(Valor_base_placed isEqualTo "cancel") exitWith
{

	{
		deleteVehicle (_x select 0);
	} foreach valor_all_base_objects;
	Valor_base_placed = nil;
	valor_all_base_objects = nil;
	valor_objectarray_placed_hidden = nil;
	valor_objectarray_placed_show = nil;
	Placing_base = nil;
};


if!(Valor_base_placed) exitWith {
	{
		deleteVehicle (_x select 0);
	} foreach valor_all_base_objects;
	Valor_base_placed = nil;
	valor_all_base_objects = nil;
	valor_objectarray_placed_hidden = nil;
	valor_objectarray_placed_show = nil;
	Placing_base = nil;

	[_config_id] spawn valor_fnc_place_base;
};


_arr_with_object_data = [];
{
	_object = _x select 0;
	_arr_with_object_data pushback [typeof _object,getposatl _object, getdir _object, vectorUp _object,_x select 4];
} foreach valor_all_base_objects;

{
	deleteVehicle (_x select 0);
} foreach valor_all_base_objects;

Valor_base_placed = nil;
valor_all_base_objects = nil;
valor_objectarray_placed_hidden = nil;
valor_objectarray_placed_show = nil;
Placing_base = nil;



if(valor_group isEqualTo []) exitWith {["You are not part of a group"] spawn valor_fnc_exp_hint;};

[[player,_config_id,_arr_with_object_data,(valor_group select 0),(valor_group select 2)],"valor_fnc_insert_base",2] call valor_fnc_remoteexec;















































