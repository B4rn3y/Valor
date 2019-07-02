
private ["_coplevel","_pid","_accpeted","_delete_application","_only_application","_query"];
_coplevel = param[0,-1,[0]];
_pid = param[1,"",[""]];
_accpeted = param[2,0,[0]]; // 0 - nothing 1-declined 2 - accepted
_delete_application = param[3,false,[false]];
_only_application = param[4,false,[false]];

if(_coplevel isEqualTo -1 || _pid isEqualTo "") exitWith {};

if(_only_application) exitWith {
	_query = format["Update players set application = '0' where pid = '%1';",_pid];
	[_query,1] call valor_fnc_db_sync;
};

switch (_accpeted) do
{
	case 1: // declined
	{
		_query = format["Update players set coplevel = '0', application = '%1' where pid = '%2';",_accpeted,_pid];
		[_query,1] call valor_fnc_db_sync;
	};

	case 2: // accepted
	{
		_query = format["Update players set coplevel = '1', application = '%1' where pid = '%2';",_accpeted,_pid];
		[_query,1] call valor_fnc_db_sync;
	};

	default
	{
		_query = format["Update players set coplevel = '%1' where pid = '%2';",_coplevel,_pid];
		[_query,1] call valor_fnc_db_sync;
	};
};


if(_delete_application) then {
	_query = format["Delete from applications where pid = '%1';",_pid];
	[_query,1] call valor_fnc_db_sync;
};



