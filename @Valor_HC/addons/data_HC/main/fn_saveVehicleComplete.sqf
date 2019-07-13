

private ["_vehicle","_DB_ID","_query"];
_vehicle = param[0,objNull,[objNull]];
if (isnull _vehicle || !alive _vehicle) exitWith {};
_DB_ID = _vehicle getvariable["DBID",-1];
if (_DB_ID isequalto -1) exitWith {diag_log "Valor :: Var DB ID of one Vehicle is nil"};
_res_var = _vehicle getvariable["group_restricted",[0,-1]];

_mode = 0;
_number = -1;

if!(_res_var isEqualTo [0,-1]) then {
	_mode = _res_var select 0;
	_number = _res_var select 1;
	if(typeName  _number isEqualTo "STRING") then {
		_number = call compile _number;
	};
};

_query = format["Update persistent_vehicles set pos = '%1', inventory = '%2', fuel = '%3', damage = '%4', mode = '%6', group_id = '%7'  where id = '%5'",([getposatl _vehicle,getdir _vehicle,vectorUp _vehicle]),([_vehicle] call valor_fnc_getVehicleCargo),fuel _vehicle,([_vehicle] call valor_fnc_getVehicleDamage),_DB_ID,_mode,_number];

[_query,1] call valor_fnc_db_sync;







