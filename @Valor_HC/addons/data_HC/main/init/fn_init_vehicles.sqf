private ["_query","_res","_height_spawn","_vehicle","_pos","_dir","_vector","_classname","_alive","_spawnpos","_spawndamage","_inventory","_fuel","_damage","_shop","_owners","_number","_cop","_attach_pos","_atl","_classname_attach_object","_siren","_veh","_animal"];



_query = "Select id, pos, classname, alive, spawnpos, spawndamage, inventory, fuel, damage, shop, owners , locked, cop, attach_pos from persistent_vehicles;";

_res = [_query,2,true] call valor_fnc_db_sync;

//if(count _res isEqualTo 0) exitWith {diag_log "Valor :: Init Vehicles - No Vehicles"};
diag_log str _res;
diag_log typename _res;
_height_spawn = 10;
_vehicle = objNull;
{
	//diag_log str _x;
	//diag_log typename _x;
	_id = _x select 0;
	//{diag_log format["%1/%2",typename _x,_x];} foreach _x;
	_pos = (call compile (_x select 1)) select 0;
	_dir =  (call compile (_x select 1)) select 1;
	_vector = (call compile (_x select 1)) select 2;
	_classname = _x select 2;
	_alive = _x select 3;
	_spawnpos = _x select 4;
	_spawndamage = _x select 5;
	_inventory = _x select 6;
	_fuel = _x select 7;
	_damage = _x select 8;
	_shop = _x select 9;
	_owners = _x select 10;
	_number = _x select 11;
	_cop = _x select 12;
	_attach_pos = _x select 13;
	_classname = call compile _classname;
	if(_shop isEqualTo 0) then {


		//[_classname,_pos,_dir,_fuel,_damage,_inventory,_alive,_id,(_spawnpos select 0),(_spawnpos select 1),_spawndamage] spawn valor_fnc_persistent_vehicle_monitoring;

		/*
		if(_alive isEqualTo 0) then {
			waitUntil {!((nearestobjects[(_spawnpos select 0),[_classname],100]) isEqualTo [])};
			_query = format["UPDATE persistent_vehicles SET alive='1', fuel = '0' WHERE id = '%1'",_id];
		} else {
			waitUntil {!((nearestobjects[_pos,[_classname],100]) isEqualTo [])};
		};*/
		_vehicle = createVehicle[_classname,[0,0,_height_spawn],[],0,"CAN_COLLIDE"];
		_height_spawn = _height_spawn + 20;
		waitUntil {!isnull _vehicle};
		_vehicle allowDamage false;
		if(_alive isequalto 0) then {
			_vehicle setfuel 0;
			_vehicle setdir (_spawnpos select 1);
			_atl = (_spawnpos select 0);
			_atl = [_atl select 0,_atl select 1,(_atl select 2) + 0.5];
			_vehicle setVectorUp (_spawnpos select 2);
			_vehicle setposatl _atl;

			[_vehicle] call valor_fnc_clear_vehicle;
			[_vehicle,_spawndamage] spawn valor_fnc_setvehicleDamage;
			[_vehicle,random [30,150,360]] spawn {sleep (_this select 1);[_this select 0] call valor_fnc_saveVehicleComplete;};
			if(_cop isEqualTo 1) then {
				if!(_attach_pos isEqualTo [] || _attach_pos isEqualTo "") then {
					_classname_attach_object = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "classname_siren");
					if(_classname_attach_object isEqualTo "") exitWith {};

					_siren = _classname_attach_object createVehicle [0,0,0];
					_siren attachto [_vehicle,_attach_pos];
					_siren allowDamage false;
				};
				_vehicle spawn {_veh = _this; sleep 5; if((_veh distance (getmarkerpos "Survivor_city_1")) < 600) then {_veh setvariable["owners",["COP"],true];[_veh,2] remoteExec["lock",0];};};
			} else {
				[_vehicle,0] remoteExec["lock",0];
				if!(_attach_pos isEqualTo [] || _attach_pos isEqualTo "") then {
					[1,_id] spawn valor_fnc_update_attach_pos;
				};
			};
		} else {
			if!(_owners isEqualTo []) then {
				_vehicle setvariable["owners",_owners,true];
			};

			if!(_attach_pos isEqualTo [] || _attach_pos isEqualTo "") then {
				_classname_attach_object = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "classname_siren");
				if(_classname_attach_object isEqualTo "") exitWith {};

				_siren = _classname_attach_object createVehicle [0,0,0];
				_siren attachto [_vehicle,_attach_pos];
				_siren allowDamage false;
			};


			_vehicle setfuel _fuel;
			_vehicle setdir _dir;
			_atl = _pos;
			_atl = [_atl select 0,_atl select 1,(_atl select 2) + 0.5];
			_vehicle setVectorUp _vector;
			_vehicle setposatl _atl;
			if(_number isEqualTo 1) then {
				[_vehicle,2] remoteExec["lock",0];
			} else {
				[_vehicle,0] remoteExec["lock",0];
			};

			[_vehicle,_inventory] call valor_fnc_loadVehicleCargo;
			[_vehicle,_damage] spawn valor_fnc_setvehicleDamage;
		};



		_vehicle setvariable ["DBID",_id,true];
		_vehicle disableTIEquipment true;
		//_vehicle disableNVGEquipment true;
		Valor_vehicles_monitoring pushBackUnique [_vehicle,_id,if(_cop isEqualTo 1) then {true} else {false},false];


		[_vehicle,random [12,18,25]] spawn {sleep (_this select 1);(_this select 0) allowDamage true;};











		diag_log str [_classname,_pos,_dir,_fuel,_damage,_inventory,_alive,_id,(_spawnpos select 0),(_spawnpos select 1),_spawndamage];

		_query = format["UPDATE persistent_vehicles SET alive='1' WHERE id = '%1'",_id];

		[_query,1] call valor_fnc_db_sync;
	};
} foreach _res;




