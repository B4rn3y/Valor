
private ["_vehicle_send","_requester","_shop","_price","_type","_classname","_query","_queryresult","_entry","_current_sellers"];
_vehicle_send = param[0,objNull,[objNull]];
_requester = param[1,objNull,[objnull]];
_shop = param[2,"survivor_camp",["",[]]];
_price = param[3,100,[100]];
_type = "error";
iF(isnull _vehicle_send || isnull _requester) exitWith {};


_type = switch (true) do
{
	case (_vehicle_send isKindOf "land"):
	{
		"land"
	};

	case (_vehicle_send isKindOf "helicopter"):
	{
		"helicopter"
	};

	case (_vehicle_send isKindOf "plane"):
	{
		"plane"
	};

	case (_vehicle_send isKindOf "ship"):
	{
		"ship"
	};

	default
	{
		"error"
	};
};
_classname = typeOf _vehicle_send;
_query = format["Select seller from vehicle_prices where classname = '%1'",str _classname];
_queryresult = [_query,2] call valor_fnc_db_sync;
_entry = "survivor_camp";

if (_queryresult isEqualTo []) then {
	if(typeName _shop isEqualTo "ARRAY") then {
		_entry = _shop;
	} else {
		_entry = [_shop];
	};
} else {
	_current_sellers = _queryresult select 0;
	_current_sellers = call compile _current_sellers;
	if(typeName _shop isEqualTo "ARRAY") then {
		_current_sellers append _shop;
		_entry = _current_sellers;
	} else {
		_current_sellers pushBackUnique _shop;
		_entry = _current_sellers;
	};
};


if(_queryresult isEqualTo []) then {
	_query = format["Insert into vehicle_prices (classname,price,type,seller) VALUES ('%1','%2','%3','%4')",(str _classname),_price,_type,_entry];
} else {
	_query = format["Update vehicle_prices set price = '%2, seller = '%3' where classname = '%1'",(str _classname),_price,_entry];
};
[_query,1] call valor_fnc_db_sync;

format["Vehicle: %1 with Price %2 from Type %3 inserted @ Seller %4",_classname,_price,_type,_entry] remoteExec ["systemchat", _requester];

