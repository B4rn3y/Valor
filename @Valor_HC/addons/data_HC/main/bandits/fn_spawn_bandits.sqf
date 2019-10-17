private ["_markertext","_bandit_gear","_conf","_outpost_conf","_crate_classname","_crate_conf","_unit_conf","_marker","_pos","_dir","_watch_pos","_soldier","_item_amount","_loottable_compiled","_conter","_min","_max","_diff","_mult","_loottable","_counter","_crate","_log_items","_d","_rnd","_classname","_type","_spawn_with"];



_markertext = "Rebel Camp";
_bandit_gear = ["CUP_U_O_TK_Green","","CUP_arifle_AK47_Early",["","","",""],["CUP_30Rnd_762x39_AK47_M"],"",["","","",""],[],"",["","","",""],[],["CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M"],"V_PlateCarrier1_wdl",["CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M"],"H_Booniehat_khk_hs","",["ItemMap","ItemCompass"],[]];








_conf =
[
	[
		"CargoNet_01_box_F",
		[[2188.94,11889.4,0.0209351],285.249,[-0.01001,-0.0548856,0.998442]],
		[[[2174.93,11906.8,0.0012207],285.321,[2165.28,11909.4,-0.952881]],[[2200.97,11902.8,0.00128174],322.207,[2194.84,11910.7,-0.253357]],[[2204.07,11890.2,0.00158691],87.3226,[2214.05,11890.7,-0.230713]],[[2198.23,11877.5,0.00158691],168.175,[2200.28,11867.7,0.77005]],[[2186.38,11872.2,0.0015564],201.271,[2182.76,11862.9,0.77356]],[[2175.52,11876,1.47049],223.181,[2168.68,11868.7,1.3728]],[[2173.71,11891.6,0.646545],285.713,[2164.09,11894.3,0.103882]],[[2192.12,11902.8,0.00134277],341.109,[2188.89,11912.2,-0.400818]],[[2184.81,11890.7,0.0147095],153.671,[2189.24,11881.8,0.485748]],[[2182.79,11884.6,0.0407104],76.2002,[2192.51,11887,-0.199951]],[[2179.93,11881.5,0.00140381],227.291,[2172.58,11874.8,0.636688]],[[2190.37,11885.4,0.00158691],104.85,[2200.04,11882.8,0.135864]]]
	],
	[
		"CargoNet_01_box_F",
		[[7064.94,7736.42,0.692657],69.7057,[-0.00175324,0.00510557,0.999985]],
		[[[7089.94,7696.89,3.05475],163.267,[7092.82,7687.31,3.05475]],[[7082.58,7694.27,3.05579],157.588,[7086.4,7685.03,3.05579]],[[7072.24,7691.72,3.05475],160.788,[7075.53,7682.28,3.05475]],[[7064.91,7689.11,3.05579],193.796,[7062.53,7679.4,3.05579]],[[7060,7691.08,3.05475],250.9,[7050.55,7687.81,3.05475]],[[7057.73,7698.34,3.05579],248.788,[7048.41,7694.72,3.05579]],[[7071.16,7710.07,0.130737],158.833,[7074.77,7700.75,0.145782]],[[7076.85,7712.04,0.13446],163.217,[7079.74,7702.47,0.153809]],[[7084.27,7745.78,0.00143433],220.077,[7077.83,7738.13,-0.00201416]],[[7056.46,7741.96,0.00146484],11.9408,[7058.53,7751.75,-0.246979]],[[7050.95,7735.76,0.00140381],119.389,[7059.66,7730.85,-0.0108643]],[[7062.84,7734.72,0.679138],156.563,[7066.82,7725.55,0.645508]],[[7068.2,7736.46,0.698303],163.419,[7071.05,7726.88,0.645508]],[[7074.41,7726.49,0.102142],226.153,[7067.2,7719.56,0.102142]],[[7063.41,7723.05,0.102173],108.587,[7072.88,7719.87,0.102173]]]
	],
	[
		"CargoNet_01_box_F",
		[[14526,13104.6,22.6084],249.875,[0.00180366,0.00205257,0.999996]],
		[[[14551.9,13096.3,23.3623],86.7467,[14561.9,13096.8,22.7184]],[[14533.5,13114.4,22.467],333.414,[14529,13123.3,22.3542]],[[14512.7,13104.6,22.6874],270.644,[14502.7,13104.7,22.6794]],[[14517.7,13084.4,24.8746],247.373,[14508.5,13080.5,23.8744]],[[14536.5,13083.9,25.4767],153.683,[14541,13075,24.4659]],[[14518.8,13102.6,22.5337],67.9922,[14528.1,13106.4,22.5898]],[[14507.1,13116.9,17.548],281.107,[14497.2,13118.8,18.0154]],[[14524.9,13134.8,17.8165],337.829,[14521.2,13144.1,17.6347]],[[14535.3,13102.9,41.0393],272.687,[14525.3,13103.4,40.7217]],[[14538.2,13105.5,41.0252],24.0766,[14542.3,13114.6,40.7217]]]
	],
	[
		"CargoNet_01_box_F",
		[[12453.7,6895.14,0.00469971],205.506,[0.0845004,-0.0150304,0.99631]],
		[[[12415.9,6886.46,0.0012207],290.283,[12406.5,6889.92,-1.07771]],[[12445,6870.84,0.00138855],167.147,[12447.3,6861.09,0.461746]],[[12471.3,6901.6,0.00166321],92.1267,[12481.3,6901.22,1.31288]],[[12469.8,6924.7,0.00180054],27.9534,[12474.5,6933.54,1.05486]],[[12446.6,6929.3,0.00170898],340.173,[12443.2,6938.71,0.00506592]],[[12428.3,6899.54,0.00123596],275.46,[12418.4,6900.49,-0.926483]],[[12437.8,6897.44,0.00149536],119.924,[12446.5,6892.45,0.761276]],[[12456.8,6893.83,0.00115967],206.954,[12452.3,6884.91,-0.203384]],[[12449.4,6897.17,0.00120544],202.179,[12445.6,6887.91,-0.11824]]]
	]
];

