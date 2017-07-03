class DefaultEventhandlers;
class CfgPatches
{
	class functions_base
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "functions_base.pbo";
		author[]= {"Bloodwyn"};
	};
};

class CfgFunctions
{
	class MAIN
	{
		tag = "valor";

		class functions
		{
			file = "\functions_base";
			class nearplayers {};
			class inString {};
			class arrayWithNull {};
			class ArrayRemoveDoubles {};

		};
	};
};

