class DefaultEventhandlers;
class CfgPatches
{
	class UIs
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "UIs.pbo";
		author[]= {"Barney"};
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


		};

		class LoadingScreen
		{
			file = "\UIs\UI_functions\LoadingScreen";
			class closeLoadingScreen {};
			class openLoadingScreen {};


		};
	};
};


#include "Valor_Templates.hpp"
#include "Dialogs.hpp"
#include "Displays.hpp"








