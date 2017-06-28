class SpawnMenu {
	idd = 3001;
	name= "SpawnMenu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class main_background: : valor_RscText {
			colorBackground[] = {0, 0, 0, 0.7};

			idc = -1;
			x = 0.00252557;
			y = 0.0824917;
			w = 1.00025;
			h = 0.80202;
		};

		class Header :valor_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 1000;
			x = 0.00252521;
			y = 0.0370373;
			w = 1.00025;
			h = 0.046128;
		};
		class desc_spawnPoints: valor_RscText
		{
			idc = -1;
			text = "Spawnpunkte:"; //--- ToDo: Localize;
			x = 0.0214646;
			y = 0.0976429;
			w = 0.151768;
			h = 0.0511784;
		};
	};

	class controls {
		class map: valor_RscMapControl
		{
			idc = 1001;
			x = 0.325758;
			y = 0.159933;
			w = 0.650505;
			h = 0.640404;
		};

		class spawnBTN: valor_RscButtonMenu
		{
			idc = 2400;
			text = "SPAWN!"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.0252523;
			y = 0.799664;
			w = 0.299495;
			h = 0.0680135;
		};
		class LobbyBTN: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Back to Lobby"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.77399;
			y = 0.801347;
			w = 0.202273;
			h = 0.0680135;
		};
		class spawnpoints: valor_RscListbox
		{
			idc = 1500;
			onlbselchanged = "";
			sizeEx = 0.04;
			x = 0.0262623;
			y = 0.159798;
			w = 0.298232;
			h = 0.642088;
		};



















		class CashTitle : lhm_RscStructuredText
		{
			idc = 2701;
			text = "";

			x = 0.50404;
			y = 0.119529;
			w = 0.25;
			h = 0.16;
		};

		//class Title : lhm_RscTitle {
	//		colorBackground[] = {0, 0, 0, 0};
	//		idc = -1;
	//		text = "$STR_ATM_Title";
	//		x = 0.35;
	//		y = 0.2;
	//		w = 0.6;
	//		h = (1 / 25);
	//	};

		class WithdrawButton : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_bankWithdraw";

			x = 0.508712;
			y = 0.37771;
			w = 0.2375;
			h = 0.06;
		};

		class DepositButton : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_bankDeposit";

			x = 0.508838;
			y = 0.458317;
			w = 0.2375;
			h = 0.06;
		};

		class moneyEdit : lhm_RscEdit {

		idc = 2702;

		text = "1";
		sizeEx = 0.030;
		x = 0.509975;
		y = 0.297912;
		w = 0.2375;
		h = 0.06;

		};

		class PlayerList : lhm_RscListbox
		{
			idc = 2703;
			sizeEx = 0.040;
			x = 0.17803;
			y = 0.111987;
			w = 0.3125;
			h = 0.76;
		};

		class TransferButton : lhm_RscButtonMenu
		{
			idc = 2704;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_bankTransfer";

			x = 0.508725;
			y = 0.6164;
			w = 0.2375;
			h = 0.06;
		};

		class GangDeposit : lhm_RscButtonMenu
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_gangDeposit";
			x = 0.508838;
			y = 0.535354;
			w = 0.2375;
			h = 0.06;
		};

		class CloseButtonKey : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.170328;
			y = 0.898115;
			w = 0.1375;
			h = 0.06;
		};
	};
};