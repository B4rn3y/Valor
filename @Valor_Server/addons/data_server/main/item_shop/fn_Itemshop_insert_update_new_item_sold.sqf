
private ["_items_sold","_classname","_price","_type","_query"];

_items_sold = param[0,[],[[]]];
_shop_type = param[1,"",[""]];

if(_items_sold isEqualTo [] || _shop_type isEqualTo "") exitWith {};


{
	_classname = _x select 0;
	_price = _x select 1;
	_type = _x select 2;
	_query = format["INSERT INTO items_sold (classname, price,type, seller) VALUES('%1', '%2', '%3', '%4')",_classname,_price,_type,_shop_type];
	[_query,1] call valor_fnc_db_sync;
	sleep 1;
} foreach _items_sold;