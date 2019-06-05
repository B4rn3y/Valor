class CfgPatches
{
	class valor_basebuild
	{
		units[]=
		{
		};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
		};
	};
};
class CfgVehicles
{
	class Items_base_F;
	class valor_drawBridge: Items_base_F
	{
		scope=2;
		author="Bloodwyn";
		model="\valor_basebuild\models\drawBridge.p3d";
		displayName="WIP drawbridge";
		vehicleClass="Objects";
		armor=20000;
		icon="iconObject";
		mapSize=0.69999999;
		accuracy=0.2;
		class AnimationSources
		{
			class draw_source
			{
				source="user";
				initPhase=0;
				animPeriod=6;
				sound="";
			};
		};
	};
};







