

class valor_screen {
	idd = 2001;
	duration = 10e10;
    fadein = 0;
    fadeout = 0;
	name= "valor_screen";
	onload = "    uiNamespace setvariable['valor_screen',_this select 0];    ";
	movingEnable = false;
	enableSimulation = true;
	objects[] = {};

	class controlsBackground {
		class THE_SCREEN: valor_rscpicture
		{
			idc = -1;
			text = "UIs\textures\loadscreen.jpg";

 			x = safezoneX;
 			y = (safezoneH+safeZoneY)/2 - safezoneH;
 			w = safezoneW;
 			h = safezoneW / safeZoneH * safezoneW;

			/*
			x = -0.00520938 * safezoneW + safezoneX;
			y = -0.00379999 * safezoneH + safezoneY;
			//w = 1.00635 * safezoneW;
			//h = 1.00593 * safezoneH;
			w = 1.00635 * safezoneW;
			h = 1.00635 * safezoneW;
			*/
		};
	};

	class controls {
		class str_text: valor_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.346211 * safezoneW + safezoneX;
			y = 0.776741 * safezoneH + safezoneY;
			w = 0.309063 * safezoneW;
			h = 0.217963 * safezoneH;
		};

	};
};