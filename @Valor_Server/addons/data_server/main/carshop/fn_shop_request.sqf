private ["_seller","_requester","_query","_classnames_and_prices","_id_classnames"];

_seller = param[0,[],[[]]];
_requester = param[1,objNull,[objNull]];
if(_seller isEqualTo [] || isnull _requester) exitWith {};
_query = format["Select classname, price from vehicle_prices where seller = '%1';",(_seller select 0)];

_classnames_and_prices = [_query,2,true] call valor_fnc_db_sync;

_query = format["Select id, classname from persistent_vehicles where shop = '1';"];

_id_classnames = [_query,2,true] call valor_fnc_db_sync;


[_classnames_and_prices,_id_classnames,_seller] remoteexec["valor_fnc_fillshop",_requester];
