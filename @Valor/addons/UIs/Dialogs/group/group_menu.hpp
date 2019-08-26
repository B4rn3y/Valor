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
		class str_text_stats: valor_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.00252524;
			y = 0.203771;
			w = 0.347474;
			h = 0.630303;
		};
		class str_text_header_money: valor_RscStructuredText
		{
			idc = 1101;
			x = 0.00252557;
			y = 0.050505;
			w = 0.348737;
			h = 0.0377104;
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
			onbuttonClick = "[] spawn valor_fnc_leaveGang;";
			x = 0.787879;
			y = 0.121212;
			w = 0.202273;
			h = 0.0410775;
		};
		class BTN_give_money: valor_RscButtonMenu
		{
			idc = 2410;
			text = "give"; //--- ToDo: Localize;
			onbuttonClick = "";
			x = 0.286616;
			y = 0.0909089;
			w = 0.0684343;
			h = 0.0612794;
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
		class BTN_INFO_RULES: valor_RscButtonMenu
		{
			idc = 2411;
			text = "INFO a. RULES"; //--- ToDo: Localize;
			onbuttonClick = "0 call valor_fnc_openinfomenu;";
			x = 0.102273;
			y = 0.838384;
			w = 0.171969;
			h = 0.0444445;
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

		class btn_skills: valor_RscButtonMenu
		{
			idc = 2412;
			text = "Skills"; //--- ToDo: Localize;
			onbuttonClick = " 0 spawn valor_fnc_openskillmenu;";
			x = 0.275253;
			y = 0.838384;
			w = 0.102525;
			h = 0.0444445;
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
		class combo_players_money: valor_RscCombo
		{
			idc = 2102;
			sizeEx = 0.035;
			x = 0.00252515;
			y = 0.153198;
			w = 0.283081;
			h = 0.0478114;
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
		class edit_give_money: valor_RscEdit
		{
			idc = 1401;
			text = "";
			x = 0.00378817;
			y = 0.094276;
			w = 0.281818;
			h = 0.0579124;
		};
		class combo_groups: valor_RscCombo
		{
			idc = 2101;
			sizeEx = 0.035;
			x = 0.790404;
			y = 0.515152;
			w = 0.20101;
			h = 0.0444444;
		};
		class btn_give_group_belongings: valor_RscButtonMenu
		{
			idc = 2409;
			text = "G. Group Prop."; //--- ToDo: Localize;
			onbuttonClick = "[] spawn valor_fnc_give_Group_Properties";
			x = 0.790404;
			y = 0.56734;
			w = 0.202273;
			h = 0.0410775;
		};
	};
};