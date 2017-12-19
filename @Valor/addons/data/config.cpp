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

		class atmosphere
		{
			file = "\data\main\atmosphere";
			class fog {ext = ".fsm";};
			class gas {ext = ".fsm";};
			class gas_damage {ext = ".fsm";};
		};

		class traderzones
		{
			file = "\data\main\traderzones";
			class addEVH_trader {};
			class handledamage_traderzone {};
			class punish_killer {};
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
			class init_traders {};
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
			class discoverMapPoint {};
			class map_hidement_mArray {};
			class mapContentManagement {ext = ".fsm";};
			class map_hidement_smaller_array {};
			class setup_map_hidement {};
			class get_hidement_array {};
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
			class survival {ext = ".fsm";};
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
			class mark_Object {ext = ".fsm";};

			class agentMonitoring {ext = ".fsm";};
			class animalMonitoring {ext = ".fsm";};

			class zombie_config {};
			class zombie_attack {};
			class zombie_canattack {};
			class zombie_checkforTarget {};
			class zombie_checkVisibility {};
			class zombie_moveToTarget {};
			class zombie_roam {};
			class zombieMainMonitoring {ext = ".fsm";};
			class zombieMonitoring {ext = ".fsm";};
			class can_SPAWN_ZED {};
			//Raptors
			class raptor_attack {};
			class raptor_canattack {};
			class raptor_checkforTarget {};
			class raptorMonitoring {ext = ".fsm";};
			class raptor_roam {};
			class jumpattack {};
		};
	};
};