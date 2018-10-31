

private ["_side","_values","_query"];
_side = param[0,sideUnknown,[west]];
_uid = param[1,"",[""]];
_values = param[2,[],[[]]];

if(_uid isEqualTo "" || _side isEqualTo sideUnknown || _values isEqualTo []) exitWith {diag_log "Valor :: Error @ complete sync"};
_query = "";


_query = format["Update players set gear = '%1',cash = '%2', bankacc = '%3', stats = '%4', alive = '%5', position = '%6', playtime = '%7', map = '%8' where pid = '%9'",_values select 0,_values select 1,_values select 2,_values select 3,_values select 4,_values select 5,_values select 6,_values select 7,_uid];


if!(_query isEqualTo "") then {
	[_query,1] call valor_fnc_db_sync;
};