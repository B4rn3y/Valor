

private ["_query","_queryResult","_classname","_price","_type","_seller","_res"];

_query = format["Select classname, price, type, seller from items_sold"];

_queryResult = [_query,2,true] call valor_fnc_db_sync;

_old_classname = "";
{
	_classname = _x select 0;
	_price = _x select 1;
	_type = _x select 2;
	_seller = _x select 3;

	_query = format["Select stock from item_shop where classname = '%1' && seller like '%2%3%2'",_classname,"%",_seller];
	_res = [_query,2] call valor_fnc_db_sync;

	if(count _res > 0 || (_classname isEqualTo _old_classname)) then {
		_query = format["Update item_shop set stock = stock + 1 where classname = '%1' && seller like '%2%3%2'",_classname,"%",_seller];
		[_query,1] call valor_fnc_db_sync;
	} else {
		_query = format["INSERT INTO item_shop (classname, price, stock,type, seller) VALUES('%1', '%2', '%3', '%4', '%5')",_classname,_price,1,_type,[_seller]];
		[_query,1] call valor_fnc_db_sync;
	};
	_old_classname = _classname;
} foreach _queryResult;

_query = format["Delete from items_sold"];
[_query,1] call valor_fnc_db_sync;


_query = format["Delete from item_shop where stock <= 0 && infinite = '0';"];
[_query,1] call valor_fnc_db_sync;