// create units and marker
_outpost_conf = selectRandom _conf;
_crate_classname = _outpost_conf select 0;
_crate_conf = _outpost_conf select 1;
_unit_conf = _outpost_conf select 2;

_marker = createMarker ["marker_rebel_camp_marker", (_crate_conf select 0)];
_marker setMarkerType "o_art";
_marker setMarkerBrush "Solid";
_marker setMarkerText _markertext;

{
	_pos = _x select 0;
	_dir = _x select 1;
	_watch_pos = _x select 2;
	_soldier = (createGroup independent) createUnit["I_Soldier_AR_F",_pos,[],0,"CAN_COLLIDE"];
	_soldier setposatl _pos;
	_soldier setdir _dir;
	[_bandit_gear,_soldier] call valor_fnc_var_to_gear_object;
	_soldier doWatch _watch_pos;

	_soldier addeventhandler["killed",valor_fnc_on_bandit_killed];
} foreach _unit_conf;



// convert loottable
_item_amount = getnumber(missionConfigFile >> "Valor_settings" >> "loot_drops" >> "item_amount");


waitUntil {!isnil "lootspawn_config_loot_drop"};
waitUntil {!isnil "lootspawn_config_m_military"};
waitUntil {!isnil "lootspawn_config_h_military"};

_loottable_compiled = [];
_conter = 0;
{
	_min = call compile (_x select 0);
	_max = call compile (_x select 1);
	_loottable_compiled pushback [_min,_max,_x select 2,_x select 3, (call compile (_x select 4))];
	_diff = _max - _min;
	_conter = _conter + _diff;
} foreach (lootspawn_config_loot_drop + lootspawn_config_m_military + lootspawn_config_h_military);

_mult = 100/_conter;
_loottable = [];
_counter = 0;
{
	_diff = (_x select 1)- (_x select 0);
	_diff = _diff * _mult;
	_loottable pushback[_counter,(_counter + _diff),_x select 2,_x select 3, _x select 4];
	_counter = _counter + _diff;
} foreach _loottable_compiled;


// create crate

_crate = _crate_classname createVehicle [0,0,0];
_crate setposatl (_crate_conf select 0);
_crate setdir (_crate_conf select 1);
_crate setVectorUp (_crate_conf select 2);
[_crate] call valor_fnc_clear_vehicle;

_log_items = getarray(missionConfigFile >> "Valor_settings" >> "loot_settings" >> "Loot_log_items");

// add loot to crate

for "_d" from 1 to _item_amount do {
	_rnd = random 100;
	{
		_min = _x select 0;
		_max = _x select 1;
		if(_min <= _rnd && _max >= _rnd) then {
			_classname = _x select 2;
			_type = _x select 3;
			_spawn_with = _x select 4;
			if(_classname in _log_items) then {
				_conf = [_classname] call valor_fnc_getconfig;
				[[format["%1(%2) was spawned @ a Rebel Outpost",gettext(configFile >> _conf >> _classname >> "displayname"),_classname]],"valor_fnc_log",2] spawn valor_fnC_remoteexec;
			};
			switch(_type) do {
				case "weapon":
				{
					_crate addweaponcargoglobal[_classname,1];
				};
				case "magazin":
				{
					_crate addmagazinecargoglobal[_classname,1];
				};
				case "item":
				{
					_crate additemcargoglobal[_classname,1];
				};
				case "backpack":
				{
					_crate addbackpackcargoglobal[_classname,1];
				};
				default {
					_crate additemcargoglobal[_classname,1];
				};
			};
			{
				switch(_x select 2) do {
				case "weapon":
				{
					_crate addweaponcargoglobal[(_x select 0),(_x select 1)];
				};
				case "magazin":
				{
					_crate addmagazinecargoglobal[(_x select 0),(_x select 1)];
				};
				case "item":
				{
					_crate additemcargoglobal[(_x select 0),(_x select 1)];
				};
				case "backpack":
				{
					_crate addbackpackcargoglobal[(_x select 0),(_x select 1)];
				};
				default {
					_crate additemcargoglobal[(_x select 0),(_x select 1)];
				};
			};
			} foreach _spawn_with;

		};
	} foreach _loottable;
};






















