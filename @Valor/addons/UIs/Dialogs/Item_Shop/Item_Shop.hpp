class Item_Shop {
	idd = 3007;
	name= "Item_Shop";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class bckgrnd: valor_RscText
		{
			idc = 1000;
			x = -0.00195263 * safezoneW + safezoneX;
			y = -0.00277717 * safezoneH + safezoneY;
			w = 0.247735 * safezoneW;
			h = 1.00408 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class header: valor_RscText
		{
			idc = 1001;
			x = -0.00156277 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.247344 * safezoneW;
			h = 0.0262963 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};

	class controls {
		class RscListbox_1500: valor_RscListBox
		{
			idc = 1500;
			sizeEx = 0.040;
			x = 0.00234404 * safezoneW + safezoneX;
			y = 0.0324073 * safezoneH + safezoneY;
			w = 0.240314 * safezoneW;
			h = 0.863333 * safezoneH;
		};
		class close_BTN: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			Onbuttonclick = "closedialog 0;";
			x = 0.00468775 * safezoneW + safezoneX;
			y = 0.966667 * safezoneH + safezoneY;
			w = 0.237578 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
		class buy_sell_BTN: valor_RscButtonMenu
		{
			idc = 2400;
			text = ""; //--- ToDo: Localize;
			x = 0.00468731 * safezoneW + safezoneX;
			y = 0.906482 * safezoneH + safezoneY;
			w = 0.237578 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
		class SWUTCH_BTN: valor_RscButtonMenu
		{
			idc = 2402;
			text = "Switch"; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_switchItemShop;";
			x = 0.00468746 * safezoneW + safezoneX;
			y = 0.937037 * safezoneH + safezoneY;
			w = 0.237578 * safezoneW;
			h = 0.0253704 * safezoneH;
		};

	};
};