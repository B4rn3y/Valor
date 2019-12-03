private ["_config_id","_exit","_conf","_needed_items","_needed_items_names","_needed_items_amount","_got_items_names","_got_items_amount","_index","_missing","_amount_needed","_foreachindex","_amount_got","_text","_show_text","_classname","_actual_amount","_str_text","_pos_dependent","_dir_dependent","_vector_dependent","_object","_player_pos","_spawnpos","_place_id","_cancel_id","_cities","_can_be_placed","_min_distance_other_base","_min_distance_town","_nearestLocations","_cur_object","_pos","_confirm_id","_replace_id","_arr_with_object_data","_deleted_item_names","_deleted_item_amount","_amount_deleted"];



_config_id = param[0,-1,[0]];

if(_config_id isEqualTo -1) exitWith {systemchat "Valor :: Wrong or unknown base id"};
_exit = false;



if!(isnil "Placing_base") exitWith {systemchat "Valor :: You cant do that yet";_exit = true;};
if(isnil "valor_group") exitWith {diag_log "Valor_group is nil O.o";_exit = true;};
if(valor_group isEqualTo []) exitWith {systemchat "Valor :: You have to be in a group to build a base";_exit = true;};

Placing_base = true;

Valor_block_inventory = true;

Valor_base_place_Y = 0;









_conf = [_config_id,0] call valor_fnc_base_config;
_needed_items = _conf select 1;

_needed_items_names = [];
_needed_items_amount = [];

_got_items_names = [];
_got_items_amount = [];

{
	_needed_items_names pushback (_x select 0);
	_needed_items_amount pushback (_x select 1);
} foreach _needed_items;


{
	if(_x in _needed_items_names) then {
		_index = _got_items_names find _x;
		if(_index isEqualTo -1) then {
			_got_items_names pushback _x;
			_got_items_amount pushback 1;
		} else {
			_got_items_amount set[_index,(_got_items_amount select _index)+1];
		};
	};
} foreach (uniformItems player);

{
	if(_x in _needed_items_names) then {
		_index = _got_items_names find _x;
		if(_index isEqualTo -1) then {
			_got_items_names pushback _x;
			_got_items_amount pushback 1;
		} else {
			_got_items_amount set[_index,(_got_items_amount select _index)+1];
		};
	};
} foreach (vestitems player);


{
	if(_x in _needed_items_names) then {
		_index = _got_items_names find _x;
		if(_index isEqualTo -1) then {
			_got_items_names pushback _x;
			_got_items_amount pushback 1;
		} else {
			_got_items_amount set[_index,(_got_items_amount select _index)+1];
		};
	};
} foreach (backpackItems player);


_missing = [];
{
	_amount_needed = _needed_items_amount select _foreachindex;
	_index = _got_items_names find _x;
	if(_index isEqualTo -1) then {
		_missing pushback [_x,_amount_needed,0];
	} else {
		_amount_got = _got_items_amount select _index;
		if(_amount_got < _amount_needed) then {
			_missing pushBack [_x,_amount_needed,_amount_got];
		};
	};
} foreach _needed_items_names;

if!(_missing isEqualTo []) exitWith {
	Placing_base = nil;
	Valor_block_inventory = false;
	Valor_base_place_Y = nil;

	["You are missing Items"] spawn valor_fnc_exp_hint;
	_missing spawn {
		_text = (findDisplay 46) ctrlCreate ["RscStructuredText", -1];
		_text ctrlSetPosition [0.683614 * safezoneW + safezoneX,0.47668 * safezoneH + safezoneY,0.225859 * safezoneW,0.477222 * safezoneH];
		_text ctrlCommit 0;
		_show_text = "";
		{
			_classname = _x select 0;
			_actual_amount = _x select 2;
			_amount_needed = _x select 1;
			if(_actual_amount >= _amount_needed) then {
				_show_text = _show_text + format["<t size='1' color='#36FF00'>[%1/%2] - %3</t><br/>",_amount_needed,_actual_amount,gettext(configfile >> ([_classname] call valor_fnc_getconfig) >> _classname >> "displayname")];
			} else {
				_show_text = _show_text + format["<t size='1' color='#FF0000'>[%1/%2] - %3</t><br/>",_amount_needed,_actual_amount,gettext(configfile >> ([_classname] call valor_fnc_getconfig) >> _classname >> "displayname")];
			};
		} foreach _this;
		_text ctrlSetStructuredText parsetext _show_text;
		sleep 15;
		ctrlDelete _text;
	};
};



_str_text = (findDisplay 46) ctrlCreate ["RscStructuredText", -1];
_str_text ctrlSetPosition [0.5505,0.6936,0.521715,0.70606];
_str_text ctrlSetStructuredText parsetext format["<t color='%1' size='1'>Page UP</t> - Raise Base  <br/><t size='1' color='%1'>Page DOWN</t> - Lower Base ","#0007D8"];
_str_text ctrlCommit 0;


