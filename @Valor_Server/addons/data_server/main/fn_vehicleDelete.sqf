

private ["_db_id","_chance_store","_rnd","_query","_thread"];
_db_id = param [0,-1,[1337]];




diag_log format["Valor :: Deleting Vehicle from DB %1",_db_id];
if(_db_id isEqualTo -1) exitWith {};

_chance_store = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "chance_vehicle_shop");
_rnd = random 100;

_query = format["UPDATE persistent_vehicles SET alive='0' WHERE id = '%1'",_db_id];

if(_rnd <= _chance_store) then {
	_query = format["UPDATE persistent_vehicles SET shop='1' WHERE id = '%1'",_db_id];
};



_thread = [_query,1] call valor_fnc_db_sync;