// [[1,"""[[0.48,51.82],208]""","""A1""",1],[2,"""[[20.66,87.55],273]""","""A1""",1],[3,"""[[0.78,78.06],317]""","""A1""",1],[4,"""[[20.66,87.55],273]""","""A1""",1],[5,"""[[40.86,23.41],340]""","""A1""",1],[6,"""[[20.66,87.55],273]""","""A1""",1],[7,"""[[0.92,78.66],326]""","""A1""",1],[8,"""[[20.66,87.55],273]""","""A1""",1],[9,"""[[20.66,87.55],273]""","""A1""",1],[10,"""[[0.78,78.06],317]""","""A1""",1],[11,"""[[20.66,87.55],273]""","""A1""",1],[12,"""[[20.66,87.55],273]""","""A1""",1],[15,"""[[80.96,18.82],185]""","""A1""",1],[16,"""[[20.66,87.55],273]""","""A1""",1],[17,"""[[20.66,87.55],273]""","""A1""",1],[18,"""[[20.66,87.55],273]""","""A1""",1],[19,"""[[20.66,87.55],273]""","""A1""",1],[20,"""[[20.66,87.55],273]""","""A1""",1],[21,"""[[0.78,78.06],317]""","""A1""",1],[22,"""[[0.78,78.06],317]""","""A1""",1],[23,"""[[0.78,78.06],317]""","""A1""",1],[24,"""[[0.78,78.06],317]""","""A1""",1],[25,"""[[20.66,87.55],273]""","""A1""",1],[26,"""[[20.66,87.55],273]""","""A1""",1],[27,"""[[20.66,87.55],273]""","""A1""",1],[28,"""[[20.66,87.55],273]""","""A1""",1],[29,"""[[0.92,78.66],326]""","""A1""",1],[30,"""[[20.66,87.55],273]""","""A1""",1],[31,"""[[20.66,87.55],273]""","""A1""",1],[47,"""[[20.66,87.55],273]""","""A1""",1],[48,"""[[20.66,87.55],273]""","""A1""",1],[49,"""[[20.66,87.55],273]""","""A1""",1],[50,"""[[20.66,87.55],273]""","""A1""",1],[51,"""[[20.66,87.55],273]""","""A1""",1],[52,"""[[20.66,87.55],273]""","""A1""",1],[53,"""[[20.66,87.55],273]""","""A1""",1],[54,"""[[20.66,87.55],273]""","""A1""",1],[55,"""[[20.66,87.55],273]""","""A1""",1],[56,"""[[20.66,87.55],273]""","""A1""",1],[57,"""[[20.66,87.55],273]""","""A1""",1],[58,"""[[20.66,87.55],273]""","""A1""",1],[59,"""[[20.66,87.55],273]""","""A1""",1],[60,"""[[20.66,87.55],273]""","""A1""",1],[61,"""[[20.66,87.55],273]""","""A1""",1],[62,"""[[20.66,87.55],273]""","""A1""",1],[63,"""[[0.78,78.06],317]""","""A1""",1],[64,"""[[0.78,78.06],317]""","""A1""",1],[65,"""[[0.78,78.06],317]""","""A1""",1],[66,"""[[0.78,78.06],317]""","""A1""",1],[67,"""[[0.78,78.06],317]""","""A1""",1],[68,"""[[0.78,78.06],317]""","""A1""",1],[69,"""[[0.78,78.06],317]""","""A1""",1],[70,"""[[0.78,78.06],317]""","""A1""",1],[71,"""[[0.78,78.06],317]""","""A1""",1],[72,"""[[0.78,78.06],317]""","""A1""",1],[73,"""[[0.78,78.06],317]""","""A1""",1],[74,"""[[0.78,78.06],317]""","""A1""",1],[75,"""[[0.78,78.06],317]""","""A1""",1],[76,"""[[0.78,78.06],317]""","""A1""",1],[77,"""[[0.78,78.06],317]""","""A1""",1],[78,"""[[20.66,87.55],273]""","""A1""",1],[79,"""[[20.66,87.55],273]""","""A1""",1],[80,"""[[20.66,87.55],273]""","""A1""",1],[81,"""[[20.66,87.55],273]""","""A1""",1],[82,"""[[20.66,87.55],273]""","""A1""",1],[83,"""[[20.66,87.55],273]""","""A1""",1],[84,"""[[20.66,87.55],273]""","""A1""",1],[85,"""[[20.66,87.55],273]""","""A1""",1],[86,"""[[20.66,87.55],273]""","""A1""",1],[87,"""[[20.66,87.55],273]""","""A1""",1],[88,"""[[20.66,87.55],273]""","""A1""",1],[89,"""[[20.66,87.55],273]""","""A1""",1],[90,"""[[20.66,87.55],273]""","""A1""",1],[91,"""[[20.66,87.55],273]""","""A1""",1],[92,"""[[0.92,78.66],326]""","""A1""",1],[93,"""[[0.92,78.66],326]""","""A1""",1],[94,"""[[0.92,78.66],326]""","""A1""",1],[95,"""[[0.92,78.66],326]""","""A1""",1],[96,"""[[0.92,78.66],326]""","""A1""",1],[97,"""[[0.92,78.66],326]""","""A1""",1],[98,"""[[0.92,78.66],326]""","""A1""",1],[99,"""[[0.92,78.66],326]""","""A1""",1],[100,"""[[0.92,78.66],326]""","""A1""",1],[101,"""[[0.92,78.66],326]""","""A1""",1],[102,"""[[0.92,78.66],326]""","""A1""",1],[103,"""[[0.92,78.66],326]""","""A1""",1],[104,"""[[20.66,87.55],273]""","""A1""",1],[105,"""[[20.66,87.55],273]""","""A1""",1],[106,"""[[20.66,87.55],273]""","""A1""",1],[107,"""[[20.66,87.55],273]""","""A1""",1],[108,"""[[20.66,87.55],273]""","""A1""",1],[109,"""[[20.66,87.55],273]""","""A1""",1],[110,"""[[20.66,87.55],273]""","""A1""",1],[111,"""[[20.66,87.55],273]""","""A1""",1],[112,"""[[20.66,87.55],273]""","""A1""",1],[113,"""[[20.66,87.55],273]""","""A1""",1],[114,"""[[20.66,87.55],273]""","""A1""",1],[115,"""[[20.66,87.55],273]""","""A1""",1],[116,"""[[0.78,78.06],317]""","""A1""",1],[117,"""[[0.78,78.06],317]""","""A1""",1],[118,"""[[0.78,78.06],317]""","""A1""",1],[119,"""[[0.78,78.06],317]""","""A1""",1],[120,"""[[0.78,78.06],317]""","""A1""",1],[121,"""[[0.78,78.06],317]""","""A1""",1],[122,"""[[20.66,87.55],273]""","""A1""",1],[123,"""[[20.66,87.55],273]""","""A1""",1],[124,"""[[20.66,87.55],273]""","""A1""",1],[125,"""[[20.66,87.55],273]""","""A1""",1],[126,"""[[20.66,87.55],273]""","""A1""",1],[127,"""[[20.66,87.55],273]""","""A1""",1],[128,"""[[20.66,87.55],273]""","""A1""",1],[129,"""[[20.66,87.55],273]""","""A1""",1],[130,"""[[20.66,87.55],273]""","""A1""",1],[131,"""[[20.66,87.55],273]""","""A1""",1],[132,"""[[20.66,87.55],273]""","""A1""",1],[133,"""[[20.66,87.55],273]""","""A1""",1],[134,"""[[20.66,87.55],273]""","""A1""",1],[135,"""[[20.66,87.55],273]""","""A1""",1],[136,"""[[20.66,87.55],273]""","""A1""",1],[137,"""[[20.66,87.55],273]""","""A1""",1],[138,"""[[20.66,87.55],273]""","""A1""",1],[139,"""[[20.66,87.55],273]""","""A1""",1],[140,"""[[20.66,87.55],273]""","""A1""",1],[141,"""[[20.66,87.55],273]""","""A1""",1],[142,"""[[20.66,87.55],273]""","""A1""",1],[143,"""[[20.66,87.55],273]""","""A1""",1],[144,"""[[20.66,87.55],273]""","""A1""",1],[145,"""[[20.66,87.55],273]""","""A1""",1],[146,"""[[20.66,87.55],273]""","""A1""",1],[147,"""[[20.66,87.55],273]""","""A1""",1],[148,"""[[20.66,87.55],273]""","""A1""",1],[149,"""[[20.66,87.55],273]""","""A1""",1],[150,"""[[20.66,87.55],273]""","""A1""",1],[151,"""[[20.66,87.55],273]""","""A1""",1],[152,"""[[20.66,87.55],273]""","""A1""",1],[153,"""[[20.66,87.55],273]""","""A1""",1],[154,"""[[20.66,87.55],273]""","""A1""",1],[155,"""[[20.66,87.55],273]""","""A1""",1],[156,"""[[20.66,87.55],273]""","""A1""",1],[157,"""[[20.66,87.55],273]""","""A1""",1],[158,"""[[20.66,87.55],273]""","""A1""",1],[159,"""[[20.66,87.55],273]""","""A1""",1],[160,"""[[20.66,87.55],273]""","""A1""",1],[161,"""[[20.66,87.55],273]""","""A1""",1],[162,"""[[20.66,87.55],273]""","""A1""",1],[163,"""[[20.66,87.55],273]""","""A1""",1],[164,"""[[20.66,87.55],273]""","""A1""",1],[165,"""[[20.66,87.55],273]""","""A1""",1],[166,"""[[20.66,87.55],273]""","""A1""",1],[167,"""[[20.66,87.55],273]""","""A1""",1],[168,"""[[20.66,87.55],273]""","""A1""",1],[169,"""[[20.66,87.55],273]""","""A1""",1],[170,"""[[20.66,87.55],273]""","""A1""",1],[171,"""[[20.66,87.55],273]""","""A1""",1],[172,"""[[20.66,87.55],273]""","""A1""",1],[173,"""[[20.66,87.55],273]""","""A1""",1],[174,"""[[20.66,87.55],273]""","""A1""",1],[175,"""[[0.78,78.06],317]""","""A1""",1],[176,"""[[0.78,78.06],317]""","""A1""",1],[177,"""[[0.78,78.06],317]""","""A1""",1],[178,"""[[0.78,78.06],317]""","""A1""",1],[179,"""[[0.78,78.06],317]""","""A1""",1],[180,"""[[0.78,78.06],317]""","""A1""",1],[181,"""[[0.78,78.06],317]""","""A1""",1],[182,"""[[0.78,78.06],317]""","""A1""",1],[183,"""[[0.78,78.06],317]""","""A1""",1],[184,"""[[0.78,78.06],317]""","""A1""",1],[185,"""[[0.78,78.06],317]""","""A1""",1],[186,"""[[0.78,78.06],317]""","""A1""",1],[187,"""[[0.78,78.06],317]""","""A1""",1],[188,"""[[0.78,78.06],317]""","""A1""",1],[189,"""[[0.78,78.06],317]""","""A1""",1],[190,"""[[0.78,78.06],317]""","""A1""",1],[191,"""[[0.78,78.06],317]""","""A1""",1],[192,"""[[0.78,78.06],317]""","""A1""",1],[193,"""[[0.78,78.06],317]""","""A1""",1],[194,"""[[0.78,78.06],317]""","""A1""",1],[195,"""[[0.78,78.06],317]""","""A1""",1],[196,"""[[20.66,87.55],273]""","""A1""",1],[197,"""[[20.66,87.55],273]""","""A1""",1],[198,"""[[20.66,87.55],273]""","""A1""",1],[199,"""[[20.66,87.55],273]""","""A1""",1],[200,"""[[20.66,87.55],273]""","""A1""",1],[201,"""[[20.66,87.55],273]""","""A1""",1],[202,"""[[20.66,87.55],273]""","""A1""",1],[203,"""[[20.66,87.55],273]""","""A1""",1],[204,"""[[20.66,87.55],273]""","""A1""",1],[205,"""[[20.66,87.55],273]""","""A1""",1],[206,"""[[20.66,87.55],273]""","""A1""",1]]


