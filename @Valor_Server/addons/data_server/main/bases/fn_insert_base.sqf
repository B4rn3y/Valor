

private ["_blueprint","_gang_id","_requester","_config_id","_blueprint_itembox","_ammobox_ring","_classname","_pos","_dir","_vector","_ammobox","_inventory","_pos_dependent","_dir_dependent","_vector_dependent","_object","_spawnpos","_query","_queryResult","_base_id"];

_blueprint = param[0,[],[[]]];
_gang_id = param[1,-1,[0]];
_requester = param[2,objNull,[objNull]];
_config_id = param[3,-1,[0]];
_blueprint_itembox = param[4,[],[[]]];

diag_log "Valor Server :: Request received";


if(_blueprint isEqualTo []) exitWith {diag_log "Valor Error :: _blueprint unknown"};
if(_gang_id isEqualTo -1) exitWith {diag_log "Valor Error :: _gang_id unknown"};
if(_requester isEqualTo objNull) exitWith {diag_log "Valor Error :: _requester unknown"};
if(_config_id isEqualTo -1) exitWith {diag_log "Valor Error :: _config_id unknown"};
if(_blueprint_itembox isEqualTo []) exitWith {diag_log "Valor Error :: _blueprint_itembox unknown"};

_ammobox_ring = [["Land_CncBarrierMedium_F",[0.00683594,2.19067,-0.776215],356.759,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[2.09888,0.313477,-0.806427],87.4195,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[2.57593,1.82031,-0.707397],307.202,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[1.61206,-1.15283,-0.903564],127.636,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[-1.78735,0.284424,-0.94278],266.912,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[0.212891,-1.91284,-0.993652],176.44,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[-1.1333,-1.38208,-1.01129],230,[-0.0346008,-0.0546216,0.997908]],["Land_CncBarrierMedium_F",[-2.55298,1.51025,-0.902222],33.5687,[-0.0346008,-0.0546216,0.997908]]];

_classname = _blueprint_itembox select 0;
_pos = _blueprint_itembox select 1;
_dir = _blueprint_itembox select 2;
_vector =  _blueprint_itembox select 3;

diag_log "Valor Server :: Create Ammobox";

_ammobox = _classname createVehicle [0,0,10];
waitUntil {!isnil "_ammobox"};
waitUntil {!isnull _ammobox};
_ammobox allowDamage false;
[_ammobox] call valor_fnc_clear_vehicle;
_ammobox setdir _dir;
_ammobox setposatl _pos;
_ammobox setVectorUp _vector;
_ammobox setdir _dir;
_ammobox setVectorUp _vector;
_inventory = [_ammobox] call valor_fnc_getvehiclecargo;

_query = format["INSERT INTO bases (group_id, config_id, classname, pos, dir, vector, inventory) VALUES('%1', '%2','%3','%4','%5','%6','%7')",_gang_id,_config_id,(str _classname),_pos,_dir,_vector,_inventory];
[_query,1] call valor_fnc_db_sync;




{

	_classname = _x select 0;
	_pos_dependent = _x select 1;
	_dir_dependent = _x select 2;
	_vector_dependent = _x select 3;

	_object = _classname createvehicle[0,0,10];


	_spawnpos = _ammobox modelToWorld _pos_dependent;
	_object setdir (_dir_dependent + getdir _ammobox);
	_object setposatl _spawnpos;
	_object setvectorup (_ammobox vectorModelToWorld _vector_dependent);
	_object allowDamage false;

} foreach _ammobox_ring;




 sleep 5;
_query = format["SELECT base_id FROM bases WHERE group_id='%1' && pos like %2%3%2",_gang_id,"%",_pos];
_queryResult = [_query,2] call valor_fnc_db_sync;

if(typeName _queryResult isEqualTo "ARRAY") then {
	_queryResult = _queryResult select 0;
};

_base_id = _queryResult;

_ammobox setvariable["valor_base_ids",[_base_id,_gang_id,_config_id],true];


{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_vector = _x select 3;
	_query = format["INSERT INTO base_objects (base_id, classname, pos, dir, vector) VALUES('%1', '%2','%3','%4','%5')",_base_id,(str _classname),_pos,_dir,_vector];
	[_query,1] call valor_fnc_db_sync;

} foreach _blueprint;

(format["The Base got inserted into the database, now put the required items into the crate and build the base"]) remoteExec["systemchat",_requester];

