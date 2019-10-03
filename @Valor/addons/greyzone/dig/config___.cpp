class CfgPatches
{
	class valor_digger
	{
		requiredAddons[]=
		{
			"A3_Armor_F_Gamma"
		};
		requiredVersion=0.1;
		units[]={"valor_digger"};
		weapons[]={};
	};
};

class CfgVehicles
{
	class MBT_01_base_F;
	class valor_digger: MBT_01_base_F
	{
		scope=2;
		side=2;
		displayName="digger (working)";
		fuelCapacity=100;
		maxSpeed=30;
		model="\greyzone\dig\digger_.p3d";
		editorPreview="\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Land_Excavator_01_abandoned_F.jpg";

		class Wheels
		{
			class L2
			{
				side="left";
				suspTravelDirection[]={-0.125,-1,0};
				boneName="wheel_podkoloL1";
				center="wheel_1_2_axis";
				boundary="wheel_1_2_bound";
				steering=0;
				width=0.5;
				mass=150;
				MOI=33.452999;
				dampingRate=590;
				dampingRateInAir=590;
				dampingRateDestroyed=3400;
				maxDroop=0.18000001;
				maxCompression=0.18000001;
				sprungMass=-1;
				springStrength=350000;
				springDamperRate=15514;
				maxBrakeTorque=23000;
				latStiffX=2;
				latStiffY=33;
				longitudinalStiffnessPerUnitGravity=10000;
				frictionVsSlipGraph[]=
				{
					{0,0.55000001},
					{0.30000001,1.28},
					{0.64999998,0.55000001}
				};
			};
			class L3: L2
			{
				boneName="wheel_podkolol2";
				center="wheel_1_3_axis";
				boundary="wheel_1_3_bound";
			};
			class L4: L2
			{
				boneName="wheel_podkolol3";
				center="wheel_1_4_axis";
				boundary="wheel_1_4_bound";
			};
			class L5: L2
			{
				boneName="wheel_podkolol4";
				center="wheel_1_5_axis";
				boundary="wheel_1_5_bound";
			};
			class L6: L2
			{
				boneName="wheel_podkolol5";
				center="wheel_1_6_axis";
				boundary="wheel_1_6_bound";
			};
			class L7: L2
			{
				boneName="wheel_podkolol6";
				center="wheel_1_7_axis";
				boundary="wheel_1_7_bound";
			};
			class L9: L2
			{
				boneName="wheel_podkolol9";
				center="wheel_1_9_axis";
				boundary="wheel_1_9_bound";
				maxDroop=0;
				maxCompression=0;
			};
			class L1: L2
			{
				boneName="";
				center="wheel_1_1_axis";
				boundary="wheel_1_1_bound";
				maxDroop=0;
				maxCompression=0;
			};
			class R2: L2
			{
				side="right";
				suspTravelDirection[]={0.125,-1,0};
				boneName="wheel_podkolop1";
				center="wheel_2_2_axis";
				boundary="wheel_2_2_bound";
			};
			class R3: R2
			{
				boneName="wheel_podkolop2";
				center="wheel_2_3_axis";
				boundary="wheel_2_3_bound";
			};
			class R4: R2
			{
				boneName="wheel_podkolop3";
				center="wheel_2_4_axis";
				boundary="wheel_2_4_bound";
			};
			class R5: R2
			{
				boneName="wheel_podkolop4";
				center="wheel_2_5_axis";
				boundary="wheel_2_5_bound";
			};
			class R6: R2
			{
				boneName="wheel_podkolop5";
				center="wheel_2_6_axis";
				boundary="wheel_2_6_bound";
			};
			class R7: R2
			{
				boneName="wheel_podkolop6";
				center="wheel_2_7_axis";
				boundary="wheel_2_7_bound";
			};
			class R9: R2
			{
				boneName="wheel_podkolop9";
				center="wheel_2_9_axis";
				boundary="wheel_2_9_bound";
				maxDroop=0;
				maxCompression=0;
			};
			class R1: R2
			{
				boneName="";
				center="wheel_2_1_axis";
				boundary="wheel_2_1_bound";
				maxDroop=0;
				maxCompression=0;
			};
		};
		class MFD{};
		class HitPoints{};
		class compartmentsLights{};
		class Turrets{};
		class Damage{};
	};
};