// [[1f52b9c6040# 1552485: cup_uaz.p3d REMOTE,101,false],

//[1f52d19e040# 1552493: cup_s1203_lm.p3d REMOTE,102,false],[1f52d096040# 1552495: warrig.p3d REMOTE,103,false],[1f52cfd2040# 1552496: cup_skodovka.p3d REMOTE,104,false],[1f52cf4c080# 1552497: quadbike_01_f.p3d REMOTE,105,false],[1f52cd24080# 1552498: cup_lr_mg.p3d REMOTE,106,false],[1f52cb46040# 1552499: cup_volha.p3d REMOTE,107,false],[1f52ca2a040# 1552500: cup_lada.p3d REMOTE,108,true],[1f52c8d8080# 1552501: mrap_01_unarmed_f.p3d REMOTE,109,true],[1f52c7b6040# 1552503: rhs_tigr.p3d REMOTE,110,true],[1f52d5da040# 1552509: cup_volha.p3d REMOTE,111,true],[1f52d54e040# 1552512: cup_volha.p3d REMOTE,112,true],[1f52d3e4080# 1552514: cup_gaz39371_vodnik.p3d REMOTE,113,true],[1f52e1ac080# 1552516: cup_ural.p3d REMOTE,114,true],[1f52e0fe040# 1552522: cup_volha.p3d REMOTE,115,true],[1f52e0fc080# 1552526: cup_volha.p3d REMOTE,116,true],[1f52dffc080# 1552529: cup_ural.p3d REMOTE,117,false],[1f52df9a040# 1552531: cup_ural.p3d REMOTE,118,false],[1f52ddce040# 1552533: cup_uaz_mg.p3d REMOTE,119,false],[1f52ddb8080# 1552535: rhs_tigr.p3d REMOTE,120,false],[1f52dc64080# 1552538: cup_vwgolf.p3d REMOTE,121,false],[1f52db66040# 1552539: cup_datsun_civil.p3d REMOTE,122,false],[1f52da76040# 1552540: fox_daytona.p3d REMOTE,123,false],[1f52da58080# 1552541: fox_daytona.p3d REMOTE,124,false],[1f52d8fa040# 1552542: cup_hmmwv50.p3d REMOTE,125,false],[1f52d8f8080# 1552543: cup_tt650.p3d REMOTE,126,false],[1f52d810080# 1552544: fox_tahoe_apocalypse.p3d REMOTE,127,false],[1f52e628080# 1552545: cup_suv_armored.p3d REMOTE,128,false],[1f52973e040# 1552546: quadbike_01_f.p3d REMOTE,129,false],[1f52e494080# 1552547: truck_02_transport_f.p3d REMOTE,130,false],[1f52e3c4080# 1552548: fox_bus.p3d REMOTE,131,false],[1f52e38c080# 1552549: fox_gnx.p3d REMOTE,132,false],[1f52f1aa040# 1552550: cup_kamaz.p3d REMOTE,133,false],[1f52f0ca040# 1552551: cup_ikarus.p3d REMOTE,134,false],[1f52f02a040# 1552552: cup_ural.p3d REMOTE,135,false],[1f52efaa040# 1552553: cup_skodovka.p3d REMOTE,136,false],[1f52ef32040# 1552554: cup_volha.p3d REMOTE,137,false],[1f52ee6e040# 1552555: cup_datsun_civil.p3d REMOTE,138,false],[1f52ec98080# 1552556: heli_light_01_f.p3d REMOTE,139,false],[1f52e836040# 1552557: cup_uh1h.p3d REMOTE,140,true],[1f52e834080# 1552559: cup_uh1h.p3d REMOTE,142,false],[1f5301ea040# 1552560: cup_uh60m.p3d REMOTE,143,false],[1f52fe64080# 1552561: cup_uh1y_transport.p3d REMOTE,144,false],[1f52fa42040# 1552562: int73_mi6t.p3d REMOTE,145,false],[1f52f902040# 1552563: cup_mi_8amt_viv.p3d REMOTE,147,false],[1f52f86c080# 1552564: cup_an2.p3d REMOTE,148,false],[1f53051e040# 1552565: ofrp_puma_ce.p3d REMOTE,149,false],[1f5304d0080# 1552566: ultralight.p3d REMOTE,150,false],[1f530486040# 1552567: ultralight.p3d REMOTE,151,false],[1f530484080# 1552568: ultralight.p3d REMOTE,152,false],[1f53044a040# 1552569: ultralight.p3d REMOTE,153,false]]

