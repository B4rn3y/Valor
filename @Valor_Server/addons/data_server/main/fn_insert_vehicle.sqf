


private ["_vehicle_send","_requester","_vehicle","_classname","_pos","_damage","_parts","_part","_damage_give","_fuel","_inventory","_query","_queryresult"];
_vehicle_send = param[0,objNull,[objNull]];
_requester = param[1,objNull,[objnull]];

iF(isnull _vehicle_send || isnull _requester) exitWith {};
_vehicle = objNull;
_classname = typeof _vehicle_send;
_pos = [getposatl _vehicle_send,getdir _vehicle_send,vectorUp _vehicle_send];
deleteVehicle _vehicle_send;
sleep 1;
_vehicle = _classname createVehicle [0,0,10];
waitUntil {!isnull _vehicle};
_vehicle setdir (_pos select 1);
_vehicle setposatl (_pos select 0);
_vehicle setVectorUp (_pos select 2);


_damage = getAllHitPointsDamage _vehicle select 2;
_parts = getAllHitPointsDamage _vehicle;
_vehicle allowDamage true;

if(_vehicle iskindof "Land") then {
	for "_i" from 0 to ((count _damage) - 1) do {
		_part = ((_parts select 0) select _i);
		_damage_give = 0.9;
		if(([_part, "wheel"] call BIS_fnc_filterString) isequalto "wheel") then {_damage_give = 1;};
		if(_part isEqualTo "hithull") then {_damage_give = 0.85;};
	    _vehicle setHitPointDamage [format ["%1",_part],_damage_give];
	};


} else {
	for "_i" from 0 to ((count _damage) - 1) do {
    	_vehicle setHitPointDamage [format ["%1",((_parts select 0) select _i)],0.9];
	};
};

_damage = getAllHitPointsDamage _vehicle select 2;
_damage = [_damage] call valor_fnc_mresarray;
_fuel = 0;
[_vehicle] call valor_fnc_clear_vehicle;
_inventory = [_vehicle] call valor_fnc_getvehiclecargo;
_vehicle setfuel _fuel;
_query = format["Insert into persistent_vehicles (pos,classname,spawnpos,inventory,fuel,damage,Spawndamage) VALUES ('%1','%2','%3','%4','%5','%6','%7')",_pos,(str _classname),_pos,_inventory,_fuel,_damage,_damage];
[_query,1] call valor_fnc_db_sync;
sleep 3;
_queryresult = [format["Select id from persistent_vehicles where pos like'%1%2%1'","%",_pos select 0],2] call valor_fnc_db_sync;

sleep 2;


//_vehicle addEventHandler["Killed","_this spawn valor_fnc_vehicleDelete"];
// [typeof _vehicle,(_pos select 0),(_pos select 1),0,_damage,[],0,(_queryresult select 0),(_pos select 0),(_pos select 1),_damage] spawn valor_fnc_persistent_vehicle_monitoring;

_vehicle setvariable ["DBID",(_queryresult select 0),true];
_vehicle setvariable["last_pos",(getposatl _vehicle)];
Valor_vehicles_monitoring pushBackUnique [_vehicle,(_queryresult select 0)];


format["Vehicle: %1 @ Pos %2 got inserted into the Database with ID %3. Vehicle number %4 being monitored.",(typeof _vehicle),_pos,(_queryresult select 0),(count Valor_vehicles_monitoring)] remoteExec ["systemchat", _requester];

