class CfgPatches {
	class data {
	        units[] = {};
	        weapons[] = {};
	        requiredVersion = 0.1;
	        requiredAddons[] = { "A3_Weapons_F" };
	};
};

class CfgFunctions
{
	class MAIN
	{
		tag = "valor";

		class functions
		{
			file = "\data\main";
			class preinit {preinit = 1;};
			class postinit {postinit = 1;};
			class bool {};
			class mainInit {ext = ".fsm";};
			class zombieMainMonitoring {ext = ".fsm";};
			class zombieMonitoring {ext = ".fsm";};
			class mapContentManagement {ext = ".fsm";};
			class survival {ext = ".fsm";};
			class player_monitor {ext = ".fsm";};
			class loot_spawn_system {ext = ".fsm";};
			class check_config {};
			class find_loot_in_Table {};
			class find_loottable {};
			class spawn_loot {};
			class mresArray {};
			class mresString {};
			class mToArray {};
			class numbersafe {};
			class setupLoginData {};
			class step_update {};
			class variables {};
			class zombie_config {};
			class gear_to_VAR {};
			class VAR_to_gear {};
			class clearPlayerInventory {};
			class load_BAMBI_GEAR {};
			class clear_map_hidement {};
			class discoverMapPoint {};
			class setup_map_hidement {};
			class init_functions {};
			class map_hidement_mArray {};
			class map_hidement_smaller_array {};
			class inventory_closed {};
			class syncPlayerToDB {};
			class admin_inform {};
		};
	};
};










