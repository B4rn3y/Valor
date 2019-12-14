

private ["_vehicle","_is_animal","_DB_ID","_locked","_query"];
_vehicle = param[0,objNull,[objNull]];
_is_animal = param[1,false,[false]];

if (isnull _vehicle || !alive _vehicle) exitWith {};
_DB_ID = _vehicle getvariable["DBID",-1];
if (_DB_ID isequalto -1) exitWith {diag_log "Valor :: Var DB ID of one Vehicle is nil"};






if!(_is_animal) then {

	_locked = if((locked _vehicle)isEqualTo 2) then {1} else {0};

	if(_locked isEqualTo 1) then {
		_query = format["Update persistent_vehicles set time_locked = CURRENT_TIMESTAMP  where id = '%1' and locked = '0'",_DB_ID];
		[_query,1] call valor_fnc_db_sync;
	};


	_query = format["Update persistent_vehicles set pos = '%1', inventory = '%2', fuel = '%3', damage = '%4', locked = '%6', owners = '%7', updated =  updated + 1  where id = '%5'",([getposatl _vehicle,getdir _vehicle,vectorUp _vehicle]),([_vehicle] call valor_fnc_getVehicleCargo),fuel _vehicle,([_vehicle] call valor_fnc_getVehicleDamage),_DB_ID,_locked,(_vehicle getvariable["owners",[]])];

	[_query,1] call valor_fnc_db_sync;

} else {
	_query = format["Update animals set pos = '%1'  where id = '%2'",str(str([getposatl _vehicle,getdir _vehicle])),_DB_ID];

	[_query,1] call valor_fnc_db_sync;
};