valor_all_base_objects = [];
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
	valor_all_base_objects pushBackUnique [_object,_pos_dependent,_dir_dependent,_vector_dependent];
} foreach (_conf select 0);







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
			_object setposatl [_spawnpos select 0, _spawnpos select 1, (_spawnpos select 2)+ Valor_base_place_Y];
			_object setvectorup (player vectorModelToWorld _vector_dependent);

		} foreach valor_all_base_objects;
	}
] call valor_fnc_stackOnEachFrame;


waitUntil {!isnil "Valor_base_placed"};


["Base_preview",{}] call valor_fnc_stackOnEachFrame;
sleep 0.1;

ctrlDelete _str_text;

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
	Valor_base_place_Y = nil;
	Valor_block_inventory = false;
	player removeAction _place_id;
	player removeAction _cancel_id;
};









_cities = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "cities");


_can_be_placed = true;
_min_distance_other_base = getnumber(missionConfigFile >> "Valor_settings" >> "bases" >> "min_distance_other_base");
_min_distance_town = getnumber(missionConfigFile >> "Valor_settings" >> "bases" >> "min_distance_town");

_nearestLocations = nearestlocations [position player, ["NameCity","NameVillage"], 2000];
{
	if((typeName _can_be_placed) isEqualTo "STRING") exitWith {};
	_cur_object = _x select 0;

	{
		if((_cur_object distance (getpos _x)) < _min_distance_town) exitWith {_can_be_placed = format["Too close to a city/village - Current Distance: %1m - Allowed: %2m",round(_cur_object distance (getpos _x)),_min_distance_town]};
	} foreach _nearestLocations;
	if((typeName _can_be_placed) isEqualTo "STRING") exitWith {};

	{
		_pos = getmarkerpos (_x select 0);
		if((_cur_object distance _pos) < _min_distance_town) exitWith {_can_be_placed = format["Too close to a Valor made city/village - Current Distance: %1m - Allowed: %2m",round(_cur_object distance _x),_min_distance_town]};
	} foreach _cities;

} foreach valor_all_base_objects;

if((typeName _can_be_placed) isEqualTo "STRING") then {
	[_can_be_placed] spawn valor_fnc_exp_hint;
	{
		deleteVehicle (_x select 0);
	} foreach valor_all_base_objects;
	Valor_base_placed = nil;
	valor_all_base_objects = nil;
	valor_objectarray_placed_hidden = nil;
	valor_objectarray_placed_show = nil;
	Placing_base = nil;
	Valor_base_place_Y = nil;
	Valor_block_inventory = false;

	[_config_id] spawn valor_fnc_place_wall;
};




_max_distance_wall = getnumber(missionConfigFile >> "Valor_settings" >> "bases" >> "max_distance_wall");
_can_be_placed = format["You can only build near a base you have access to (range: %1)",_max_distance_wall];
{
	_var = _x getVariable["valor_base_ids",[-1,-1,-1]];
	if!(isnil "_var") then {
		_base_id = _var select 0;
		if([_base_id,_max_distance_wall] call valor_fnc_has_base_access) exitWith {_can_be_placed = true;};
	};
	_var = nil;
}  foreach (nearestObjects[player,["B_CargoNet_01_ammo_F"],_max_distance_wall]);



if((typeName _can_be_placed) isEqualTo "STRING") then {
	[_can_be_placed] spawn valor_fnc_exp_hint;
	{
		deleteVehicle (_x select 0);
	} foreach valor_all_base_objects;
	Valor_base_placed = nil;
	valor_all_base_objects = nil;
	valor_objectarray_placed_hidden = nil;
	valor_objectarray_placed_show = nil;
	Placing_base = nil;
	Valor_base_place_Y = nil;
	Valor_block_inventory = false;

	[_config_id] spawn valor_fnc_place_wall;
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
	Valor_base_place_Y = nil;
	Valor_block_inventory = false;
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
	Valor_base_place_Y = nil;
	Valor_block_inventory = false;

	[_config_id] spawn valor_fnc_place_wall;
};


_arr_with_object_data = [];
{
	_object = _x select 0;
	_arr_with_object_data pushback [typeof _object,getposatl _object, getdir _object, vectorUp _object];
} foreach valor_all_base_objects;

{
	deleteVehicle (_x select 0);
} foreach valor_all_base_objects;

Valor_base_placed = nil;
valor_all_base_objects = nil;
valor_objectarray_placed_hidden = nil;
valor_objectarray_placed_show = nil;
Placing_base = nil;
Valor_base_place_Y = nil;
Valor_block_inventory = false;


if(valor_group isEqualTo []) exitWith {["You are not part of a group"] spawn valor_fnc_exp_hint;};

_needed_items_names = [];
_needed_items_amount = [];

_got_items_names = [];
_got_items_amount = [];

{
	_needed_items_names pushback (_x select 0);
	_needed_items_amount pushback (_x select 1);
} foreach _needed_items;


