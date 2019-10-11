class CfgPatches
{
	class valor_lightbar
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
	class NonStrategic;
	class valor_lightbar: NonStrategic{
		scope = 2;
		displayname = "lightbar";
		model="\greyzone\lightbar\bar.p3d";
		class AnimationSources
		{
			class scale_source
			{
				source="user";
				initPhase=0;
				animPeriod=1;
				sound="GenericDoorsSound";
			};
		};
	};
	class valor_bumper: NonStrategic{
		scope = 2;
		displayname = "bumper";
		model="\a3\soft_f\offroad_01\bumper_2_f.p3d";
	};
};