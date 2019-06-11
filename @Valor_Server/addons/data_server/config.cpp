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
			class syncPlayerToDB {};
			class insert_player {};
			class time_module {ext = ".fsm";};
			// persistent Vehicles start
			class clear_vehicle {};
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
		};

		class carshop
		{
			file = "\data_server\main\carshop";
			class shop_request {};
			class createvehicleshop {};
			class setvehicleinshop {};
			class shopvehiclereset {};
		};

		class bases
		{
			file = "\data_server\main\bases";
			class insert_base {};
			class savecrate {};
			class build_base {};
			class build_base_objects {};
		};

		class init
		{
			file = "\data_server\main\init";
			class init_vehicles {};
			class init_bases {};
			class initServer {postinit = 1;};
			class init_map {};
		};

		class groups
		{
			file= "\data_server\main\group";
			class syncGroupDB {};
		};
	};
};