{
	if(_x in _needed_items_names) then {
		_index = _got_items_names find _x;
		if(_index isEqualTo -1) then {
			_got_items_names pushback _x;
			_got_items_amount pushback 1;
		} else {
			_got_items_amount set[_index,(_got_items_amount select _index)+1];
		};
	};
} foreach (uniformItems player);

{
	if(_x in _needed_items_names) then {
		_index = _got_items_names find _x;
		if(_index isEqualTo -1) then {
			_got_items_names pushback _x;
			_got_items_amount pushback 1;
		} else {
			_got_items_amount set[_index,(_got_items_amount select _index)+1];
		};
	};
} foreach (vestitems player);


{
	if(_x in _needed_items_names) then {
		_index = _got_items_names find _x;
		if(_index isEqualTo -1) then {
			_got_items_names pushback _x;
			_got_items_amount pushback 1;
		} else {
			_got_items_amount set[_index,(_got_items_amount select _index)+1];
		};
	};
} foreach (backpackItems player);


_missing = [];
{
	_amount_needed = _needed_items_amount select _foreachindex;
	_index = _got_items_names find _x;
	if(_index isEqualTo -1) then {
		_missing pushback [_x,_amount_needed,0];
	} else {
		_amount_got = _got_items_amount select _index;
		if(_amount_got < _amount_needed) then {
			_missing pushBack [_x,_amount_needed,_amount_got];
		};
	};
} foreach _needed_items_names;

if!(_missing isEqualTo []) exitWith {
	Placing_base = nil;
	Valor_block_inventory = false;
	Valor_base_place_Y = nil;

	["You are missing Items"] spawn valor_fnc_exp_hint;
	_missing spawn {
		_text = (findDisplay 46) ctrlCreate ["RscStructuredText", -1];
		_text ctrlSetPosition [0.683614 * safezoneW + safezoneX,0.47668 * safezoneH + safezoneY,0.225859 * safezoneW,0.477222 * safezoneH];
		_text ctrlCommit 0;
		_show_text = "";
		{
			_classname = _x select 0;
			_actual_amount = _x select 2;
			_amount_needed = _x select 1;
			if(_actual_amount >= _amount_needed) then {
				_show_text = _show_text + format["<t size='1' color='#36FF00'>[%1/%2] - %3</t><br/>",_amount_needed,_actual_amount,gettext(configfile >> ([_classname] call valor_fnc_getconfig) >> _classname >> "displayname")];
			} else {
				_show_text = _show_text + format["<t size='1' color='#FF0000'>[%1/%2] - %3</t><br/>",_amount_needed,_actual_amount,gettext(configfile >> ([_classname] call valor_fnc_getconfig) >> _classname >> "displayname")];
			};
		} foreach _this;
		_text ctrlSetStructuredText parsetext _show_text;
		sleep 15;
		ctrlDelete _text;
	};
};

_deleted_item_names = [];
_deleted_item_amount = [];
{
	if(_x in _needed_items_names) then {
		_index = _deleted_item_names find _x;
		_index_needed = _needed_items_names find _x;
		if(_index isEqualTo -1) then {
			_deleted_item_names pushback _x;
			_deleted_item_amount pushback 1;
			player removeItemFromUniform _x;
		} else {
			_amount_deleted = _deleted_item_amount select _index;
			_amount_needed = _needed_items_amount select _index_needed;
			if!(_amount_deleted >= _amount_needed) then {
				_deleted_item_amount set[_index,(_deleted_item_amount select _index)+1];
				player removeItemFromUniform _x;
			};
		};
	};
} foreach (uniformItems player);

{
	if(_x in _needed_items_names) then {
		_index = _deleted_item_names find _x;
		_index_needed = _needed_items_names find _x;
		if(_index isEqualTo -1) then {
			_deleted_item_names pushback _x;
			_deleted_item_amount pushback 1;
			player removeItemFromVest _x;
		} else {
			_amount_deleted = _deleted_item_amount select _index;
			_amount_needed = _needed_items_amount select _index_needed;
			if!(_amount_deleted >= _amount_needed) then {
				_deleted_item_amount set[_index,(_deleted_item_amount select _index)+1];
				player removeItemFromVest _x;
			};
		};
	};
} foreach (vestitems player);

{
	if(_x in _needed_items_names) then {
		_index = _deleted_item_names find _x;
		_index_needed = _needed_items_names find _x;
		if(_index isEqualTo -1) then {
			_deleted_item_names pushback _x;
			_deleted_item_amount pushback 1;
			player removeItemFromBackpack _x;
		} else {
			_amount_deleted = _deleted_item_amount select _index;
			_amount_needed = _needed_items_amount select _index_needed;
			if!(_amount_deleted >= _amount_needed) then {
				_deleted_item_amount set[_index,(_deleted_item_amount select _index)+1];
				player removeItemFromBackpack _x;
			};
		};
	};
} foreach (backpackitems player);







[[player,_arr_with_object_data,(valor_group select 0)],"valor_fnc_insert_wall",2] call valor_fnc_remoteexec;



















































