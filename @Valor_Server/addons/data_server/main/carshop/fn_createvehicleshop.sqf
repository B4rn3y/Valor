private ["_vehicle_ID","_requester","_classname","_pos","_dir","_price","_query","_close_vehicles","_vehicle"];

_vehicle_ID = param[0,-1,[1337]];
_requester = param[1,objNull,[objNull]];
_classname = param[2,"",[""]];
_pos = param[3,[],[[]]];
_dir = param[4,0,[1337]];
_price = param[5,0,[1337]];
if(_vehicle_ID isEqualTo -1 || isnull _requester || _classname isEqualTo "" || _pos isEqualTo [] || _price isEqualTo 0) exitWith {};

_close_vehicles = nearestObjects[_pos,["Landvehicle","Air","Ship"],20];
iF!(_close_vehicles isEqualTo []) exitWith {
		"Valor Error :: Could not spawn the vehicle, something is blocking the spawn." remoteExec["systemchat",_requester];
};

_query = format["Select id from persistent_vehicles where classname like '%1%2%1' and shop = '1';","%",_classname];

_id = [_query,2] call valor_fnc_db_sync;


if(_id isEqualTo []) exitWith {
	"Valor Error :: This vehicle was already bought" remoteExec["systemchat",_requester];
};



if([_vehicle_ID,0] call valor_fnc_setvehicleinshop) then {

	_vehicle = _classname createVehicle [0,0,100];
	_vehicle allowDamage false;
	[_vehicle] call valor_fnc_clear_vehicle;
	_vehicle setdir _dir;
	_vehicle setposatl [_pos select 0, _pos select 1,(_pos select 2)+1];
	_vehicle setvariable ["DBID",_vehicle_ID,true];
	_vehicle setvariable["last_pos",[0,0,0]];
	Valor_vehicles_monitoring pushBackUnique [_vehicle,_vehicle_ID];


	[_vehicle,
		["<t color='#0000ff'>Show Vehicle Status</t>",
		Valor_fnc_showVehicleDamage,
		[],
		1.5,
		false,
		false,
		"",
		"((_target distance player) <= 9) && vehicle player isEqualTo player",
		20
		]
	] remoteExec ["addaction", -2];

	_query = format["Update persistent_vehicles set bought = bought + 1,alive = '1' where id= '%1';",_vehicle_ID];
	[_query,1] call valor_fnc_db_sync;
	_query = format["Update vehicle_prices set bought = bought + 1 where classname = '%1'",str _classname];
	[_query,1] call valor_fnc_db_sync;


	[_vehicle_ID,_price,_vehicle,_classname] remoteExec["valor_fnc_buyvehiclefinish",_requester];
	_vehicle allowdamage true;
	_vehicle setdamage 0;
} else {
	"Valor Error :: The Server could not flag the vehicle as bought." remoteExec["systemchat",_requester];
};