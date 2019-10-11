private ["_the_player","_object_taken_from","_This","_item_taken","_exit","_var","_mode","_number"];

_the_player = _this select 0;
_object_taken_from = _This select 1;
_item_taken = _this select 2;



if(playerSide in [opfor,independent,blufor]) exitWith {};
_exit = false;


if(_object_taken_from iskindof "Landvehicle" || _object_taken_from iskindof "AIR" || _object_taken_from iskindof "SHIP") then {

	_var = _object_taken_from getvariable "group_restricted";
	if(isnil "_var") exitWith {};

	_mode = _var select 0;
	_number = _var select 1;
	_var = nil;
	switch (_mode) do
	{
		case 1:
		{
			if(isnil "valor_group") exitWith {_exit = true;};
			if(valor_group isEqualTo []) exitWith {_exit = true;};

			if!(_number isEqualTo (valor_group select 0)) exitWith {_exit = true;};
		};

		default
		{
			if!(_number isEqualTo (getplayeruid player)) exitWith {_exit = true;};
		};
	};

};


if(_exit) exitWith {
	0 spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		for "_i" from 1 to 6 do {
	        closeDialog 0;
	        sleep 0.2;
	    };
	    waitUntil {(!isNull (findDisplay 602))};
	    closeDialog 0;
	    closeDialog 0;
	};
};