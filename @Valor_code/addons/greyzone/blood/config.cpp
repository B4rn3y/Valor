class CfgPatches
{
	class valor_blood
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]={};
	};
};

class CfgSounds
{
	class blood_attack_0
	{
	  	name = "blood_attack_0";
	  	sound[] = {"\greyzone\blood\sound\attack_0.ogg",6,1,500,1,0.0,0.0,0.0};
	  	titles[] = {};
	};
	class blood_attack_1 : blood_attack_0
	{
	  	name = "blood_attack_1";
	  	sound[] = {"\greyzone\blood\sound\attack_1.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_attack_3 : blood_attack_0
	{
	  	name = "blood_attack_3";
	  	sound[] = {"\greyzone\blood\sound\attack_3.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_attack_hit_3 : blood_attack_0
	{
	  	name = "blood_attack_hit_3";
	  	sound[] = {"\greyzone\blood\sound\attack_hit_3.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_die_0 : blood_attack_0
	{
	  	name = "blood_die_0";
	  	sound[] = {"\greyzone\blood\sound\die_0.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_die_1 : blood_attack_0
	{
	  	name = "blood_die_1";
	  	sound[] = {"\greyzone\blood\sound\die_1.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_die_2 : blood_attack_0
	{
	  	name = "blood_die_2";
	  	sound[] = {"\greyzone\blood\sound\die_2.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_die_3 : blood_attack_0
	{
	  	name = "blood_die_3";
	  	sound[] = {"\greyzone\blood\sound\die_3.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_die_4 : blood_attack_0
	{
	  	name = "blood_die_4";
	  	sound[] = {"\greyzone\blood\sound\die_4.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_distant_1 : blood_attack_0
	{
	  	name = "blood_distant_1";
	  	sound[] = {"\greyzone\blood\sound\distant_1.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_distant_2 : blood_attack_0
	{
	  	name = "blood_distant_2";
	  	sound[] = {"\greyzone\blood\sound\distant_2.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_distant_3 : blood_attack_0
	{
	  	name = "blood_distant_3";
	  	sound[] = {"\greyzone\blood\sound\distant_3.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_hit_0 : blood_attack_0
	{
	  	name = "blood_hit_0";
	  	sound[] = {"\greyzone\blood\sound\hit_0.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_hit_1 : blood_attack_0
	{
	  	name = "blood_hit_1";
	  	sound[] = {"\greyzone\blood\sound\hit_1.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_hit_2 : blood_attack_0
	{
	  	name = "blood_hit_2";
	  	sound[] = {"\greyzone\blood\sound\hit_2.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_hit_5 : blood_attack_0
	{
	  	name = "blood_hit_5";
	  	sound[] = {"\greyzone\blood\sound\hit_5.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_hit_6 : blood_attack_0
	{
	  	name = "blood_hit_6";
	  	sound[] = {"\greyzone\blood\sound\hit_6.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_idle_0 : blood_attack_0
	{
	  	name = "blood_idle_0";
	  	sound[] = {"\greyzone\blood\sound\idle_0.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_idle_1 : blood_attack_0
	{
	  	name = "blood_idle_1";
	  	sound[] = {"\greyzone\blood\sound\idle_1.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_idle_2 : blood_attack_0
	{
	  	name = "blood_idle_2";
	  	sound[] = {"\greyzone\blood\sound\idle_2.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_idle_3 : blood_attack_0
	{
	  	name = "blood_idle_3";
	  	sound[] = {"\greyzone\blood\sound\idle_3.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_idle_4 : blood_attack_0
	{
	  	name = "blood_idle_4";
	  	sound[] = {"\greyzone\blood\sound\idle_4.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_idle_5 : blood_attack_0
	{
	  	name = "blood_idle_5";
	  	sound[] = {"\greyzone\blood\sound\idle_5.ogg",6,1,500,1,0.0,0.0,0.0};
	};
	class blood_invisible : blood_attack_0
	{
	  	name = "blood_invisible";
	  	sound[] = {"\greyzone\blood\sound\invisible.ogg",6,1,500,1,0.0,0.0,0.0};
	};
};

class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class HitPoints
		{
			class HitHead;
			class HitBody;
			class HitHands;
			class HitLegs;
		};
	};

	class SoldierWB: CAManBase
	{
		threat[] = {1, 0.1, 0.1};
	};

	class Test_Soldier_base_F: SoldierWB
	{
		faceType = Man_A3; /// this soldier is going to use standard faces
		side = 1; /// that means BLUFOR
		faction = BLU_F; /// Standard NATO faction
		genericNames = "NATOMen"; /// Standard names for lads of NATO (and European civils)
		vehicleClass = Men; /// Should be listed under Men

		scope = 0; /// base class should not be visible in editor
		class Wounds /// changes material of skin according to damage
		{
			tex[] = {};
			mat[] = {
				"A3\Characters_F\Common\Data\basicbody.rvmat", 			/// what material is changed
				"A3\Characters_F\Common\Data\basicbody_injury.rvmat",	/// how does the material look like in damage 0.5 and more
				"A3\Characters_F\Common\Data\basicbody_injury.rvmat",	/// how does the material look like while the part has damage 1

				"A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat",			/// next materials are used through personality of the soldier
				"A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat",
				"A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat",

				"A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat",
				"A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat",
				"A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat",

				"A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat",
				"A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat",
				"A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat",

				"A3\Characters_F\Heads\Data\hl_white_old.rvmat",
				"A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat",
				"A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat",

				"A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat",
				"A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat",
				"A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"
			};
		};

		model 			= "\Samples_f\Test_Character_01\A3_character_example.p3d"; /// path to model
		modelSides[] 	= {1,2,3}; 				/// what sides could use this uniform, means civilians and BLUFOR can use it
		nakedUniform 	= "U_BasicBody";		/// what "uniform" does this soldier use without any other uniform
		//uniformClass 	= "U_Test_uniform";		/// standard uniform used by this soldier, there is a special one defined later
		camouflage		= 1.4; 					/// how easy is to spot soldier -> bigger means better spotable, used by uniform


		class HitPoints
		{
			class HitFace
			{
				armor               = 1; // coefficient of the total armor defined below for the whole object
				material            = -1; // damage material (-1 means "unused")
				name                = "face_hub"; // selection name from hit points LOD in object
				passThrough         = 0.1; // coefficient defining how much damage will pass into total damage when this hit point is damaged
				radius              = 0.08; // size of the hit point sphere, this is how it works: https://community.bistudio.com/wiki/Arma_3_Damage_Description
				explosionShielding  = 0.1; // multiplier of explosive damage (parameter: explosive > 0 in ammunition type)
				minimalHit          = 0.01; // minimal damage value that can be applied, damage below this threshold is ignored
			};
			class HitNeck: HitFace
			{
				armor				= 1;
				material			= -1;
				name				= "neck";
				passThrough			= 0.1;
				radius				= 0.1;
				explosionShielding	= 0.5;
				minimalHit			= 0.01;
			};
			class HitHead: HitNeck
			{
				armor				= 1;
				material			= -1;
				name				= "head";
				passThrough			= 0.1;
				radius				= 0.2;
				explosionShielding	= 0.5;
				minimalHit			= 0.01;
				depends				= "HitFace max HitNeck"; // returns the greater of HitFace and HitNeck
			};
			class HitPelvis
			{
				armor				= 1;
				material			= -1;
				name				= "pelvis";
				passThrough			= 0.1;
				radius				= 0.2;
				explosionShielding	= 1;
				visual				= "injury_body";
				minimalHit			= 0.01;
			};
			class HitAbdomen: HitPelvis
			{
				armor				= 1;
				material			= -1;
				name				= "spine1";
				passThrough			= 0.1;
				radius				= 0.15;
				explosionShielding	= 1;
				visual				= "injury_body";
				minimalHit			= 0.01;
			};
			class HitDiaphragm: HitAbdomen
			{
				armor				= 1;
				material			= -1;
				name				= "spine2";
				passThrough			= 0.1;
				radius				= 0.15;
				explosionShielding  = 6;
				visual				= "injury_body";
				minimalHit			= 0.01;
			};
			class HitChest: HitDiaphragm
			{
				armor				= 1;
				material			= -1;
				name				= "spine3";
				passThrough			= 0.1;
				radius				= 0.15;
				explosionShielding	= 6;
				visual				= "injury_body";
				minimalHit			= 0.01;
			};
			class HitBody: HitChest
			{
				armor				= 1000;
				material			= -1;
				name				= "body";
				passThrough			= 0.1;
				radius				= 0.16;
				explosionShielding	= 6;
				visual				= "injury_body";
				minimalHit			= 0.01;
				depends				= "HitPelvis max HitAbdomen max HitDiaphragm max HitChest"; // depends work only for hit points defined in inheritance chain
			};
			class HitArms
			{
				armor				= 1;
				material			= -1;
				name				= "arms";
				passThrough			= 1;
				radius				= 0.1;
				explosionShielding	= 1;
				visual				= "injury_hands";
				minimalHit			= 0.01;
			};
			class HitHands: HitArms
			{
				armor				= 1;
				material			= -1;
				name				= "hands";
				passThrough			= 1;
				radius				= 0.1;
				explosionShielding  = 1;
				visual				= "injury_hands";
				minimalHit			= 0.01;
				depends				= "HitArms";
			};
			class HitLegs
			{
				armor				= 1;
				material			= -1;
				name				= "legs";
				passThrough			= 1;
				radius				= 0.12;
				explosionShielding  = 1;
				visual				= "injury_legs";
				minimalHit			= 0.01;
			};
		};

		armor					= 2; // keep constant among various soldiers so that the hit points armor coefficients remains on the same scale
		armorStructural			= 0.4; // divide all damage taken to total hit point, either directly or through hit point passThrough coefficient, must be adjusted for each model to achieve consistent total damage results
		explosionShielding		= 0.04; // for consistent explosive damage after adjusting = ( armorStructural / 10 )
		minTotalDamageThreshold	= 0.001; // minimalHit for total damage
		impactDamageMultiplier	= 0.5; // multiplier for falling damage

		hiddenSelections[] = {"Camo", "insiginia"}; /// selection defined in sections of model that may have texture and materials changed by setObjectTexture or next parameter
		hiddenSelectionsTextures[] = {"\a3\characters_f\common\data\basicbody_grey_co.paa"}; /// what texture does this soldier use for camo selection
		hideProxySelections[] = {"ghillie_hide"}; /// names of selections hidden on proxies (used in vest in this case, see overlaySelectionsInfo[])
	};

	//Base class for BLUFOR soldiers
	class valor_bloodsucker: Test_Soldier_base_F
	{
		scope = 2;
		displayName = "Bloodsucker";
		side = 2;

		model="greyzone\blood\bloodsucker.p3d";
		modelSides[] 	= {1,2,3}; 				/// what sides could use this uniform, means civilians and BLUFOR can use it

		camouflage		= 0.1; 					/// how easy is to spot soldier -> bigger means better spotable, used by uniform

		armor					= 50; // keep constant among various soldiers so that the hit points armor coefficients remains on the same scale
		armorStructural			= 0.4; // divide all damage taken to total hit point, either directly or through hit point passThrough coefficient, must be adjusted for each model to achieve consistent total damage results
		explosionShielding		= 0.1; // for consistent explosive damage after adjusting = ( armorStructural / 10 )
		minTotalDamageThreshold	= 0.01; // minimalHit for total damage
		impactDamageMultiplier	= 0.01; // multiplier for falling damage

		hiddenSelections[] = {"invisible"}; /// selection defined in sections of model that may have texture and materials changed by setObjectTexture or next parameter
		hiddenSelectionsTextures[] = {"greyzone\blood\act_krovosos_new1.paa"}; /// what texture does this soldier use for camo selection
	};
};