private ["_type","_attach_pos","_query"];

_type = param[0,-1,[0]];
_id = param[1,-1,[0]];
_attach_pos = param[2,[],[[]]];

if(_type isEqualTo -1) exitWith {};


if(_type isEqualTo 0) then {
	if(_id isEqualTo -1 || _attach_pos isEqualTo []) exitWith {};
	_query = format["Update persistent_vehicles set attach_pos = '%1' where id = '%2';",_attach_pos,_id];
	[_query,1] call valor_fnc_db_sync;
} else {
	if(_id isEqualTo -1) exitWith {};
	_query = format["Update persistent_vehicles set attach_pos = '[]' where id = '%1';",_id];
	[_query,1] call valor_fnc_db_sync;
};