_query = "Select id, pos, classname, alive from animals;";

_res = [_query,2,true] call valor_fnc_db_sync;


{
	_id = _x select 0;
	_pos = (call compile(call compile (_x select 1))) select 0;
	_dir = (call compile(call compile (_x select 1))) select 1;
	_classname = call compile(_x select 2);
	_alive = _x select 3;

	if(_alive isEqualTo 0) then {
		_pos = [[worldSize/2,worldSize/2,0], 0, 8000, 30, 0, 0.85, 0] call BIS_fnc_findSafePos;
		_dir = random 360;
		_pos pushback 0;
	};
	diag_log format["pos %1 - alive %2",_pos, _alive];
	_animal = createAgent [_classname, _pos, [], 0, "FORM"];
	_animal setposatl _pos;
	_animal setdir _dir;
	_animal setvariable ["DBID",_id,true];

	[_animal] spawn valor_fnc_animal_Monitoring;

	Valor_vehicles_monitoring pushBack [_animal,_id,false,true];

} foreach _res;

_query = "Update animals set alive = '1' where alive = '0' and id > 0";
[_query,1] call valor_fnc_db_sync;


[] spawn valor_fnc_persistent_vehicle_monitoring;


Valor_vehicles_init_finished = true;






// _query = format["Insert into persistent_vehicles (pos,classname,spawnpos,inventory,fuel,damage,Spawndamage) VALUES ('%1','%2','%3','%4','%5','%6','%7')",[[10517.9,2287.32,10.7712],271.889],"CUP_B_UH1D_GER_KSK",[[[10517.9,2287.32,10.7712],271.889]],"""[[[],[]],[[],[]],[[],[]],[[],[]]]""",0,"""[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0]""","""[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0]"""];