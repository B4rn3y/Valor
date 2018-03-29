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
		};

		class quest
		{
			file = "\UIs\UI_functions\quest";
			class openQuestMenu {};
			class acceptQuest {};


		};
	};
};


#include "Valor_Templates.hpp"
#include "Dialogs.hpp"
#include "Displays.hpp"








