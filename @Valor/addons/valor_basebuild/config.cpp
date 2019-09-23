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
	class Land_ds_HouseV_3I1;
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
	class valor_baseFloor25: valor_baseFloor10
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
	class valor_baseFloor30: valor_baseFloor10
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
	class valor_baseFloor40: valor_baseFloor10
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
	class valor_baseFloor45: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_45m.p3d";
		displayName="Base Floor 45m";
	};
	class valor_baseFloor50: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_50m.p3d";
		displayName="Base Floor 50m";
	};
	class valor_baseFloor55: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_55m.p3d";
		displayName="Base Floor 55m";
	};
	class valor_baseFloor60: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_60m.p3d";
		displayName="Base Floor 60m";
	};
	class valor_baseFloor16x17: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_16_17.p3d";
		displayName="Base Floor 16x17";
	};
	class valor_baseFloor15_5x20: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_15-5_20.p3d";
		displayName="Base Floor 15.5x20";
	};
	class valor_baseFloor8x15: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_8_15.p3d";
		displayName="Base Floor 8x15";
	};
	class valor_baseFloor11x12_5: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_11_12-5.p3d";
		displayName="Base Floor 11x12.5";
	};
	class valor_baseFloor8_5x14: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_8-5_14.p3d";
		displayName="Base Floor 8.5x14";
	};
	class valor_baseFloor7x13: valor_baseFloor10
	{
		scope=2;
		model="\valor_basebuild\models\stronghold_base_7_13.p3d";
		displayName="Base Floor 7x13";
	};
	class valor_piano: Items_base_F
	{
		scope=2;
		model="\valor_basebuild\models\piano.p3d";
		displayName="Piano";
	};

	// ------------------------------------------ Houses ---------------------------------------

	class valor_Land_ds_HouseV_3I1 : Land_ds_HouseV_3I1
	{
		scope = 2;
		displayName="Land_ds_HouseV_3I1 (Lockable)";
		class UserActions
		{
			class OpenDoors1
			{
				displayNameDefault="$STR_DN_OUT_O_DOOR_DEFAULT";
				displayName="$STR_DN_OUT_O_DOOR";
				position="Door_1_trigger";
				actionNamedSel="Door_1";
				radius=1.5;
				aiMaxRange=5.25;
				onlyForPlayer=0;
				condition="this animationPhase ""Door_1"" < 0.5";
				statement="if(this getVariable [""bis_disabled_Door_1"",0] != 1)then{this animate [""Door_1"", 1];};";
			};
			class CloseDoors1: OpenDoors1
			{
				displayNameDefault="$STR_DN_OUT_C_DOOR_DEFAULT";
				displayName="$STR_DN_OUT_C_DOOR";
				condition="this animationPhase ""Door_1"" >= 0.5";
				statement="this animate [""Door_1"", 0]";
			};
			class OpenDoors2: OpenDoors1
			{
				position="Door_2_trigger";
				actionNamedSel="Door_2";
				condition="this animationPhase ""Door_2"" < 0.5";
				statement="if(this getVariable [""bis_disabled_Door_2"",0] != 1)then{this animate [""Door_2"", 1];};";
			};
			class CloseDoors2: CloseDoors1
			{
				position="Door_2_trigger";
				actionNamedSel="Door_2";
				condition="this animationPhase ""Door_2"" >= 0.5";
				statement="this animate [""Door_2"", 0]";
			};
			class OpenDoors3: OpenDoors1
			{
				position="Door_3_trigger";
				actionNamedSel="Door_3";
				condition="this animationPhase ""Door_3"" < 0.5";
				statement="if(this getVariable [""bis_disabled_Door_3"",0] != 1)then{this animate [""Door_3"", 1];};";
			};
			class CloseDoors3: CloseDoors1
			{
				position="Door_3_trigger";
				actionNamedSel="Door_3";
				condition="this animationPhase ""Door_3"" >= 0.5";
				statement="this animate [""Door_3"", 0]";
			};
			class OpenDoors4: OpenDoors1
			{
				position="Door_4_trigger";
				actionNamedSel="Door_4";
				condition="this animationPhase ""Door_4"" < 0.5";
				statement="if(this getVariable [""bis_disabled_Door_4"",0] != 1)then{this animate [""Door_4"", 1];};";
			};
			class CloseDoors4: CloseDoors1
			{
				position="Door_4_trigger";
				actionNamedSel="Door_4";
				condition="this animationPhase ""Door_4"" >= 0.5";
				statement="this animate [""Door_4"", 0]";
			};
		};
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