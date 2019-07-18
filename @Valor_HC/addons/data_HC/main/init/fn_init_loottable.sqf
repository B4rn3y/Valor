
private ["_query","_res","_table","_loot","_loot_new","_pubvar_name"];



_query = "Select DISTINCT table_type from loottable_classnames;"; // [["m_military"],["l_military"],["h_military"],["firestation"],["medical"],["farming"],["industrial"],["general"]]

_res = [_query,2,true] call valor_fnc_db_sync;

All_loot_tables = [];

{
	_table = _x select 0;
	_pubvar_name = format["lootspawn_config_%1",_table];
	_query = format["Select min_prob, max_prob,classname, type, spawn_with from loottable_classnames where table_type = '%1';",_table];
	call compile format["%1 = [_query,2,true] call valor_fnc_db_sync;",_pubvar_name];


	publicVariable _pubvar_name;

	All_loot_tables pushBackUnique _pubvar_name;



} foreach _res;

publicVariable "All_loot_tables";

// Loot got published, now publish the houses
_query = "Select classname, table_type from loottable_houses;";

_res_2 = [_query,2,true] call valor_fnc_db_sync;

_houses = [];
{
	_classname = _x select 0;
	_table = _x select 1;
	_found = -1;

	{
		if((_x select 0) isEqualTo _table) exitWith {_found = _foreachindex;};
	} foreach _houses;

	if!(_found isEqualTo -1) then {
		_entry = _houses select _found;
		_loottable_name = _entry select 0;
		_array_with_houses = _entry select 1;
		_array_with_houses pushback _classname;
		_houses set[_found,[_loottable_name,_array_with_houses]];
	} else {
		_houses pushback [_table,[_classname]];
	};
} foreach _res_2;

lootspawn_house_config = _houses;
publicVariable "lootspawn_house_config";



