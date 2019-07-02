
private ["_requester","_query","_res"];

_requester = param[0,objNull,[objNull]];
if(isnull _requester) exitWith {};


_query = "Select name, grp_name, pid, bankacc, playtime from applications;";

_res = [_query,2,true] call valor_fnc_db_sync;

[_res] remoteExec["valor_fnc_fillapplicationsmenu",_requester];