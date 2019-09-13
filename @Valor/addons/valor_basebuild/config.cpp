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
	class House_Small_F;
	class valor_drawBridge: House_Small_F
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
				sound="RoadGateDoors";
			};
		};
	};
	class valor_baseFloor10: House_Small_F
	{
		scope=2;
		author="Bloodwyn";
		model="\valor_basebuild\models\stronghold_base_10m.p3d";
		displayName="Base Floor 10m";
		vehicleClass="Objects";
		armor=20000;
		icon="iconObject";
		mapSize=1;
	};
	class valor_baseFloor25: House_Small_F
	{
		scope=2;
		author="Bloodwyn";
		model="\valor_basebuild\models\stronghold_base_25m.p3d";
		displayName="Base Floor 25m";
		vehicleClass="Objects";
		armor=20000;
		icon="iconObject";
		mapSize=1;
	};
	class valor_baseFloor30: House_Small_F
	{
		scope=2;
		author="Bloodwyn";
		model="\valor_basebuild\models\stronghold_base_30m.p3d";
		displayName="Base Floor 30m";
		vehicleClass="Objects";
		armor=20000;
		icon="iconObject";
		mapSize=1;
	};
	class valor_baseFloor40: House_Small_F
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
	class valor_baseFloor45: House_Small_F
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_45m.p3d";
		displayName="Base Floor 45m";
	};
	class valor_baseFloor50: House_Small_F
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_50m.p3d";
		displayName="Base Floor 50m";
	};
	class valor_baseFloor55: House_Small_F
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_55m.p3d";
		displayName="Base Floor 55m";
	};
	class valor_baseFloor60: House_Small_F
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_60m.p3d";
		displayName="Base Floor 60m";
	};
	class valor_piano: Items_base_F
	{
		scope=2;
		model="\valor_basebuild\models\piano.p3d";
		displayName="Piano";
	};
};

class CfgSounds
{
	sounds[] = {};

	class piano
	{
		name = "piano";
		sound[] = {"valor_basebuild\crash.ogg", 1, 1,180};
		titles[] = {};
	};
};