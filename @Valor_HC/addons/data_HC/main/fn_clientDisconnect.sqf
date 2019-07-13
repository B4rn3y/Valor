
private["_unit","_id","_uid","_name"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
if(isNull _unit) exitWith {};
_pid = _unit getvariable["PID",""];
if!(_pid isEqualTo "") then {
	[format["Update players set online = '0' where pid = '%1'",_pid],1] call valor_fnc_db_sync;
};
_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;
deleteVehicle _unit;

