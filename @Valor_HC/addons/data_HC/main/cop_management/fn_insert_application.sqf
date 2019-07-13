
private ["_pid","_playtime","_bank","_grp_name","_query"];

_name = param[0,"No Name",[""]];
_pid = param[1,"",[""]];
_playtime = param[2,-1,[0]];
_bank = param[3,-1,[0]];
_grp_name = param[4,"No Group",[""]];

if(_pid isEqualTo "" || _playtime isEqualTo -1 || _bank isEqualTo -1)  exitWith {};


_query = format["Insert into applications (name,pid,bankacc,playtime,grp_name) VALUES ('%1','%2','%3','%4','%5')",_name,_pid,_bank,_playtime,_grp_name];
[_query,1] call valor_fnc_db_sync;