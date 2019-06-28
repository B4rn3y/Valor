class DefaultEventhandlers;
class CfgPatches
{
	class data_server
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "data_server.pbo";
		author[]= {"Barney"};
	};
};

class CfgFunctions
{
	class MAIN_Server
	{
		tag = "valor";

		class functions
		{
			file = "\data_server\main";
			class db_sync {};
			class logToDB {};
			class player_data_request {};
			class vars {};
			class mresArray {};
			class mresString {};
			class mToArray {};
			class numbersafe {};
			class bool {};
			class step_update_DB {};
			class clientDisconnect {};
			class syncPlayerToDB_server {};
			class insert_player {};
			class time_module {ext = ".fsm";};
			// persistent Vehicles start
			class getVehicleCargo {};
			class getVehicleDamage {};
			class getVehiclePosandFuel {};
			class insert_vehicle {};
			class loadVehicleCargo {};
			class setVehicleDamage {};
			class persistent_vehicle_monitoring {ext = ".fsm";};
			class zombie_destroyer {ext = ".fsm";};
			class saveVehicleComplete {};
			class vehicleDelete {};
			// persistent Vehicles end
			class insert_vehicleprice {};
			class insert_cop_crate {};
			class update_cop_bankDB {};
			class insert_item_shop {};
			class insert_item_sell_price {};
		};

		class carshop
		{
			file = "\data_server\main\carshop";
			class shop_request {};
			class createvehicleshop {};
			class setvehicleinshop {};
			class shopvehiclereset {};
		};

		class Item_shop
		{
			file = "\data_server\main\item_shop";
			class Itemshop_request {};
			class update_item_stock {};
			class Itemshop_sellprice_request {};
			class incrementStock {};
			class insert_item_sell_price {};
		};

		class bases
		{
			file = "\data_server\main\bases";
			class insert_base {};
			class savecrate {};
			class build_base {};
			class build_base_objects {};
			class insert_raptor {};
		};

		class outposts
		{
			file = "\data_server\main\outposts";
			class changeOutpostStatus {};
		};

		class init
		{
			file = "\data_server\main\init";
			class init_vehicles {};
			class init_bases {};
			class initServer {postinit = 1;};
			class init_map {};
			class init_vars {};
			class init_outposts {};
			class init_fuelstations {};
		};

		class groups
		{
			file= "\data_server\main\group";
			class syncGroupDB {};
		};

		class zombie_horde
		{
			file= "\data_server\main\zombie_horde";
			class zombie_horde_init {};
			class zombie_attack_event {};
			class set_outpost_destroyed {};
			class zombie_damage_EVH {};
			class zombie_monitoring_event_main {ext = ".fsm";};
			class zombieMonitoring_event {ext = ".fsm";};
		};

		class entities
		{
			file= "\data_server\main\entities";
			class raptorMonitoring_server {ext = ".fsm";};
			class raptorMonitoring_server_group {ext = ".fsm";};
		};
	};
};