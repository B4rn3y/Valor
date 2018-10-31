


private ["_classname","_pos","_owner","_is_survival","_posatl","_dir","_vehicle","_damage","_fuel","_inventory","_locked","_query","_queryresult","_parts"];
_classname = param[0,"",[""]];
_pos = param [1,[],[[]]];
_owner = param[2,"",[""]];


iF(_classname isEqualTo "" || _pos isEqualTo []) exitWith {};







_posatl = _pos select 0;
_dir = _pos select 1;
_vehicle = _classname createVehicle [0,0,10];
_vehicle enableSimulation false;
_vehicle setdir _dir;
_vehicle setposatl _posatl;
_vehicle enableSimulation true;
_damage = getAllHitPointsDamage _vehicle select 2;
_parts = getAllHitPointsDamage _vehicle;


if(_vehicle iskindof "Land") then {
	for "_i" from 0 to ((count _damage) - 1) do {
		_part = ((_parts select 0) select _i);
		_damage_give = 0.9;
		if(([_part, "Wheel"] call BIS_fnc_filterString) isequalto "Wheel") then {_damage_give = 1;};
		if(_part isEqualTo "HitHull") then {_damage_give = 0.85;};
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
_queryresult = [format["Select id from persistent_vehicles where pos = '%1'",_pos],2] call valor_fnc_db_sync;

deleteVehicle _vehicle;
sleep 2;


_vehicle addEventHandler["Killed","_this spawn valor_fnc_vehicleDelete"];
[typeof _vehicle,(_pos select 0),(_pos select 1),0,_damage,[],0,(_queryresult select 0),(_pos select 0),(_pos select 1),_damage] spawn valor_fnc_persistent_vehicle_monitoring;

