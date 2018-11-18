
private ["_vehicle_send","_requester","_type","_vehicle","_classname","_pos","_damage","_parts","_part","_damage_give","_fuel","_inventory","_query","_queryresult"];
_vehicle_send = param[0,objNull,[objNull]];
_requester = param[1,objNull,[objnull]];
_shop = param[2,"survivor_camp",[""]];
_price = param[3,100,[100]];
_type = "error";
iF(isnull _vehicle_send || isnull _requester) exitWith {};


_type = switch (true) do
{
	case (_vehicle isKindOf "land"):
	{
		"land"
	};

	case (_vehicle isKindOf "helicopter"):
	{
		"helicopter"
	};

	case (_vehicle isKindOf "plane"):
	{
		"plane"
	};

	case (_vehicle isKindOf "ship"):
	{
		"ship"
	};

	default
	{
		"error"
	};
};
_classname = typeOf _vehicle_send;

_query = format["Insert into vehicle_prices (classname,price,type,seller) VALUES ('%1','%2','%3','%4')",(str _classname),_price,_type,_shop];
[_query,1] call valor_fnc_db_sync;


format["Vehicle: %1 with Price %2 from Type %3 inserted @ Seller %4",_classname,_price,_type,_shop] remoteExec ["systemchat", _requester];

