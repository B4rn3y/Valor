
private ["_requester","_config_id","_objects","_layout_id","_h","_blueprint_itembox","_objects_to_build","_ammobox_0","_classname","_pos","_dir","_vec","_level","_query","_queryResult","_objects_with_pos","_box","_inventory","_base_id","_obj","_doors"];




_requester = param[0,objNull,[objNull]];
_config_id = param[1,-1,[0]];
_objects = param[2,[],[[]]];
_group_id = param[3,-1,[0]];
_group_name = param[4,"",[""]];
_layout_id = 0;
_h = 10;
_entry_list = [[getplayeruid _requester,name _requester],[_group_id,_group_name]];
_owner = getPlayerUID player;
diag_log "Valor Server :: Request received";



if(isnull _requester) exitWith {diag_log "Valor Error :: _requester unknown"};
if(_group_id isEqualTo -1) exitWith {diag_log "Valor Error :: _group_id unknown"};
if(_config_id isEqualTo -1) exitWith {diag_log "Valor Error :: _config_id unknown"};
if(_objects isEqualTo []) exitWith {diag_log "Valor Error :: _blueprint_itembox unknown"};
if(_group_name isEqualTo "") exitWith {diag_log "Valor Error :: _group_name unknown"};



_objects_to_build = [];
_ammobox_0 = [];

{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_vec = _x select 3;
	_level = _x select 4;
	if(0 in _level) then {
		if(_classname isEqualTo "B_CargoNet_01_ammo_F") then {
			_ammobox_0 = _x;
		} else {
			_objects_to_build pushBack _x;
		};
	};
} foreach _objects;



if(_ammobox_0 isEqualTo []) exitWith {diag_log "Valor :: _ammobox_0 unknown"};
if(_objects_to_build isEqualTo []) exitWith {diag_log "Valor :: _objects_to_build unknown"};




_query = format["SELECT base_id FROM bases WHERE owner='%1' && config_id = '%2'",getplayeruid _requester,_config_id];
_queryResult = [_query,2] call valor_fnc_db_sync;

if!((count _queryResult) isEqualTo 0) exitWith {
	["You already have a base of this kind, exiting."] remoteExec["valor_fnc_exp_hint",[_requester]];
};


_objects_with_pos = [];
_objects = _objects - [_ammobox_0];
_objects_to_build = _objects_to_build - [_ammobox_0];

_raptor_classname = selectrandom ["babe_raptorb_east_3_F","babe_raptorb_east_5_F","babe_raptorb_east_6_F","babe_raptorb_east_4_F","babe_raptorb_east_2_F","babe_raptor_east_6_F","babe_raptorb_east_F","babe_raptor_east_2_F","babe_raptor_east_3_F","babe_raptor_east_4_F","babe_raptor_east_5_F","babe_raptor_east_F"];
_query = format["INSERT INTO bases (owner, config_id, layout_id, classname, pos, dir, vector, inventory,entry_list,group_id,raptor_classname) VALUES('%1', '%2','%3','%4','%5','%6','%7','%8','%9','%10','%11')",getplayeruid _requester,_config_id,_layout_id,(str (_ammobox_0 select 0)),(_ammobox_0 select 1),(_ammobox_0 select 2),(_ammobox_0 select 3),[],[[getPlayerUID _requester,name _requester],[_group_id,_group_name]],_group_id,str _raptor_classname];
[_query,1] call valor_fnc_db_sync;


sleep 5;


_query = format["SELECT base_id FROM bases WHERE owner='%1' && config_id = '%2'",getplayeruid _requester,_config_id];
_queryResult = [_query,2] call valor_fnc_db_sync;


if((count _queryResult) isEqualTo 0) exitWith {
	["There was an error inserting the base into the database, exiting."] remoteExec["valor_fnc_exp_hint",[_requester]];
};


_base_id = _queryResult select 0;

_box setvariable["valor_base_ids",[_base_id,_config_id,_layout_id,[[getPlayerUID _requester,name _requester],[_group_id,_group_name]]],true];



{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_vec = _x select 3;
	_level = _x select 4;
	_query = format["INSERT INTO base_objects (base_id, classname, pos, dir, vector,inventory, layout_id) VALUES('%1', '%2','%3','%4','%5','[]', '%6')",_base_id,(str _classname),_pos,_dir,_vec,_level];
	[_query,1] call valor_fnc_db_sync;

} foreach _objects;



{
	_obj = nil;
	_h = _h + 10;
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_vec = _x select 3;
	_level = _x select 4;
	_obj = _classname createVehicle [0,0,_h];
	waitUntil {!isnil "_obj"};
	waitUntil {!isnull _obj};
	_obj allowDamage false;
	_doors = getNumber(configFile >> "CfgVehicles" >> _classname >> "numberOfDoors");
	if(_doors isEqualTo 0) then {
		_obj enableSimulation false;
	};
	_obj setdir _dir;
	_obj setVectorUp _vec;
	_obj setposatl _pos;
	_obj setvariable["valor_base_ids",[_base_id,_config_id,_layout_id],true];
	_objects_with_pos pushBack [_obj,_pos];
} foreach _objects_to_build;


_box = (_ammobox_0 select 0) createVehicle [0,0,_h];
waitUntil {!isnil "_box"};
waitUntil {!isnull _box};
_box allowDamage false;
[_box] call valor_fnc_clear_vehicle;
_box setdir (_ammobox_0 select 2);
_box setVectorUp (_ammobox_0 select 3);
_box setposatl (_ammobox_0 select 1);
_box setvariable["valor_base_ids",[_base_id,_config_id,_layout_id,_entry_list,_owner],true];
_inventory = [_box] call valor_fnc_getvehiclecargo;
_objects_with_pos pushBack [_box,(_ammobox_0 select 1)];



//[_objects_with_pos] remoteExec["valor_fnc_set_base_objects",-2];



[format["The Base got inserted into the database, now put the required items into the crate and build the base"]]remoteExec["valor_fnc_exp_hint",_requester];

