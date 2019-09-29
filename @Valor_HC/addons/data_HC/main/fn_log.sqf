
private ["_log","_query"];

_log = param[0,"",[""]];
if(_log isEqualTo "") exitWith {};



_query = format["INSERT INTO log (log) VALUES('%1')",_log];
[_query,1] call valor_fnc_db_sync;