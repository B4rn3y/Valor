class carshop {
	idd = 3003;
	name= "carshop";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class main_background: valor_RscText
		{
			idc = 1000;
			x = -5.3747e-005 * safezoneW + safezoneX;
			y = 0.0370311 * safezoneH + safezoneY;
			w = 0.183021 * safezoneW;
			h = 0.519815 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class header: valor_RscStructuredText
		{
			idc = 1001;
			text = "Valor Car Shop"; //--- ToDo: Localize;
			x = 3.988e-005 * safezoneW + safezoneX;
			y = -6.01232e-005 * safezoneH + safezoneY;
			w = 0.182917 * safezoneW;
			h = 0.0374074 * safezoneH;
			colorBackground[] = {0,0,0,0.83};
		};
		class listbox_cars: valor_RscListbox
		{
			idc = 1500;
			x = 0.00364614 * safezoneW + safezoneX;
			y = 0.0444448 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.432778 * safezoneH;
		};
		class button_buy: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.00312586 * safezoneW + safezoneX;
			y = 0.482407 * safezoneH + safezoneY;
			w = 0.174584 * safezoneW;
			h = 0.0318519 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class button_close: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			x = 0.00312505 * safezoneW + safezoneX;
			y = 0.516667 * safezoneH + safezoneY;
			w = 0.174584 * safezoneW;
			h = 0.0318519 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};

	class controls {

		class listbox_cars: valor_RscListbox
		{
			idc = 1500;
			x = 0.00364614 * safezoneW + safezoneX;
			y = 0.0444448 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.432778 * safezoneH;
		};
		class button_buy: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.00312586 * safezoneW + safezoneX;
			y = 0.482407 * safezoneH + safezoneY;
			w = 0.174584 * safezoneW;
			h = 0.0318519 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class button_close: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			x = 0.00312505 * safezoneW + safezoneX;
			y = 0.516667 * safezoneH + safezoneY;
			w = 0.174584 * safezoneW;
			h = 0.0318519 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};


	};
};