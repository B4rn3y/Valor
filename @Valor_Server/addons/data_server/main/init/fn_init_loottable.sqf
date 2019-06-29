
private ["_query","_res","_loottable","_classname","_table","_max_prob","_min_prob","_type","_spawn_with","_found","_foreachindex","_entry","_loottable_name","_array_with_items","_res_2","_houses","_array_with_houses"];

_query = "Select classname, table_type, max_prob, min_prob, type, spawn_with from loottable_classnames;";

_res = [_query,2,true] call valor_fnc_db_sync;

_loottable = [];
{
	_classname = _x select 0;
	_table = _x select 1;
	_max_prob = call compile(_x select 2);
	_min_prob = call compile(_x select 3);
	_type = _x select 4;
	_spawn_with = call compile(_x select 5);
	_found = -1;

	{
		if((_x select 0) isEqualTo _table) exitWith {_found = _foreachindex;};
	} foreach _loottable;

	if!(_found isEqualTo -1) then {
		_entry = _loottable select _found;
		_loottable_name = _entry select 0;
		_array_with_items = _entry select 1;
		_array_with_items pushback [_min_prob,_max_prob,_classname,_type,_spawn_with];
		_loottable set[_found,[_loottable_name,_array_with_items]];
	} else {
		_loottable pushback [_table,[[_min_prob,_max_prob,_classname,_type,_spawn_with]]];
	};
} foreach _res;

lootspawn_config = _loottable;
publicVariable "lootspawn_config";
diag_log format["lootspawn_config: %1",lootspawn_config];



_query = "Select classname, table_type from loottable_houses;";

_res_2 = [_query,2,true] call valor_fnc_db_sync;

_houses = [];
{
	_classname = _x select 0;
	_table = _x select 1;
	_found = -1;

	{
		if((_x select 0) isEqualTo _table) exitWith {_found = _foreachindex;};
	} foreach _houses;

	if!(_found isEqualTo -1) then {
		_entry = _houses select _found;
		_loottable_name = _entry select 0;
		_array_with_houses = _entry select 1;
		_array_with_houses pushback _classname;
		_houses set[_found,[_loottable_name,_array_with_houses]];
	} else {
		_houses pushback [_table,[_classname]];
	};
} foreach _res_2;

lootspawn_house_config = _houses;
publicVariable "lootspawn_house_config";
diag_log format["lootspawn_house_config: %1",lootspawn_house_config];







/*

	[[["general",["Land_HouseV_2L","Land_HouseV_1I4"]],["Land_HouseV_2L","Land_HouseV_1I4"]],["general",["general",["Land_HouseV2_04_interier_dam","Land_HouseV_2I"]]]]


	[[["general",[["0.0001","0.0010","srifle_EBR_F","weapon","[[""20Rnd_762x51_Mag"",4,""magazin""]]"],["1.0001","3","arifle_TRG20_F","weapon","[[""30Rnd_556x45_Stanag"",4,""magazin""]]"]]],[["0.0001","0.0010","srifle_EBR_F","weapon","[[""20Rnd_762x51_Mag"",4,""magazin""]]"],["1.0001","3","arifle_TRG20_F","weapon","[[""30Rnd_556x45_Stanag"",4,""magazin""]]"]]],["general",["general",["general",["general",["general",["general",["general",["general",["general",["general",["general",["general",["general",["general",["general",["general",[["1","5","U_BG_Guerilla2_3","item","[]"],["1","10","U_C_Poor_1","item","[]"]],["1","3","CUP_U_C_Fireman_01","item","[]"]],["1","7","CUP_U_C_Citizen_01","item","[]"]],["1","7","CUP_U_O_CHDKZ_Bardak","item","[]"]],["1","10","U_C_HunterBody_grn","item","[]"]],["1","7","CUP_U_C_Pilot_01","item","[]"]],["1","6","CUP_U_C_Profiteer_01","item","[]"]],["1","5","CUP_U_C_Rocker_03","item","[]"]],["1","6","CUP_U_C_Suit_01","item","[]"]],["1","6","CUP_U_C_Villager_02","item","[]"]],["1","6","CUP_U_C_Worker_02","item","[]"]],["1","6","CUP_V_OI_TKI_Jacket1_04","item","[]"]],["1","10","B_AssaultPack_blk","backpack","[]"]],["1","7","CUP_B_Bergen_BAF","backpack","[]"]],["1","2","B_Carryall_khk","backpack","[]"]]]]]









	lootspawn_config = [
		["general",
			[
				[0.0001,0.0010,"srifle_EBR_F","weapon",[["20Rnd_762x51_Mag",4,"magazin"]]],
				[1.0001,3.0000,"arifle_TRG20_F","weapon",[["30Rnd_556x45_Stanag",4,"magazin"]]],
				[1,5,"U_BG_Guerilla2_3","item" , []],
				[1,10,"U_C_Poor_1","item" , []],
				[1,3,"CUP_U_C_Fireman_01","item" , []],
				[1,7,"CUP_U_C_Citizen_01","item" , []],
				[1,5,"CUP_U_O_CHDKZ_Bardak","item" , []],
				[1,10,"U_C_HunterBody_grn","item" , []],
				[1,7,"CUP_U_C_Pilot_01","item" , []],
				[1,6,"CUP_U_C_Profiteer_01","item" , []],
				[1,5,"CUP_U_C_Rocker_03","item" , []],
				[1,6,"CUP_U_C_Suit_01","item" , []],
				[1,6,"CUP_U_C_Villager_02","item" , []],
				[1,6,"CUP_U_C_Worker_02","item" , []],
				[1,6,"CUP_V_OI_TKI_Jacket1_04","item" , []],
				[1,10,"B_AssaultPack_blk","backpack" , []],
				[1,7,"CUP_B_Bergen_BAF","backpack" , []],
				[1,2,"B_Carryall_khk","backpack" , []]
			]
		]
	];

	lootspawn_house_config = [
		["general",
			[
				"Land_HouseV_2L",
				"Land_HouseV_1I4",
				"Land_HouseV2_04_interier_dam",
				"Land_HouseV_2I"
			]
		]

	];


*/