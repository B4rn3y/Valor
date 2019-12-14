class CfgPatches
{
	class valor_animal
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]={"A3_Data_F"};
	};
};

class CfgVehicles
{
	class Sheep_random_F;
	class valor_Sheep_random_F: Sheep_random_F {
		maximumLoad = 30;
		class EventHandlers {
			//init = "(_this select 0) setVariable [""BIS_fnc_animalBehaviour_disable"", true]; (_this select 0) call bis_fnc_animalRandomization;"
			init = "(_this select 0) call bis_fnc_animalRandomization;"
		};
	};
	class Goat_random_F;
	class valor_Goat_random_F: Goat_random_F {
		maximumLoad = 30;
		class EventHandlers {
			//init = "(_this select 0) setVariable [""BIS_fnc_animalBehaviour_disable"", true]; (_this select 0) call bis_fnc_animalRandomization;"
			init = "(_this select 0) call bis_fnc_animalRandomization;"
		};
	};
	class Hen_random_F;
	class valor_Hen_random_F: Hen_random_F {
		maximumLoad = 30;
		class EventHandlers {
			//init = "(_this select 0) setVariable [""BIS_fnc_animalBehaviour_disable"", true]; (_this select 0) call bis_fnc_animalRandomization;"
			init = "(_this select 0) call bis_fnc_animalRandomization;"
		};
	};
};