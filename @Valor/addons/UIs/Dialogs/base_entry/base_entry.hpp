class base_entry {
	idd = 3016;
	name= "base_entry";
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
			x = 0.128787;
			y = 0.20707;
			w = 0.517928;
			h = 0.438385;
		};
		class btn_close: valor_RscButtonMenu
		{
			idc = 2407;
			text = "Close"; //--- ToDo: Localize;
			onbuttonClick = "closedialog 0;";
			x = 0.125;
			y = 0.651515;
			w = 0.0999998;
			h = 0.0444445;
		};
		class btn_add_player: valor_RscButtonMenu
		{
			idc = 2400;
			text = "add"; //--- ToDo: Localize;
			onbuttonClick = "0 spawn valor_fnc_add_player_entry_list;";
			x = 0.651515;
			y = 0.350168;
			w = 0.117676;
			h = 0.0444445;
		};
		class btn_add_group: valor_RscButtonMenu
		{
			idc = 2401;
			text = "add"; //--- ToDo: Localize;
			onbuttonClick = "0 spawn valor_fnc_add_group_entry_list;";
			x = 0.651516;
			y = 0.244108;
			w = 0.117676;
			h = 0.0444445;
		};
		class btn_remove: valor_RscButtonMenu
		{
			idc = 2402;
			text = "remove"; //--- ToDo: Localize;
			onbuttonClick = "0 spawn valor_fnc_remove_from_entry_list;";
			x = 0.791666;
			y = 0.651515;
			w = 0.117676;
			h = 0.0444445;
		};
		class combo_players: valor_RscCombo
		{
			idc = 2100;
			x = 0.651515;
			y = 0.205387;
			w = 0.250253;
			h = 0.0360269;
		};
		class combo_groups: valor_RscCombo
		{
			idc = 2101;
			x = 0.651515;
			y = 0.313131;
			w = 0.250253;
			h = 0.0360269;
		};


	};
};