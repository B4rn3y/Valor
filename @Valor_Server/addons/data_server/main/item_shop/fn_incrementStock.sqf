private ["_seller","_requester","_query","_classnames_and_prices","_id_classnames"];

_classnames_str = param[0,"",[[],""]];
_seller = param[1,"",[""]];
if(_classnames_str isEqualTo "" || _seller isEqualTo "") exitWith {};
_query = format["Update item_shop set stock = stock + 1 where classname in %1 and seller like '%2%3%2'",_classnames_str,"%",_seller];

[_query,1] call valor_fnc_db_sync;

