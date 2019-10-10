
private ["_exit","_array","_new_array","_table_name_var","_table_name","_copy","_tables_add","_stuff_to_add","_tables","_table","_max","_tables_rdy","_tableName_var","_tableName","_multiplikator","_counter","_min","_difference","_foreachindex"];


diag_log "Valor Client  :: Checking Config for Lootspawn";






if(isnil "lootspawn_house_config") exitWith {diag_log "Valor Client :: Lootspawn House Config nil"};
if(isnil "All_loot_tables") exitWith {diag_log "Valor Client :: All_loot_tables nil"};
_exit = false;

{
	if(isnil _x) exitWith {diag_log format["Valor Client :: %1 nil",_x];_exit = true;};
} foreach All_loot_tables;

if(_exit)exitWith {};




_array = [];
{
	call compile format["_array = %1;",_x];
	_new_array = [];
	{
		_new_array pushback [(call compile(_x select 0)),(call compile(_x select 1)),_x select 2,_x select 3,(call compile(_x select 4))];
	} foreach _array;

	call compile format["%1=_new_array;",_x];
} foreach All_loot_tables;



diag_log "Valor Client :: Start editing Lootspawn Config";
{
	_table_name_var = _x;
	_table_name = _table_name_var select [17,(count(_table_name_var))];
	_copy = [];
	call compile format["_copy = %1;",_table_name_var];

	_tables_add = switch (_table_name) do
	{
		case "h_military":
		{
			["m_military","l_military"]
		};

		case "m_military":
		{
			["l_military"]
		};

		case "radiation_zone":
		{
			["h_military","m_military"]
		};

		case "loot_drop":
		{
			["h_military","m_military"]
		};

		case "food":
		{
			["general"]
		};

		case "firestation":
		{
			["m_military","l_military"]
		};

		default
		{
			[]
		};
	};

	if!(_tables_add isEqualTo []) then {
		{
			_stuff_to_add = [];
			call compile format["_stuff_to_add = lootspawn_config_%1;",_x];
			_copy append _stuff_to_add;
		} foreach _tables_add;

		call compile format["%1 = _copy;",_table_name_var];
	};

} foreach All_loot_tables;





_tables = [];
{
	_table = _x;

	_max = 0;
	{
		_max = _max + ((_x select 1) - (_x select 0));
	} foreach (call compile _table);
	_tables pushBack [_table,(_table select [17,(count(_table))]),(100/_max)];
} foreach All_loot_tables;


_tables_rdy = [];
{

	_tableName_var = _x select 0;
	_tableName = _x select 1;
	_multiplikator = _x select 2;
	_copy = [];
	call compile format["_copy = %1;",_tableName_var];
	_counter = 0;
	{
		_min = (_x select 0) * _multiplikator;
		_max = (_x select 1) * _multiplikator;
		_difference = _max - _min;
		_min = _counter;
		_max = _min + _difference;
		_counter = _max;
		_copy set [_foreachindex,[_min,_max,_x select 2,_x select 3,_x select 4]];
	} foreach (call compile _tableName_var);

	call compile format["%1 = _copy;",_tableName_var];

} foreach _tables;




diag_log "Valor Client :: Lootspawn Config Edit complete";