private ["_seller","_requester","_query","_classnames_and_prices","_id_classnames"];

_classnames = param[0,[],[[],""]];
_requester = param[1,objNull,[objNull]];
if(_classnames isEqualTo [] || isnull _requester) exitWith {};
_query = format["Select classname, price from item_sell_prices where classname in %1;",_classnames];

_items = [_query,2,true] call valor_fnc_db_sync;



[_items] remoteexec["valor_fnc_fillItemShop_sell",_requester];
