class CfgPatches {
	class data {
	        units[] = {};
	        weapons[] = {};
	        requiredVersion = 0.1;
	        requiredAddons[] = { "A3_Weapons_F" };
	};
};

#include "\data\main\config\Quest_config.hpp" // include the Quest Config

#include "\data\main\config\Vehicle_repair_config.hpp" // include the Vehicle Repair Config -- What item for what u know?

class CfgFunctions
{
	class KRON_Strings
	{
		tag = "KRON";
		class Functions
		{
			file = "\data\main\functions\kron";
			class StrToArray{};
			class ArrayToStr{};
			class StrLeft{};
			class StrLen{};
			class StrRight{};
			class StrMid{};
			class StrIndex{};
			class StrInStr{};
			class Replace{};
			class StrUpper{};
			class StrLower{};
			class ArrayToUpper{};
			class Compare{};
			class findFlag{};
			class getArg{};
			class getArgRev{};
		};
	};

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
			class itemInInventory {};
			class escInterupt {};
			class clientDisconnect {};
			class say3D {};
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
			class setupVariablesTrader {};

		};

		class interact
		{
			file = "\data\main\interact";
			class restrainAction {};
			class restrain {};
			class unrestrain {};
			class escortAction {};
			class stopEscorting {};
		};

		class medical
		{
			file = "\data\main\medical";
			class revive {};
			class revived {};
			class respawn {};
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
			class initVehicles {};
		};

		class loot_system
		{
			file = "\data\main\loot_system";
			class check_config {};
			class find_loot_in_Table {};
			class find_loottable {};
			class loot_spawn_system {ext = ".fsm";};
			class spawn_loot {};
			class can_SPAWN_LOOT {};
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
			class player_monitor {ext = ".fsm";};
			class load_BAMBI_GEAR {};
			class step_update {};
			class syncPlayerToDB {};
			class VAR_to_gear {};
			class survival {ext = ".fsm";};
			class GetOutMan {};
			class onEachFrameHandler {};
			class stackOnEachFrame {};
		};

		class others
		{
			file = "\data\main\others";
			class admin_inform {};
			class intro {};
			class 3dCompass {};
		};

		class bases
		{
			file = "\data\main\bases";
			class base_config {};
			class place_base {};
			class lockdoor {};
			class objecthandler {};
			class additem {};
			class harvestItem {};
			class collect_egg {};
			class hatch_raptor {};
		};


		class vehicles
		{
			file = "\data\main\vehicles";
			class hideVehicleStatus {};
			class repairVehicle {};
			class showVehicleDamage {};
		};

		class EVH
		{
			file = "\data\main\EVH";
			class inventory_closed {};
			class inventory_opened {};
			class keyhandler {};
			class keyUp {};
			class on_put {};
			class rope_attached {};
			class onPlayerKilled {};
			class GetInEVH {};
			class takeEVH_trader {};
			class processEVH {};
			class inventory_useItem {};
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
			class raptor_checkforTarget_group {};
		};
	};
};