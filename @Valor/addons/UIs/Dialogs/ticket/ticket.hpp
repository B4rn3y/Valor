class ticket {
	idd = 3006;
	name= "ticket";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class main_background: valor_RscText {
			colorBackground[] = {0, 0, 0, 0.7};

			idc = -1;
			x = 0.30303;
			y = 0.400673;
			w = 0.39798;
			h = 0.0848485;
		};

		class Header :valor_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 1000;
			x = 0.30303;
			y = 0.377104;
			w = 0.39798;
			h = 0.0242425;
		};
	};

	class controls {


		class close_BTN: valor_RscButtonMenu
		{
			idc = 2401;
			text = "close"; //--- ToDo: Localize;
			onButtonClick = "closedialog 0;";
			x = 0.609848;
			y = 0.484849;
			w = 0.0911617;
			h = 0.0427608;
		};

		class btn_ticket: valor_RscButtonMenu
		{
			idc = 2400;
			text = "ticket"; //--- ToDo: Localize;
			onButtonClick = "closedialog 0;";
			x = 0.30303;
			y = 0.483165;
			w = 0.0911617;
			h = 0.0427608;
		};

		class edit_money: valor_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.308081;
			y = 0.410774;
			w = 0.387878;
			h = 0.062963;
		};


	};
};