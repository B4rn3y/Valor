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
	};
};


#include "Valor_Templates.hpp"










