private ["_seller","_requester","_query","_classnames_and_prices","_id_classnames"];

_seller = param[0,"",[[],""]];
_requester = param[1,objNull,[objNull]];
if(_seller isEqualTo [] || isnull _requester) exitWith {};
_query = format["Select id, classname, price, stock, type, infinite from item_shop where seller like '%2%1%2';",_seller,"%"];

_items = [_query,2,true] call valor_fnc_db_sync;



[_items] remoteexec["valor_fnc_fillItemShop",_requester];
