
_vehicle_ID = param[0,-1,[1337]];
_shop = param[1,-1,[1337]];
if(_vehicle_ID isEqualTo -1 || _shop isEqualTo -1) exitWith {false};

_query = format["Update persistent_vehicles set shop = '%2' where id = '%1';",_vehicle_ID,_shop];

[_query,1] call valor_fnc_db_sync;

true
