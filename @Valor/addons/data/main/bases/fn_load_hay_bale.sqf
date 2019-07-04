

private ["_assigned","_vehicles","_vehicles_can_load","_classnames_can_load","_vehicle","_attachPOS","_classname","_max_bales","_count","_pos","_bale"];

_assigned = _this select 0;

_vehicles = nearestObjects[player,["Landvehicle","AIR","SHIP"],7];

if(_vehicles isEqualTo []) exitWith {systemChat "Valor :: There is no suitable vehicle close"};

_vehicles_can_load = getarray(missionConfigFile >> "Valor_settings" >> "farming" >> "Vehicles_hay_bale_attach");


_classnames_can_load = [];

{
	_classnames_can_load pushBack (_x select 0);
} foreach _vehicles_can_load;

_vehicle = objNull;
{
	if((typeof _x) in _classnames_can_load) exitWith {_vehicle = _x;};
} foreach _vehicles;

if(isnull _vehicle) exitWith {systemChat "Valor :: There is no suitable vehicle close"};


_attachPOS = [];
{
	_classname = _x select 0;
	if((typeOf _vehicle) isEqualTo _classname) exitWith {_attachPOS = _x select 1;};
} foreach _vehicles_can_load;



if(_attachPOS isEqualTo []) exitWith {systemChat "Valor :: There is no suitable vehicle close"};

_max_bales = count _attachPOS;

_count = 0;
{
	if((typeof _x) isEqualTo "Land_seno_balik") then {
		_count = _count + 1;
	};
} foreach (attachedObjects _vehicle);

if(_count >= _max_bales) exitWith {systemChat "Valor :: This vehicle is full"};

_pos = _attachPOS select _count;


titleText["Loading...","PLAIN DOWN"];

sleep random 5;

if(isObjectHidden _assigned) exitWith {systemChat "Valor :: The object has disappeared O.o"};

//_assigned hideObjectGlobal true;
[_assigned,true] remoteExec["hideObjectGlobal",2];

_bale = "Land_seno_balik" createVehicle [10,0,0];
_bale attachto[_vehicle,_pos];

titleText["Loaded","PLAIN DOWN"];




