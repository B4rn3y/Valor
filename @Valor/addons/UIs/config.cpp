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

		class carshop
		{
			file = "\UIs\UI_functions\carshop";
			class fillshop {};
			class onLBChange {};
			class opencarshop {};
			class buyvehiclefinish {};
			class buyvehicle {};
		};
	};
};


#include "Valor_Templates.hpp"
#include "Dialogs.hpp"
#include "Displays.hpp"








