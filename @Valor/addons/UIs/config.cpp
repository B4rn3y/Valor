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
			class openItemSellMenu {};
			class fillItemShop_sell {};
			class ItemShop_sell {};
			class switchItemShop {};
		};

		class interaction
		{
			file = "\UIs\UI_functions\interaction";
			class openinteractionmenu {};
		};

		class ticket
		{
			file = "\UIs\UI_functions\ticket";
			class ticketDialog {};
			class ticketAction {};
			class payticket {};
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
		};

		class info
		{
			file = "\UIs\UI_functions\info";
			class openinfomenu {};
			class info_onLBChanged {};
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








