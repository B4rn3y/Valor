

private ["_db_id","_cop","_chance_store","_rnd","_query","_thread"];
_db_id = param [0,-1,[1337]];
_cop = param[1,false,[false]];
_is_animal = param[2,false,[false]];



diag_log format["Valor :: Deleting Vehicle from DB %1",_db_id];
if(_db_id isEqualTo -1) exitWith {};

if!(_is_animal) then {

	_chance_store = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "chance_vehicle_shop");
	_rnd = random 100;

	_query = format["UPDATE persistent_vehicles SET alive='0' WHERE id = '%1'",_db_id];

	if(_rnd <= _chance_store && !_cop) then {
		_query = format["UPDATE persistent_vehicles SET shop='1' WHERE id = '%1'",_db_id];
	};



	_thread = [_query,1] call valor_fnc_db_sync;

} else {
	_query = format["UPDATE animals set alive = '0' where id = '%1'",_db_id];
	_thread = [_query,1] call valor_fnc_db_sync;
};

