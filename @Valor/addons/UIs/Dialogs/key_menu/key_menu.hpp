class key_menu {
	idd = 3015;
	name= "key_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class background_main: valor_RscText
		{
			idc = 1000;
			x = 0.124495;
			y = 0.195488;
			w = 0.783708;
			h = 0.45495;
			colorBackground[] = {0,0,0,0.7};
		};
		class header: valor_RscText
		{
			idc = 1001;
			x = 0.124874;
			y = 0.164714;
			w = 0.784341;
			h = 0.0326599;
			colorBackground[] = {1,0.502,0,1};
		};

	};

	class controls {

		class member_listbox: valor_RscListbox
		{
			idc = 1500;
			sizeEx = 0.040;
			//onLBselChanged = "";
			x = 0.128787;
			y = 0.20707;
			w = 0.517928;
			h = 0.438385;
		};
		class RscButtonMenu_2400: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Give Key"; //--- ToDo: Localize;
			onbuttonClick = "0 spawn valor_fnc_give_key_menu;";
			x = 0.655303;
			y = 0.276094;
			w = 0.117676;
			h = 0.0444445;
		};
		class RscEdit_1400: valor_RscCombo
		{
			idc = 1400;
			sizeEx = 0.040;
			x = 0.65275;
			y = 0.2156;
			w = 0.251515;
			h = 0.0545456;
		};
		class btn_close: valor_RscButtonMenu
		{
			idc = 2407;
			text = "Close"; //--- ToDo: Localize;
			onbuttonClick = "closedialog 0;";
			x = 0.122475;
			y = 0.651515;
			w = 0.102525;
			h = 0.0444445;
		};
	};
};