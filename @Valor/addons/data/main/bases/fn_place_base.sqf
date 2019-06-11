private ["_base_config","_blueprint","_blueprint_itembox","_classname","_pos_dependent","_dir_dependent","_vector_dependent","_object","_player_pos","_spawnpos","_ammobox","_pos","_id_place","_id_cancel","_id_evh","_restart","_message_server","_id_confirm"];
_id = param[0,-1,[0]];
if(_id isEqualTo -1) exitWith {systemchat "Valor :: Wrong or unknown base id"};
if!(isnil "Valor_placed") exitWith {systemchat "Valor :: You cant do that yet"};
if!(isnil "Valor_confirm_place") exitWith {systemchat "Valor :: You cant do that yet"};
if!(isnil "Placing_base") exitWith {systemchat "Valor :: You cant do that yet"};
if(isnil "valor_group") exitWith {diag_log "Valor_group is nil O.o"};
if(valor_group isEqualTo []) exitWith {systemchat "Valor :: You have to be in a group to build a base"};

Placing_base = true;

_base_config = [_id] call valor_fnc_base_config;

_blueprint = _base_config select 0;
_blueprint_itembox = _base_config select 1;
Valor_config_id = _id;




if(isnil "_blueprint") exitWith {hint "_blueprint unknown"; Placing_base = nil;};
valor_objectarray_placed = [];
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
	valor_objectarray_placed pushBackUnique [_object,_pos_dependent,_dir_dependent,_vector_dependent];
} foreach _blueprint;

_ammobox = (_blueprint_itembox select 0) createVehicleLocal [0,0,10];
hideObject _ammobox;
_pos = player modelToWorld (_blueprint_itembox select 1);
_ammobox setposatl _pos;
_ammobox setdir ((_blueprint_itembox select 2) + getdir player);
_ammobox setvectorup (player vectorModelToWorld (_blueprint_itembox select 3));

Valor_blueprint_itembox = [_ammobox,(_blueprint_itembox select 0),(_blueprint_itembox select 1),(_blueprint_itembox select 2),(_blueprint_itembox select 3)];

_id_place = player addaction["Place",{Valor_placed = true}];
_id_cancel = player addaction["Cancel",{Valor_placed = false;}];



_id_evh = addMissionEventHandler ["EachFrame", {
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

	} foreach valor_objectarray_placed;

	_ammobox = Valor_blueprint_itembox select 0;
	_player_pos = getposatl player;
	_spawnpos = player modelToWorld (Valor_blueprint_itembox select 2);
	_ammobox setdir ((Valor_blueprint_itembox select 3) + getdir player);
	_ammobox setposatl _spawnpos;
	_ammobox setvectorup (player vectorModelToWorld (Valor_blueprint_itembox select 4));


}];

waitUntil {!isnil "Valor_placed"};

player removeAction _id_place;
player removeAction _id_cancel;

removeMissionEventHandler["EachFrame",_id_evh];

_restart = false;
if(Valor_placed) then {

	_ammobox = Valor_blueprint_itembox select 0;
	_message_server = [];
	{
		_object = _x select 0;
		_message_server pushBackUnique [typeof _object,getposatl _object, getdir _object, vectorUp _object];

	} foreach valor_objectarray_placed;

	_id_confirm = player addaction["Confirm Base Placement",{Valor_confirm_place = true}];
	_id_cancel = player addaction["Replace Base",{Valor_confirm_place = false}];

	waitUntil {!isnil "Valor_confirm_place"};

	player removeAction _id_confirm;
	player removeAction _id_cancel;

	if(Valor_confirm_place) then {

		{
			_object = _x select 0;
			deleteVehicle _object;
		} foreach valor_objectarray_placed;
		valor_objectarray_placed = nil;

					 // Here goes the Gang ID
		if(valor_group isEqualTo []) exitWith {systemchat "Valor :: You are not in a group anymore"};
		[_message_server,(Valor_group select 0),player,Valor_config_id,[typeof _ammobox,getposatl _ammobox,getdir _ammobox,vectorUp _ammobox]] remoteExec["valor_fnc_insert_base",2];
		deleteVehicle _ammobox;
		systemchat "The request has been send to the server, please stand by.";
	} else {
		{
			_object = _x select 0;
			deleteVehicle _object;
		} foreach valor_objectarray_placed;
		valor_objectarray_placed = nil;
		_restart = true;
	};


} else {
	{
		_object = _x select 0;
		deleteVehicle _object;
	} foreach valor_objectarray_placed;
	valor_objectarray_placed = nil;
};
Valor_config_id = nil;
Valor_blueprint_itembox = nil;
Placing_base = nil;
Valor_confirm_place = nil;
Valor_placed = nil;

if(_restart) then {
	[_id] spawn valor_fnc_place_base;
};