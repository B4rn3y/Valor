
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
			x = 0.0390151;
			y = 0.162155;
			w = 0.103788;
			h = 0.049495;
		};

		class class_2: valor_RscButtonMenu
		{
			idc = 2401;
			text = "Unlock"; //--- ToDo: Localize;
			x = 0.040404;
			y = 0.281145;
			w = 0.103788;
			h = 0.049495;
		};
		class class_3: valor_RscButtonMenu
		{
			idc = 2402;
			text = "Unlock"; //--- ToDo: Localize;
			x = 0.0391414;
			y = 0.402357;
			w = 0.103788;
			h = 0.049495;
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
			y = 0.124579;
			w = 0.185859;
			h = 0.0292929;
		};
		class header_class_2: valor_RscStructuredText
		{
			idc = 1102;
			text = ""; //--- ToDo: Localize;
			x = 0.0025253;
			y = 0.244108;
			w = 0.185859;
			h = 0.0292929;
		};
		class header_class_3: valor_RscStructuredText
		{
			idc = 1103;
			text = ""; //--- ToDo: Localize;
			x = 0.00252524;
			y = 0.363636;
			w = 0.185859;
			h = 0.0292929;
		};
		class str_text_info_current_classes: valor_RscStructuredText
		{
			idc = 1104;
			text = ""; //--- ToDo: Localize;
			x = 0.00252521;
			y = 0.481482;
			w = 0.185227;
			h = 0.345051;
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
				// container 1
				class container_1: valor_RscControlsGroup
				{
					idc = 5001;
					x = 0;
					y = 0;
					w = 0.785606;
					h = 0.26835;

					class controls
					{
						class text_class_short_1: valor_RscStructuredText
						{
							idc = 6001;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0;
							w = 0.165657;
							h = 0.0646464;

						};
						class btn_class_1: valor_RscButtonMenu
						{
							idc = 7001;
							text = "Remove"; //--- ToDo: Localize;
							x = 0.167657;
							y = 0;
							w = 0.115151;
							h = 0.0646464;

						};
						class class_name_long_1: valor_RscStructuredText
						{
							idc = 8001;
							text = ""; //--- ToDo: Localize;
							x = 0.284808;
							y = 0;
							w = 0.490151;
							h = 0.0646464;

						};
						class str_text_description_1: valor_RscStructuredText
						{
							idc = 9001;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0.0686464;
							w = 0.774242;
							h = 0.190909;

						};
					};
				};


				// container 2
				class container_2: valor_RscControlsGroup
				{
					idc = 5002;
					x = 0;
					y = ((0.26835 * 1) + (0.0025 * 1));
					w = 0.785606;
					h = 0.26835;

					class controls
					{
						class text_class_short_2: valor_RscStructuredText
						{
							idc = 6002;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0;
							w = 0.165657;
							h = 0.0646464;

						};
						class btn_class_2: valor_RscButtonMenu
						{
							idc = 7002;
							text = "Remove"; //--- ToDo: Localize;
							x = 0.167657;
							y = 0;
							w = 0.115151;
							h = 0.0646464;

						};
						class class_name_long_2: valor_RscStructuredText
						{
							idc = 8002;
							text = ""; //--- ToDo: Localize;
							x = 0.284808;
							y = 0;
							w = 0.490151;
							h = 0.0646464;

						};
						class str_text_description_2: valor_RscStructuredText
						{
							idc = 9002;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0.0686464;
							w = 0.774242;
							h = 0.190909;

						};
					};
				};


				// container 3
				class container_3: valor_RscControlsGroup
				{
					idc = 5003;
					x = 0;
					y = ((0.26835 * 2) + (0.0025 * 2));
					w = 0.785606;
					h = 0.26835;

					class controls
					{
						class text_class_short_3: valor_RscStructuredText
						{
							idc = 6003;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0;
							w = 0.165657;
							h = 0.0646464;

						};
						class btn_class_3: valor_RscButtonMenu
						{
							idc = 7003;
							text = "Remove"; //--- ToDo: Localize;
							x = 0.167657;
							y = 0;
							w = 0.115151;
							h = 0.0646464;

						};
						class class_name_long_3: valor_RscStructuredText
						{
							idc = 8003;
							text = ""; //--- ToDo: Localize;
							x = 0.284808;
							y = 0;
							w = 0.490151;
							h = 0.0646464;

						};
						class str_text_description_3: valor_RscStructuredText
						{
							idc = 9003;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0.0686464;
							w = 0.774242;
							h = 0.190909;

						};
					};
				};


				// container 4
				class container_4: valor_RscControlsGroup
				{
					idc = 5004;
					x = 0;
					y = ((0.26835 * 3) + (0.0025 * 3));
					w = 0.785606;
					h = 0.26835;

					class controls
					{
						class text_class_short_4: valor_RscStructuredText
						{
							idc = 6004;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0;
							w = 0.165657;
							h = 0.0646464;

						};
						class btn_class_4: valor_RscButtonMenu
						{
							idc = 7004;
							text = "Remove"; //--- ToDo: Localize;
							x = 0.167657;
							y = 0;
							w = 0.115151;
							h = 0.0646464;

						};
						class class_name_long_4: valor_RscStructuredText
						{
							idc = 8004;
							text = ""; //--- ToDo: Localize;
							x = 0.284808;
							y = 0;
							w = 0.490151;
							h = 0.0646464;

						};
						class str_text_description_4: valor_RscStructuredText
						{
							idc = 9004;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0.0686464;
							w = 0.774242;
							h = 0.190909;

						};
					};
				};


				// container 5
				class container_5: valor_RscControlsGroup
				{
					idc = 5005;
					x = 0;
					y = ((0.26835 * 4) + (0.0025 * 4));
					w = 0.785606;
					h = 0.26835;

					class controls
					{
						class text_class_short_5: valor_RscStructuredText
						{
							idc = 6005;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0;
							w = 0.165657;
							h = 0.0646464;

						};
						class btn_class_5: valor_RscButtonMenu
						{
							idc = 7005;
							text = "Remove"; //--- ToDo: Localize;
							x = 0.167657;
							y = 0;
							w = 0.115151;
							h = 0.0646464;

						};
						class class_name_long_5: valor_RscStructuredText
						{
							idc = 8005;
							text = ""; //--- ToDo: Localize;
							x = 0.284808;
							y = 0;
							w = 0.490151;
							h = 0.0646464;

						};
						class str_text_description_5: valor_RscStructuredText
						{
							idc = 9005;
							text = ""; //--- ToDo: Localize;
							x = 0;
							y = 0.0686464;
							w = 0.774242;
							h = 0.190909;

						};
					};
				};

			};
		};

	};
};
//valor_RscControlsGroup 0.01