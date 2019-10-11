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
			colorBackground[] = {1,0.502,0,1};
		};
	};

	class controls {
		/*class RscListbox_1500: valor_RscTree
		{
			idc = 1500;
			//sizeEx = 0.040;
			x = 0.00507843 * safezoneW + safezoneX;
			y = 0.0324073 * safezoneH + safezoneY;
			w = 0.236799 * safezoneW;
			h = 0.899444 * safezoneH;
		};*/
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
			x = 0.00468727 * safezoneW + safezoneX;
			y = 0.937963 * safezoneH + safezoneY;
			w = 0.237578 * safezoneW;
			h = 0.0253704 * safezoneH;
		};

	};
};