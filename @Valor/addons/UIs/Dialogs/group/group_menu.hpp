class group_menu {
	idd = 3004;
	name= "group_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class background_main: valor_RscText
		{
			idc = 1000;
			x = -0.00176758;
			y = 0.0456566;
			w = 1.00088;
			h = 0.79165;
			colorBackground[] = {0,0,0,0.7};
		};
		class header: valor_RscText
		{
			idc = 1001;
			x = -0.000126153;
			y = 0.00309762;
			w = 1.00025;
			h = 0.0444444;
			colorBackground[] = {1,0.502,0,1};
		};
		class group_header: valor_RscText
		{
			idc = 1002;
			text = "Group:"; //--- ToDo: Localize;
			x = 0.383838;
			y = 0.0656561;
			w = 0.0772727;
			h = 0.0511784;
		};
		class header_playtime: valor_RscText
		{
			idc = 1003;
			text = "Playtime:"; //--- ToDo: Localize;
			x = 0.00505069;
			y = 0.0740739;
			w = 0.101263;
			h = 0.0427609;
		};
		class str_text_playtime: valor_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.00252528;
			y = 0.124579;
			w = 0.298232;
			h = 0.0797979;
		};
	};

	class controls {
		class member_listbox: valor_RscListbox
		{
			idc = 1500;
			sizeEx = 0.040;
			x = 0.38005;
			y = 0.121212;
			w = 0.392929;
			h = 0.630304;
		};

		class BTN_leave: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Leave"; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_leageGang;";
			x = 0.787879;
			y = 0.121212;
			w = 0.202273;
			h = 0.0410775;
		};
		class btn_invite: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Invite"; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_invite_player;";
			x = 0.789142;
			y = 0.220539;
			w = 0.202273;
			h = 0.0410775;
		};
		class btn_kick: valor_RscButtonMenu
		{
			idc = 2402;
			text = "Kick"; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_kick;";
			x = 0.789141;
			y = 0.26936;
			w = 0.202273;
			h = 0.0410775;
		};
		class btn_delete_gang: valor_RscButtonMenu
		{
			idc = 2408;
			text = "Delete gang"; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_deleteGang;";
			x = 0.789141;
			y = 0.46633;
			w = 0.202273;
			h = 0.0410775;
		};
		class btn_promote: valor_RscButtonMenu
		{
			idc = 2403;
			text = "Promote"; //--- ToDo: Localize;
			onbuttonClick = "[true] spawn valor_fnc_changeRank;";
			x = 0.789141;
			y = 0.318182;
			w = 0.202273;
			h = 0.0410775;
		};
		class btn_demote: valor_RscButtonMenu
		{
			idc = 2404;
			text = "Demote"; //--- ToDo: Localize;
			onbuttonClick = "[false] spawn valor_fnc_changeRank;";
			x = 0.789141;
			y = 0.367003;
			w = 0.202273;
			h = 0.0410775;
		};
		class btn_setleader: valor_RscButtonMenu
		{
			idc = 2405;
			text = "Set Leader"; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_setNewLeader;";
			x = 0.789141;
			y = 0.415825;
			w = 0.202273;
			h = 0.0410775;
		};

		class combo_players: valor_RscCombo
		{
			idc = 2100;
			sizeEx = 0.035;
			x = 0.7875;
			y = 0.168821;
			w = 0.20101;
			h = 0.0444444;
		};
		class background_noGang: valor_RscText
		{
			idc = 1004;
			x = 0.356313;
			y = 0.0467339;
			w = 0.644192;
			h = 0.788552;
			colorBackground[] = {0,0,0,0.7};
		};
		class btn_create_group: valor_RscButtonMenu
		{
			idc = 2406;
			text = "Create Group"; //--- ToDo: Localize;
			colorBackground[] = {1,0,0,1};
			onbuttonClick = "[] spawn valor_fnc_createGang;";
			x = 0.593434;
			y = 0.444444;
			w = 0.184596;
			h = 0.0461279;
		};
		class edit_group_name: valor_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.506313;
			y = 0.390572;
			w = 0.338636;
			h = 0.0494949;
		};
		class btn_close: valor_RscButtonMenu
		{
			idc = 2407;
			text = "Close"; //--- ToDo: Localize;
			onbuttonClick = "closedialog 0;";
			x = -0.00126261;
			y = 0.838384;
			w = 0.102525;
			h = 0.0444445;
		};
	};
};