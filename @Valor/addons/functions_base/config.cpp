class DefaultEventhandlers;
class CfgPatches
{
	class data
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

