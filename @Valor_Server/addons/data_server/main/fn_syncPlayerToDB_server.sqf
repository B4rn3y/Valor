

private ["_side","_values","_query"];
_side = param[0,sideUnknown,[west]];
_uid = param[1,"",[""]];
_values = param[2,[],[[]]];

if(_uid isEqualTo "" || _side isEqualTo sideUnknown || _values isEqualTo []) exitWith {diag_log "Valor :: Error @ complete sync"};
_query = "";

switch (_side) do
{
	case opfor:
	{
		_query = format["Update players set gear_cop = '%1',cash = '%2', bankacc = '%3', stats_cop = '%4', alive_cop = '%5', position_cop = '%6', playtime = '%7', map = '%8',xp = '%10', level = '%11', humanity = '%12', stats_killed = '%13' where pid = '%9'",_values select 0,_values select 1,_values select 2,_values select 3,_values select 4,_values select 5,_values select 6,_values select 7,_uid,_values select 8,_values select 9,_values select 10, _values select 11];
	};

	case civilian:
	{
		_query = format["Update players set gear = '%1',cash = '%2', bankacc = '%3', stats = '%4', alive = '%5', position = '%6', playtime = '%7', map = '%8',xp = '%10', level = '%11', humanity = '%12', stats_killed = '%13' where pid = '%9'",_values select 0,_values select 1,_values select 2,_values select 3,_values select 4,_values select 5,_values select 6,_values select 7,_uid,_values select 8,_values select 9,_values select 10, _values select 11];
	};
};



if!(_query isEqualTo "") then {
	[_query,1] call valor_fnc_db_sync;
};