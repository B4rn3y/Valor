
private ["_requester","_query","_res"];

_requester = param[0,objNull,[objNull]];
if(isnull _requester) exitWith {};


_query = "Select name, grp_name, pid, bankacc, playtime from applications;";

_res = [_query,2,true] call valor_fnc_db_sync;

_query1 = "Select coplevel, name, pid from players where coplevel > 0;";

_res1 = [_query1,2,true] call valor_fnc_db_sync;


[_res,_res1] remoteExec["valor_fnc_fillapplicationsmenu",_requester];