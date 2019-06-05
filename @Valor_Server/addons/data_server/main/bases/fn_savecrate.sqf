
diag_log "Valor Server :: Saving Crate";

_crate = param[0,objNull,[objNull]];
_build = param[1,false,[false]];
if (isnull _crate ) exitWith {};

_var = _crate getvariable "valor_base_ids";
if(isnil "_var") exitWith {};

_base_id = _var select 0;

if (_base_id isequalto -1) exitWith {diag_log "Valor :: Var _base_id  of one Vehicle is nil"};


if(_build) then {
	_object_id = _var select 3;
	_query = format["Update base_objects set inventory = '%1' where id = '%2'",([_crate] call valor_fnc_getVehicleCargo),_object_id];
	[_query,1] call valor_fnc_db_sync;

} else {

	_query = format["Update bases set inventory = '%1' where base_id = '%2'",([_crate] call valor_fnc_getVehicleCargo),_base_id];
	[_query,1] call valor_fnc_db_sync;
};









