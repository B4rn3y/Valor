
class class_dialog  {
	idd = 3010;
	name= "class_dialog";
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

	};

	class controls {
		class btn_close: valor_RscButtonMenu
		{
			idc = 2407;
			text = "Close"; //--- ToDo: Localize;
			OnButtonClick = "Closedialog 0;";
			x = -0.00126261;
			y = 0.838384;
			w = 0.102525;
			h = 0.0444445;
		};
		// UNLOCK CLASSES BTNS
		class class_1: valor_RscButtonMenu
		{
			idc = 2400;
			text = "Unlock"; //--- ToDo: Localize;
			x = 0.0213383;
			y = 0.20761;
			w = 0.146717;
			h = 0.0545455;
		};

		class class_2: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Unlock"; //--- ToDo: Localize;
			x = 0.020202;
			y = 0.326599;
			w = 0.146717;
			h = 0.0545455;
		};
		class class_3: valor_RscButtonMenu
		{
			idc = 2402;
			text = "Unlock"; //--- ToDo: Localize;
			x = 0.020202;
			y = 0.439394;
			w = 0.146717;
			h = 0.0545455;


		};
		// header str texts

		class header_class_slots: valor_RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.00252506;
			y = 0.0521883;
			w = 0.185859;
			h = 0.0629629;
		};
		class header_class_1: valor_RscStructuredText
		{
			idc = 1101;
			text = ""; //--- ToDo: Localize;
			x = 0.00252507;
			y = 0.146465;
			w = 0.185859;
			h = 0.0511784;
		};
		class header_class_2: valor_RscStructuredText
		{
			idc = 1102;
			text = ""; //--- ToDo: Localize;
			x = 0.00378791;
			y = 0.269361;
			w = 0.184596;
			h = 0.0545454;
		};
		class header_class_3: valor_RscStructuredText
		{
			idc = 1103;
			text = ""; //--- ToDo: Localize;
			x = 0.00252524;
			y = 0.387205;
			w = 0.187122;
			h = 0.0494949;
		};
		class str_text_info_current_classes: valor_RscStructuredText
		{
			idc = 1104;
			text = ""; //--- ToDo: Localize;
			x = 0.0012626;
			y = 0.505051;
			w = 0.18649;
			h = 0.321482;
		};

		// main container

		class container_main: valor_RscControlsGroup
		{
			idc = 1499;
			x = 0.191919;
			y = 0.0521888;
			w = 0.798232;
			h = 0.776768;

			class controls
			{


			};
		};

	};
};
//valor_RscControlsGroup 0.01