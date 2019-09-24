
private ["_base_id","_entry_list","_query"];

_base_id = param[0,-1,[0]];
_entry_list = param[1,[],[[]]];

if(_entry_list isEqualTo []) exitWith {};
if(_base_id isEqualTo -1) exitWith {};


_query = format["Update bases set entry_list = '%2' where base_id = '%1'",_base_id,_entry_list];
[_query,1] call valor_fnc_db_sync;



















