class LoadingScreen {
	idd = 1337;
	name= "LoadingScreen";
	onload = "uinamepespace setvariable['LoadingScreen',_this select 0]";
	movingEnable = false;
	enableSimulation = true;
	objects[] = {};

	class controlsBackground {
		class THE_SCREEN: valor_rscpicture
		{
			idc = -1;
			text = "UIs\textures\loadscreen.paa";
			x = 0.00108123 * safezoneW + safezoneX;
			y = -5.99921e-005 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.001 * safezoneH;
		};
	};

	class controls {};
};