


private ["_config_copy","_max","_multiplikator","_actual_selection","_counter","_min","_difference","_foreachindex"];
diag_log "Valor Client  :: Checking Config for Lootspawn";

if(isnil "lootspawn_config") then {
	diag_log "Valor Client :: Lootspawn Config nil - setting default value";
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
				[1,2,"B_Carryall_khk","backpack" , []],
				[1,5,"rhs_sidor","backpack" , []]
			]
		]
	];

} else {diaG_log "Valor Client :: Loottable Config found"};




if(isnil "lootspawn_house_config") then {
	diag_log "Valor Client :: Lootspawn House Config nil - setting default value";
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

} else {diaG_log "Valor Client :: House Config for Housespawns found"};








diag_log "Valor Client :: Start editing Lootspawn Config";

_config_copy = lootspawn_config;
_max = 0;
{
	{
		_max = _max + ((_x select 1) - (_x select 0));
	} foreach (_x select 1);
} foreach _config_copy;

_multiplikator = 100 / _max;


{
	_actual_selection = _x select 1;
	_counter = 0;
	{
		_min = (_x select 0) * _multiplikator;
		_max = (_x select 1) * _multiplikator;
		_difference = _max - _min;
		_min = _counter;
		_max = _min + _difference;
		_counter = _max;
		_actual_selection set [_foreachindex,[_min,_max,_x select 2,_x select 3,_x select 4]];
	} foreach (_x select 1);
	_actual_selection = [_x select 0,_actual_selection];
	_config_copy set [_foreachindex,_actual_selection];

} foreach _config_copy;


lootspawn_config = _config_copy;

diag_log "Valor Client :: Lootspawn Config Edit complete";