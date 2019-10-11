class bank_menu {
	idd = 3017;
	name= "bank_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class background_main: valor_RscText
		{
			idc = 1000;
			x = 0.263384;
			y = 0.35037;
			w = 0.474365;
			h = 0.136768;
			colorBackground[] = {0,0,0,0.7};
		};
		class header: valor_RscText
		{
			idc = 1001;
			x = 0.263763;
			y = 0.328014;
			w = 0.474998;
			h = 0.0225589;
			colorBackground[] = {1,0.502,0,1};
		};

	};

	class controls {

		class btn_transfer_bankacc: valor_RscButtonMenu
		{
			idc = 2407;
			text = "»»"; //--- ToDo: Localize;
			OnButtonClick = "[true] call valor_fnc_bank_menu_transfer_money;";
			x = 0.464647;
			y = 0.422559;
			w = 0.0343431;
			h = 0.046128;
		};
		class edit_transfer_bankacc: valor_RscEdit
		{
			idc = 1400;
			text = "0";
			x = 0.272689;
			y = 0.422457;
			w = 0.187121;
			h = 0.0494948;
		};
		class edit_withdraw_from_bank: valor_RscEdit
		{
			idc = 1401;
			text = "0";
			x = 0.544192;
			y = 0.420875;
			w = 0.187121;
			h = 0.0494948;
		};
		class btn_withdraw_from_bank: valor_RscButtonMenu
		{
			idc = 2401;
			text = "««"; //--- ToDo: Localize;
			OnButtonClick = "[false] call valor_fnc_bank_menu_transfer_money;";
			x = 0.503788;
			y = 0.422559;
			w = 0.0343432;
			h = 0.046128;
		};
		class money_show: valor_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.272727;
			y = 0.36532;
			w = 0.457323;
			h = 0.0494949;
		};
		class Close_Btn: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			OnButtonClick = "Closedialog 0;";
			x = 0.263889;
			y = 0.488215;
			w = 0.0886364;
			h = 0.042761;
		};
	};
};