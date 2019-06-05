
private ["_blueprint","_gang_id","_requester","_config_id","_blueprint_itembox","_classname","_pos","_dir","_vector","_ammobox","_inventory","_query","_queryResult","_base_id","_object"];

_blueprint = param[0,[],[[]]];
_gang_id = param[1,-1,[0]];
_requester = param[2,objNull,[objNull]];
_config_id = param[3,-1,[0]]
_blueprint_itembox = param[0,[],[[]]];

if(_blueprint isEqualTo []) exitWith {systemchat "Valor Error :: _blueprint unknown"};
if(_gang_id isEqualTo -1) exitWith {systemchat "Valor Error :: _gang_id unknown"};
if(_requester isEqualTo objNull) exitWith {systemchat "Valor Error :: _requester unknown"};
if(_config_id isEqualTo -1) exitWith {systemchat "Valor Error :: _config_id unknown"};
if(_blueprint_itembox isEqualTo []) exitWith {systemchat "Valor Error :: _blueprint_itembox unknown"};



_classname = _blueprint_itembox select 0;
_pos = _blueprint_itembox select 1;
_dir = _blueprint_itembox select 2;
_vector =  _blueprint_itembox select 3;

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


_query = format["INSERT INTO bases (gang_id, config_id, classname, pos, dir, vector, inventory) VALUES('%1', '%2','%3','%4','%5','%6','%7')",_gang_id,_config_id,_classname,_pos,_dir,_vector,_inventory];
[_query,1] call valor_fnc_db_sync;
 sleep 5;
_query = format["SELECT base_id FROM bases WHERE gang_id='%1'",_gang_id];
_queryResult = [_query,2] call valor_fnc_db_sync;

if(typeName _queryResult isEqualTo "ARRAY") then {
	_queryResult = _queryResult select 0;
};

_base_id = _queryResult;

_ammobox setvariable["valor_base_ids"[_base_id,_gang_id,_config_id],true];


{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_vector = _x select 3;
	_query = format["INSERT INTO base_objects (base_id, classname, pos, dir, vector) VALUES('%1', '%2','%3','%4','%5')",_base_id,_classname,_pos,_dir,_vector];
	[_query,1] call valor_fnc_db_sync;

} foreach _blueprint;

(format["The Base got inserted into the database, now put the required items into the crate and build the base"]) remoteExec["systemchat",_requester];

























