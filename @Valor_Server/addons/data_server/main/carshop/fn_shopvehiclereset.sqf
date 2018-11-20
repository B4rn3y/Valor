
_vehicle_ID = param[0,-1,[1337]];
_vehicle = param[1,-1,[1337]];
_classname = param[2,"",[""]];
if(_vehicle_ID isEqualTo -1 || isnull _vehicle  || _classname isEqualTo "") exitWith {};

_query = format["Update persistent_vehicles set bought = bought - 1 where id= '%1'; Update vehicle_prices set bought = bought - 1 where classname = '%2'",_vehicle_ID,str _classname];
[_query,1] call valor_fnc_db_sync;

deleteVehicle _vehicle;
[_vehicle_ID,1] call valor_fnc_setvehicleinshop;
