

class valor_HUD {
	idd = 2202;
	duration = 10e10;
    fadein = 0;
    fadeout = 0;
	name= "valor_HUD";
	onload = "uiNamespace setvariable['valor_HUD',_this select 0];";
	objects[] = {};

	class controlsBackground {


		class Progressbar: valor_RscProgress
		{
			idc = 1100;
			colorFrame[] = {1, 1, 1, 1};
       		colorBar[] = {1,0.502,0,1};
			//colorBar[] = {1, 1, 1, 1};
			x = 0.874999 * safezoneW + safezoneX;
			y = 0.965742 * safezoneH + safezoneY;
			w = 0.120417 * safezoneW;
			h = 0.0235185 * safezoneH;
		};

		class border_hunger: valor_RscPicture
		{
			idc = 1200;
			text = "\UIs\textures\HUD\status_food_border_CA.paa";
			x = 0.960547 * safezoneW + safezoneX;
			y = 0.851482 * safezoneH + safezoneY;
			w = 0.0375781 * safezoneW;
			h = 0.0559259 * safezoneH;
		};
		class hunger_inside_pic: valor_RscPicture
		{
			idc = 1201;
			text = "\UIs\textures\HUD\status_food_inside_4_ca.paa";
			x = 0.959765 * safezoneW + safezoneX;
			y = 0.848704 * safezoneH + safezoneY;
			w = 0.0391405 * safezoneW;
			h = 0.0605556 * safezoneH;
		};
		class pic_border_thirst: valor_RscPicture
		{
			idc = 1202;
			text = "\UIs\textures\HUD\status_thirst_border_CA.paa";
			x = 0.957108 * safezoneW + safezoneX;
			y = 0.795925 * safezoneH + safezoneY;
			w = 0.0407031 * safezoneW;
			h = 0.0614814 * safezoneH;
		};
		class pic_thirst_inside: valor_RscPicture
		{
			idc = 1203;
			text = "\UIs\textures\HUD\status_thirst_inside_4_ca.paa";
			x = 0.955157 * safezoneW + safezoneX;
			y = 0.793149 * safezoneH + safezoneY;
			w = 0.0442187 * safezoneW;
			h = 0.066111 * safezoneH;
		};
		class radiation_pic: valor_RscPicture
		{
			idc = 1204;
			text = "\UIs\textures\HUD\radiation_100.paa";
			x = 0.963283 * safezoneW + safezoneX;
			y = 0.752852 * safezoneH + safezoneY;
			w = 0.0297656 * safezoneW;
			h = 0.0383335 * safezoneH;
		};
		class health_pic: valor_RscPicture
		{
			idc = 1205;
			text = "\UIs\textures\HUD\health_5.paa";
			x = 0.966015 * safezoneW + safezoneX;
			y = 0.912963 * safezoneH + safezoneY;
			w = 0.0293749 * safezoneW;
			h = 0.0448147 * safezoneH;
		};
		/*
		class humanity: valor_RscPicture
		{
			idc = 1206;
			text = "\UIs\textures\HUD\humanity_hero_1_HUD.paa";
			x = 0.908594 * safezoneW + safezoneX;
			y = 0.13704 * safezoneH + safezoneY;
			w = 0.0899209 * safezoneW;
			h = 0.130922 * safezoneH;
		};
		*/
	};

	class controls {


		class text_inside_Progressbar: valor_RscStructuredText
		{
			idc = 1099;
			text = "";
			x = 0.874999 * safezoneW + safezoneX;
			y = 0.965742 * safezoneH + safezoneY;
			w = 0.120417 * safezoneW;
			h = 0.0235185 * safezoneH;
		};

		class LVL_Display: valor_RscStructuredText
		{
			idc = 1101;
			text = "";
			x = 0.840625 * safezoneW + safezoneX;
			y = 0.965741 * safezoneH + safezoneY;
			w = 0.0339585 * safezoneW;
			h = 0.0235185 * safezoneH;
			colorBackground[]={0,0,0,0};
		};

	};
};

