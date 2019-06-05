

private ["_crate","_var","_base_id","_query"];
_crate = param[0,objNull,[objNull]];
if (isnull _crate ) exitWith {};

_var = _crate getvariable "valor_base_ids";
if(isnil "_var") exitWith {};

_base_id = _var select 0;

if (_base_id isequalto -1) exitWith {diag_log "Valor :: Var _base_id of a crate is nil"};


_query = format["Update bases set inventory = '%1' where base_id = '%5'",([_crate] call valor_fnc_getVehicleCargo),_base_id];

[_query,1] call valor_fnc_db_sync;







