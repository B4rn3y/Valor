class accept_quest {
	idd = 3002;
	name= "accept_quest";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class backgrnd_pic: valor_RscPicture
		{
			idc = 1200;
			text = "\UIs\textures\quest\notebook.paa";
			x = -0.394376;
			y = -0.821661;
			w = 1.81225;
			h = 2.7264;
		};
		class pic_1: valor_RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.575788;
			y = 0.0402302;
			w = 0.424495;
			h = 0.320539;
		};
		class pic_2: valor_RscPicture
		{
			idc = 1202;
			text = "";
			x = 0.574495;
			y = 0.400674;
			w = 0.425758;
			h = 0.322222;
		};
		class check: valor_RscPicture
		{
			idc = 1203;
			text = "\UIs\textures\quest\check0.paa";
			x = 0.401515;
			y = 0.892256;
			w = 0.0772727;
			h = 0.0882157;
		};

		class accept_btn: valor_RscPicture
		{
			idc = 1204;
			text = "\UIs\textures\quest\accept.paa";
			x = 0.0530303;
			y = 0.998317;
			w = 0.108838;
			h = 0.0696972;
		};
		class hint: valor_RscPicture
		{
			idc = 1205;
			text = "\UIs\textures\quest\hint.paa";
			x = 0.267676;
			y = 1;
			w = 0.113889;
			h = 0.0646468;
		};
	};

	class controls {
		class story: valor_RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.00126225;
			y = 0.00336695;
			w = 0.476263;
			h = 0.882828;

		};
		class aufgabe: valor_RscStructuredText
		{
			idc = 1101;
			text = ""; //--- ToDo: Localize;
			x = -3.27826e-007;
			y = 0.883841;
			w = 0.39798;
			h = 0.116835;

		};

		class accept_btn: valor_RscButtonSilent
		{
			idc = 1904;
			onButtonClick = "";
			tooltip = "Accept this Quest";
			x = 0.0530303;
			y = 0.998317;
			w = 0.108838;
			h = 0.0696972;
		};
		class hint: valor_RscButtonSilent
		{
			idc = 1905;
			onButtonClick = "";
			tooltip = "Get Hint for Quest";
			x = 0.267676;
			y = 1;
			w = 0.113889;
			h = 0.0646468;
		};


	};
};