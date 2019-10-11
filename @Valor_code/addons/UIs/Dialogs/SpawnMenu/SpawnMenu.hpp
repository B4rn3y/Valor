class SpawnMenu {
	idd = 3001;
	name= "SpawnMenu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class main_background: valor_RscText {
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
			onButtonClick = "0 spawn valor_fnc_spawn;";
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
			onlbselchanged = "0 call valor_fnc_SpawnMenuEVH;";
			sizeEx = 0.04;
			x = 0.0262623;
			y = 0.159798;
			w = 0.298232;
			h = 0.642088;
		};


	};
};