

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
			x = 0.874999 * safezoneW + safezoneX;
			y = 0.965742 * safezoneH + safezoneY;
			w = 0.120417 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
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
			colorText[] = { 1 , 1 , 1 , 1 };
		};

	};
};

