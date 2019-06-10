
private ["_Crate_send","_requester","_inventory","_classname","_pos","_dir","_vector","_query","_queryresult"];

_Crate_send = param[0,objNull,[objNull]];
_requester = param[1,objNull,[objnull]];

iF(isnull _Crate_send || isnull _requester) exitWith {};


[_Crate_send] call valor_fnc_clear_vehicle;
_inventory = [_Crate_send] call valor_fnc_getvehiclecargo;
_classname = typeof _Crate_send;
_pos = getposatl _Crate_send;
_dir = getdir _Crate_send;
_vector = vectorUp _Crate_send;

_query = format["INSERT INTO bases (gang_id, config_id, classname, pos, dir, vector, inventory,cop) VALUES('%1', '%2','%3','%4','%5','%6','%7','%8')",-1,-1,(str _classname),_pos,_dir,_vector,_inventory,1];
[_query,1] call valor_fnc_db_sync;

sleep 3;
_queryresult = [format["Select base_id from bases where pos like'%1%2%1'","%",_pos select 0],2] call valor_fnc_db_sync;

sleep 2;

_Crate_send setVariable["cop",(_queryresult select 0),true];



format["Crate: %1 @ Pos %2 got inserted into the Database with ID %3.",(typeof _Crate_send),_pos,(_queryresult select 0)] remoteExec ["systemchat", _requester];

