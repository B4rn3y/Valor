
private ["_requester","_items","_query","_queryResult"];
_requester = param[0,objNull,[objNull]];
_items = param[1,"",[""]];
_vehicle = param[2,false,[false]];

if(isnull _requester || _items isEqualTo "") exitWith {};

_query = format["Select classname, price, type from item_sell_prices where classname in %1",_items];

_queryResult = [_query,2,true] call valor_fnc_db_sync;

if!(_vehicle) then {
	[_queryResult] remoteexec["valor_fnc_fill_sell_player_items_menu",[_requester]];
} else {
	[_queryResult] remoteexec["valor_fnc_fill_sell_vehicle_items_menu",[_requester]];
};


