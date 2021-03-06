class CfgPatches {
	class Uis {
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

		class SpawnMenu
		{
			file = "\UIs\UI_functions\SpawnMenu";
			class openSpawnMenu {};
			class setMapPosition {};
			class spawn {};
			class spawnMenuEVH {};


		};

		class LoadingScreen
		{
			file = "\UIs\UI_functions\LoadingScreen";
			class closeLoadingScreen {};
			class openLoadingScreen {};
			class updateLoadingScreen {};
		};

		class bank_menu
		{
			file = "\UIs\UI_functions\bank_menu";
			class bank_menu_transfer_money {};
			class open_bank_menu {};
		};

		class quest
		{
			file = "\UIs\UI_functions\quest";
			class openQuestMenu {};
			class acceptQuest {};
		};

		class item_shop
		{
			file = "\UIs\UI_functions\Item_Shop";
			class fillItemShop {};
			class openItemShop {};
			class ItemShop_lb_changed {};
			class update_item_stock_client {};
			class ItemShop_buy {};
		};

		class sell_player_items
		{
			file = "\UIs\UI_functions\sell_player_items";
			class fill_sell_player_items_menu {};
			class open_sell_player_items_menu {};
			class TreeSelChanged_sell_player_items_menu {};
			class sell_player_items_menu {};
		};

		class sell_veh_items
		{
			file = "\UIs\UI_functions\sell_vehicle_items";
			class fill_sell_vehicle_items_menu {};
			class open_sell_vehicle_items_menu {};
			class sell_vehicle_items_menu {};
		};

		class interaction
		{
			file = "\UIs\UI_functions\interaction";
			class openinteractionmenu {};
			class putAnimalInVehicle {};
			class pullAnimalsOutVehicle {};
		};

		class HUD
		{
			file = "\UIs\UI_functions\HUD";
			class setupHUD {};
			class updateHUD {};
			class deleteHUD {};
			class showProgressHUD {};
		};

		class ticket
		{
			file = "\UIs\UI_functions\ticket";
			class ticketDialog {};
			class ticketAction {};
			class payticket {};
		};

		class key_g
		{
			file = "\UIs\UI_functions\key_menu";
			class give_key_menu {};
			class open_key_menu {};
		};

		class base_entry
		{
			file = "\UIs\UI_functions\base_entry";
			class add_group_entry_list {};
			class add_player_entry_list {};
			class open_base_entry {};
			class remove_from_entry_list {};
		};

		class carshop
		{
			file = "\UIs\UI_functions\carshop";
			class fillshop {};
			class onLBChange {};
			class opencarshop {};
			class buyvehiclefinish {};
			class buyvehicle {};
		};

		class groupMenu
		{
			file = "\UIs\UI_functions\group";
			class changeRank {};
			class createGang {};
			class deleteGang {};
			class getGroupMembers {};
			class getGroupRank {};
			class invite_player {};
			class kick {};
			class leaveGang {};
			class opengroupmenu {};
			class player_invited {};
			class setNewLeader {};
			class syncGroup {};
			class getActiveGroups {};
			class give_Group_Properties {};
			class get_money {};
			class give_money_to_player {};
		};

		class info
		{
			file = "\UIs\UI_functions\info";
			class openinfomenu {};
			class info_onLBChanged {};
		};

		class humanity
		{
			file = "\UIs\UI_functions\humanity";
			class openHumanityMenu {};
		};

		class classes
		{
			file = "\UIs\UI_functions\class";
			class openclassmenu {};
			class selectClass {};
			class unlockClassSlot {};
			class updateclassmenu {};
		};

		class skills
		{
			file = "\UIs\UI_functions\skills";
			class openskillmenu {};
			class skill_menu_TreeSelChanged {};
		};

		class applications
		{
			file = "\UIs\UI_functions\applications";
			class openapplicationsmenu {};
			class applications_onLBChanged {};
			class apply {};
			class fillapplicationsmenu {};
			class show_application_response {};
			class accept_application {};
			class cop_level_update {};
		};
	};

};


#include "Valor_Templates.hpp"
#include "Dialogs.hpp"
#include "Displays.hpp"








