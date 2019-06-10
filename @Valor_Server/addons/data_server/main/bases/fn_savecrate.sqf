
diag_log "Valor Server :: Saving Crate";

private ["_crate","_build","_var","_base_id","_query","_object_id"];
_crate = param[0,objNull,[objNull]];
_build = param[1,-1,[0]];
if (isnull _crate ) exitWith {};
if(_build isEqualTo -1) exitWith {};




switch (_build) do
{
	case 0:
	{
		_var = _crate getvariable "valor_base_ids";
		if(isnil "_var") exitWith {};
		_base_id = _var select 0;
		if(_base_id isequalto -1) exitWith {diag_log "Valor :: Var _base_id  of one Vehicle is nil"};
		_query = format["Update bases set inventory = '%1' where base_id = '%2'",([_crate] call valor_fnc_getVehicleCargo),_base_id];
		[_query,1] call valor_fnc_db_sync;
	};

	case 1:
	{
		_var = _crate getvariable "valor_base_ids";
		if(isnil "_var") exitWith {};
		_base_id = _var select 0;
		if(_base_id isequalto -1) exitWith {diag_log "Valor :: Var _base_id  of one Vehicle is nil"};
		_object_id = _var select 3;
		_query = format["Update base_objects set inventory = '%1' where id = '%2'",([_crate] call valor_fnc_getVehicleCargo),_object_id];
		[_query,1] call valor_fnc_db_sync;
	};

	case 2:
	{
		_var = _crate getvariable "cop";
		if(isnil "_var") exitWith {};
		_base_id = _var;
		if(_base_id isequalto -1) exitWith {diag_log "Valor :: Var _base_id  of one Vehicle is nil"};
		_query = format["Update bases set inventory = '%1' where base_id = '%2'",([_crate] call valor_fnc_getVehicleCargo),_base_id];
		[_query,1] call valor_fnc_db_sync;
	};
};








