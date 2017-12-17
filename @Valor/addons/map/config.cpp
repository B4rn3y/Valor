class CfgPatches
{
	class ChernarusReduxValor
	{
		units[]=
		{
			"ChernarusRedux"
		};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Map_Altis"
		};
	};
};
class CfgWorlds
{
	class CAWorld;
	class ChernarusRedux: CAWorld
	{
		description="ChernarusReduxValor";
		class Sea
		{
			MaxTide=8;
		};
	};
};

