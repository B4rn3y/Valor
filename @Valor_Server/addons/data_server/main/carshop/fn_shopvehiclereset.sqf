
_vehicle_ID = param[0,-1,[1337]];
_vehicle = param[1,-1,[1337]];
if(_vehicle_ID isEqualTo -1 || isnull _vehicle) exitWith {};

deleteVehicle _vehicle;
[_vehicle_ID,1] call valor_fnc_setvehicleinshop;
