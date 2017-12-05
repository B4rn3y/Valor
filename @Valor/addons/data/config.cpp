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
			file = "\data\main\functions";
			class bool {};
			class mresArray {};
			class mresString {};
			class mToArray {};
			class numbersafe {};
			class binmake {};
		};

		class init
		{
			file = "\data\main\Init";
			class init_functions {};
			class mainInit {ext = ".fsm";};
			class postinit {postinit = 1;};
			class preinit {preinit = 1;};
			class setupLoginData {};
			class variables {};
		};

		class loot_system
		{
			file = "\data\main\loot_system";
			class check_config {};
			class find_loot_in_Table {};
			class find_loottable {};
			class loot_spawn_system {ext = ".fsm";};
			class spawn_loot {};
		};

		class map_hidement
		{
			file = "\data\main\map_hidement";
			class clear_map_hidement {};
			class discoverMapPoint {};
			class map_hidement_mArray {};
			class mapContentManagement {ext = ".fsm";};
			class map_hidement_smaller_array {};
			class setup_map_hidement {};
		};

		class mission_persistance
		{
			file = "\data\main\mission_persistance";
			class clearPlayerInventory {};
			class gear_to_VAR {};
			class inventory_closed {};
			class player_monitor {ext = ".fsm";};
			class load_BAMBI_GEAR {};
			class step_update {};
			class syncPlayerToDB {ext = ".fsm";};
			class VAR_to_gear {};
		};

		class others
		{
			file = "\data\main\others";
			class admin_inform {};
			class intro {};
		};

		class zombie
		{
			file = "\data\main\zombie";
			class zombie_config {};
			class zombieMainMonitoring {ext = ".fsm";};
			class zombieMonitoring {ext = ".fsm";};
		};
	};
};










