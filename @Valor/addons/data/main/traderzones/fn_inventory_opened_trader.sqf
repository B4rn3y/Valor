private ["_container","_container2","_exit","_var"];
_container = _this select 1;
_container2 = _this select 2;

_exit = false;
if(_container iskindof "Landvehicle" || _container iskindof "AIR" || _container iskindof "SHIP") then {
	_var = (_container) getvariable "allowed_players";
	if(isnil "_var") exitWith {};
	if!((getplayeruid player) in _var) exitWith {_exit = true;};
};


if!(_exit) then {
	if(_container2 iskindof "Landvehicle" || _container2 iskindof "AIR" || _container2 iskindof "SHIP") then {
	_var = (_container2) getvariable "allowed_players";
	if(isnil "_var") exitWith {};
	if!((getplayeruid player) in _var) exitWith {_exit = true;};


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

