class sell_vehicle_items {
	idd = 3014;
	name= "sell_vehicle_items";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class background_main: valor_RscText
		{
			idc = 1000;
			x = 0.246212;
			y = 0.425926;
			w = 0.438384;
			h = 0.162289;
			colorBackground[] = {0,0,0,0.7};
		};
		class header: valor_RscText
		{
			idc = 1001;
			x = 0.246212;
			y = 0.40404;
			w = 0.438384;
			h = 0.0242424;
			colorBackground[] = {1,0.502,0,1};
		};

	};

	class controls {


		class RscStructuredText_1100: valor_RscStructuredText
		{
			idc = 1100;
			x = 0.252525;
			y = 0.434344;
			w = 0.425757;
			h = 0.145454;
		};
		class btn_close: valor_RscButtonMenu
		{
			idc = 2407;
			text = "Close"; //--- ToDo: Localize;
			onbuttonClick = "closedialog 0;";
			x = 0.246212;
			y = 0.589226;
			w = 0.0898991;
			h = 0.042761;
		};

		class sell_btn: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Sell"; //--- ToDo: Localize;
			onbuttonClick = "0 spawn valor_fnc_sell_vehicle_items_menu;";
			x = 0.594697;
			y = 0.589226;
			w = 0.0898991;
			h = 0.042761;
		};
	};
};