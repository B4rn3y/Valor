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
	class valor_baseFloor40: Items_base_F
	{
		scope=2;
		author="Bloodwyn";
		model="\valor_basebuild\models\stronghold_base_40m.p3d";
		displayName="Base Floor 40m";
		vehicleClass="Objects";
		armor=20000;
		icon="iconObject";
		mapSize=1;
	};
	class valor_baseFloor45: valor_baseFloor40
	{
		model="\valor_basebuild\models\stronghold_base_45m.p3d";
		displayName="Base Floor 45m";
	};
	class valor_baseFloor50: valor_baseFloor45
	{
		model="\valor_basebuild\models\stronghold_base_50m.p3d";
		displayName="Base Floor 50m";
	};
	class valor_baseFloor55: valor_baseFloor45
	{
		model="\valor_basebuild\models\stronghold_base_55m.p3d";
		displayName="Base Floor 55m";
	};
	class valor_baseFloor60: valor_baseFloor45
	{
		model="\valor_basebuild\models\stronghold_base_60m.p3d";
		displayName="Base Floor 60m";
	};
};