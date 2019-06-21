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
		class RscListbox_1500: valor_RscListNBox
		{
			idc = 1500;
			x = 0.00429715 * safezoneW + safezoneX;
			y = 0.0666666 * safezoneH + safezoneY;
			w = 0.238361 * safezoneW;
			h = 0.829074 * safezoneH;
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
			text = "Buy"; //--- ToDo: Localize;
			x = 0.00468731 * safezoneW + safezoneX;
			y = 0.906482 * safezoneH + safezoneY;
			w = 0.237578 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
		class SWUTCH_BTN: valor_RscButtonMenu
		{
			idc = 2402;
			text = "Switch"; //--- ToDo: Localize;
			x = 0.00468746 * safezoneW + safezoneX;
			y = 0.937037 * safezoneH + safezoneY;
			w = 0.237578 * safezoneW;
			h = 0.0253704 * safezoneH;
		};
		class STR_TEXT_NAME: valor_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.0042969 * safezoneW + safezoneX;
			y = 0.0296302 * safezoneH + safezoneY;
			w = 0.0742969 * safezoneW;
			h = 0.0346296 * safezoneH;
		};
		class str_text_stock: valor_RscStructuredText
		{
			idc = 1101;
			text = "";
			x = 0.0789057 * safezoneW + safezoneX;
			y = 0.0296301 * safezoneH + safezoneY;
			w = 0.0809374 * safezoneW;
			h = 0.0346296 * safezoneH;
		};
		class str_text_price: valor_RscStructuredText
		{
			idc = 1102;
			text = "";
			x = 0.160546 * safezoneW + safezoneX;
			y = 0.0296294 * safezoneH + safezoneY;
			w = 0.0821092 * safezoneW;
			h = 0.0346296 * safezoneH;
		};

	};
};