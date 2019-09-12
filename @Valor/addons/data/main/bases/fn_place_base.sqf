
_config_id = param[0,-1,[0]];
_replace = param[1,false,[false]];
if(_id isEqualTo -1) exitWith {systemchat "Valor :: Wrong or unknown base id"};
_exit = false;
if!(_replace) then {


	if!(isnil "Placing_base") exitWith {systemchat "Valor :: You cant do that yet";_exit = true;};
	if(isnil "valor_group") exitWith {diag_log "Valor_group is nil O.o";_exit = true;};
	if(valor_group isEqualTo []) exitWith {systemchat "Valor :: You have to be in a group to build a base";_exit = true;};

	Placing_base = true;

	_objects_h = [];
	_counter = 0;
	while{true} do {
		_conf = [_config_id,_counter] call valor_fnc_base_config;
		if(_conf isEqualTo []) exitWith {_counter = _counter - 1;};
		_objects_blueprint = _conf select 0;
		_objects_h append [[_objects_blueprint,_counter]];
		_counter = _counter + 1;
	};

	if(_counter isEqualTo 0 || _counter isEqualTo -1) exitWith {Placing_base = nil;_exit = true;};


	_base_conf_min = [_config_id,0] call valor_fnc_base_config;
	_base_conf_max = [_config_id,_counter] call valor_fnc_base_config;
	diag_log str _objects_h;
	_objects_h = _objects_h - [[(_base_conf_max select 0),_counter]];
	_objects_h = _objects_h - [[(_base_conf_min select 0),0]];
	diag_log str _objects_h;

	if!(_objects_h isEqualTo []) then {
		_objects_hidden = [];
		{
			_id = _x select 1;
			_bp = _x select 0;
			{
				_data = _x;
				_data pushback _id;
				_objects_hidden pushBack _data;
			} foreach _bp;
		} foreach _objects_h;


		valor_objectarray_placed_hidden = [];
		{
			_classname = _x select 0;
			_pos_dependent = _x select 1;
			_dir_dependent = _x select 2;
			_vector_dependent = _x select 3;
			_id = _x select 4;

			_object = _classname createvehiclelocal[0,0,10];
			_player_pos = getposatl player;
			_spawnpos = player modelToWorld _pos_dependent;
			_object setvariable["valor_base_ids",[0,0,0,0]];
			_object setdir (_dir_dependent + getdir player);
			_object setposatl _spawnpos;
			_object hideObject true;
			_object setvectorup (player vectorModelToWorld _vector_dependent);
			valor_objectarray_placed_hidden pushBackUnique [_object,_pos_dependent,_dir_dependent,_vector_dependent,_id];
		} foreach _objects_hidden;
	};


	valor_objectarray_placed_hidden_min = [];
	{
		_classname = _x select 0;
		_pos_dependent = _x select 1;
		_dir_dependent = _x select 2;
		_vector_dependent = _x select 3;

		_object = _classname createvehiclelocal[0,0,10];
		_player_pos = getposatl player;
		_spawnpos = player modelToWorld _pos_dependent;
		_object setvariable["valor_base_ids",[0,0,0,0]];
		_object setdir (_dir_dependent + getdir player);
		_object setposatl _spawnpos;
		_object hideObject true;
		_object setvectorup (player vectorModelToWorld _vector_dependent);
		valor_objectarray_placed_hidden_min pushBackUnique [_object,_pos_dependent,_dir_dependent,_vector_dependent,0];
	} foreach (_base_conf_min select 0);





	valor_objectarray_placed_hidden_max = [];
	{
		_classname = _x select 0;
		_pos_dependent = _x select 1;
		_dir_dependent = _x select 2;
		_vector_dependent = _x select 3;

		_object = _classname createvehiclelocal[0,0,10];
		_player_pos = getposatl player;
		_spawnpos = player modelToWorld _pos_dependent;
		_object setvariable["valor_base_ids",[0,0,0,0]];
		_object setdir (_dir_dependent + getdir player);
		_object setposatl _spawnpos;
		_object setvectorup (player vectorModelToWorld _vector_dependent);
		valor_objectarray_placed_hidden_max pushBackUnique [_object,_pos_dependent,_dir_dependent,_vector_dependent,_counter];
	} foreach (_base_conf_max select 0);

	valor_all_base_objects = [];
	valor_all_base_objects append valor_objectarray_placed_hidden_min;
	valor_all_base_objects append valor_objectarray_placed_hidden_max;
	iF!(isnil "valor_objectarray_placed_hidden") then {
		valor_all_base_objects append valor_objectarray_placed_hidden;
	};
};

if(_exit) exitWith {};

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
	valor_objectarray_placed_hidden_min = nil;
	valor_objectarray_placed_hidden_max = nil;
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
	valor_objectarray_placed_hidden_min = nil;
	valor_objectarray_placed_hidden_max = nil;
	Placing_base = nil;
};


if!(Valor_base_placed) exitWith {
	[_config_id,true] spawn valor_fnc_place_base;
};


_arr_with_object_data = [];
{
	_data_set = [];
	_object = _x select 0;
	_data_set pushback [typeof _object,getposatl _object, getdir _object, vectorUp _object,_x select 4];
} foreach valor_all_base_objects;

Valor_base_placed = nil;
valor_all_base_objects = nil;
valor_objectarray_placed_hidden = nil;
valor_objectarray_placed_hidden_min = nil;
valor_objectarray_placed_hidden_max = nil;
Placing_base = nil;

{
	deleteVehicle (_x select 0);
} foreach valor_all_base_objects;


if(valor_group isEqualTo []) exitWith {["You are not part of a group"] spawn valor_fnc_exp_hint;};

[[player,valor_group select 0,_arr_with_object_data],"valor_fnc_insert_base",2] call valor_fnc_remoteexec;






















