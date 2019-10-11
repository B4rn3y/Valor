class applications {
	idd = 3009;
	name= "applications";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class background_main: valor_RscText
		{
			idc = 1000;
			x = -0.00176758;
			y = 0.0456566;
			w = 1.00088;
			h = 0.79165;
			colorBackground[] = {0,0,0,0.7};
		};
		class header: valor_RscText
		{
			idc = 1001;
			x = -0.000126153;
			y = 0.00309762;
			w = 1.00025;
			h = 0.0444444;
			colorBackground[] = {1,0.502,0,1};
		};

	};

	class controls {

		class member_listbox: valor_RscListbox
		{
			idc = 1500;
			sizeEx = 0.040;
			onLBselChanged = "[] call valor_fnc_applications_onLBChanged;";
			x = 0.00252485;
			y = 0.0521883;
			w = 0.266666;
			h = 0.780136;
		};
		class str_text_playtime: valor_RscStructuredText
		{
			idc = 1100;
			x = 0.27399;
			y = 0.0522559;
			w = 0.721211;
			h = 0.781818;
		};
		class btn_close: valor_RscButtonMenu
		{
			idc = 2407;
			text = "Close"; //--- ToDo: Localize;
			onbuttonClick = "closedialog 0;";
			x = -0.00126261;
			y = 0.838384;
			w = 0.102525;
			h = 0.0444445;
		};
		class BTN_ACCEPT: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Accept"; //--- ToDo: Localize;
			onbuttonClick = "[true] spawn valor_fnc_accept_application;";
			x = 0.897727;
			y = 0.838384;
			w = 0.102525;
			h = 0.0444445;
		};
		class btn_decline: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Decline"; //--- ToDo: Localize;
			onbuttonClick = "[false] spawn valor_fnc_accept_application;";
			x = 0.790404;
			y = 0.838384;
			w = 0.106313;
			h = 0.0444445;
		};
		class edit_level: valor_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.741;
			y = 0.8384;
			w = 0.154293;
			h = 0.0494948;
		};
		class BTN_SET: valor_RscButtonMenu
		{
			idc = 2402;
			text = "Set"; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_cop_level_update;";
			x = 0.897727;
			y = 0.838384;
			w = 0.102525;
			h = 0.0478115;
		};
	};
};