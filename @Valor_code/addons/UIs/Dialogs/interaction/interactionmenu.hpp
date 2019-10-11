class interactionmenu {
	idd = 3005;
	name= "interactionmenu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class main_background: valor_RscText {
			colorBackground[] = {0, 0, 0, 0.7};

			idc = -1;
			x = 0.310606;
			y = 0.0690235;
			w = 0.376515;
			h = 0.887879;
		};

		class Header :valor_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 1000;
			x = 0.310605;
			y = 0.0218851;
			w = 0.376515;
			h = 0.0478115;
		};
	};

	class controls {


		class BTN_1: valor_RscButtonMenu
		{
			idc = 2400;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.320707;
			y = 0.0875421;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_2: valor_RscButtonMenu
		{
			idc = 2401;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.164983;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_3: valor_RscButtonMenu
		{
			idc = 2402;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.242424;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_4: valor_RscButtonMenu
		{
			idc = 2403;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.318182;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_5: valor_RscButtonMenu
		{
			idc = 2404;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.392256;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_6: valor_RscButtonMenu
		{
			idc = 2405;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.46633;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_7: valor_RscButtonMenu
		{
			idc = 2406;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.540404;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_8: valor_RscButtonMenu
		{
			idc = 2407;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.619529;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_9: valor_RscButtonMenu
		{
			idc = 2408;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.695286;
			w = 0.35505;
			h = 0.0629629;
		};
		class BTN_10: valor_RscButtonMenu
		{
			idc = 2409;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.32197;
			y = 0.771044;
			w = 0.35505;
			h = 0.0629629;
		};
		class close_btn: valor_RscButtonMenu
		{
			idc = 2410;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closedialog 0;";
			x = 0.310606;
			y = 0.883838;
			w = 0.376515;
			h = 0.0730639;
		};


	};
};