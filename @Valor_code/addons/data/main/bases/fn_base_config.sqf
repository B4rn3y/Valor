_id = param[0,-1,[0]];
_state = param[1,-1,[0]];
if(_id isEqualTo -1 || _state isEqualTo -1) exitWith {[]};
_base = [];

_base = switch (_id) do
{
	case 1: // Hero level 1 house
	{
		switch (_state) do
		{
			case 0: // in build
			{
				[
					[["Land_PoleWall_02_end_F",[5.43585,12.1362,0.301023],359.796,[0,0,1]],["valor_baseFloor8x15",[-0.389404,13.4634,-0.00143909],90.5457,[0,0,1]],["Land_House_1W10_ruins_F",[-2.0358,14.6345,0.301023],-0.197267,[0,0,1]],["Land_PoleWall_02_end_F",[3.91931,14.908,0.301023],88.8417,[0,0,1]],["valor_CargoNet_infinite",[5.31163,14.8179,0.301023],-0.197267,[0,0,1]],["Land_PoleWall_02_end_F",[6.95702,14.9976,0.301023],269.599,[0,0,1]],["Land_PoleWall_02_end_F",[5.42087,16.4902,0.301023],179.466,[0,0,1]]],
					[
						["valor_woodenlog",50],
						["valor_cliff_stone_medium",40]
					],
					[20,40],
					["hero_1"],
					4
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[-1.95598,9.854,1.98356],-0.197267,[0,0,1]],["Russell_Barricade02",[0.745026,11.0232,1.86056],266.077,[0,0,1]],["Russell_Barricade01",[0.723953,11.0442,2.08056],270.708,[0,0,1]],["valor_CargoNet",[-1.17729,11.6296,1.07156],-0.197267,[0.000985808,-0.0024574,0.999996]],["Russell_Barricade02",[2.3981,11.8691,1.96856],-0.197267,[0,0,1]],["Russell_Barricade01",[2.46207,11.8811,2.15656],-0.197267,[0,0,1]],["valor_baseFloor8x15",[-0.389404,13.4634,-0.00143909],90.5457,[0,0,1]],["valor_Land_ds_HouseV_3I1",[0.121506,13.7834,0.300561],-0.197267,[0,0,1]],["Russell_Barricade01",[-6.67773,12.3938,1.47656],89.0317,[0,0,1]],["Russell_Barricade01",[-6.70674,12.3916,1.63456],89.0317,[0,0,1]],["Russell_Barricade01",[-6.68874,13.8477,1.61256],89.0317,[0,0,1]],["Russell_Barricade01",[-6.67975,13.8479,1.76856],89.0317,[0,0,1]],["Russell_Barricade01",[-6.70656,15.2466,1.76356],89.0317,[0,0,1]],["Russell_Barricade02",[-6.70468,15.2808,1.54056],87.4117,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-1.80443,16.6685,2.06956],179.751,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[4.44542,16.7202,2.04856],-0.197267,[0,0,1]],["Russell_Barricade01",[-5.62521,16.5996,2.01956],-0.197267,[0,0,1]]],
					[
						["valor_woodenlog",50],
						["valor_cliff_stone_medium",40]
					],
					[20,40],
					["hero_1"],
					4
				]
			};
		};

	};



	case 2: // Hero level 2 house
	{
		switch (_state) do
		{
			case 0: // in build
			{
				[
					[["Land_PoleWall_02_end_F",[-3.74902,7.75905,0.361516],1.43744,[0,0,1]],["Land_PoleWall_02_end_F",[-2.19385,9.28882,0.361516],-89.1866,[0,0,1]],["valor_CargoNet_infinite",[-3.58203,9.42711,0.361516],-178.226,[0,0,1]],["Land_PoleWall_02_end_F",[-5.23291,9.30466,0.361516],-268.43,[0,0,1]],["Land_PoleWall_02_end_F",[-3.61377,12.1117,0.361516],-178.232,[0,0,1]],["valor_baseFloor11x12_5",[0.166748,13.4217,-0.00143909],-177.975,[0,0,1]],["Land_Rail_Station_Small_ruins_F",[1.31445,14.5185,0.361516],-269.287,[0,0,1]]],
					[
						["valor_woodenboard",60],
						["valor_cliff_stone_medium",100],
						["valor_cement_bag",40]
					],
					[20,40],
					["hero_2"],
					5
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[-2.6272,8.22307,1.27356],1.11545,[0,0,1]],["Land_House_1W09_F",[0.0146484,11.3244,0.361561],-269.287,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-4.80249,10.2203,1.35956],-269.287,[0,0,1]],["valor_baseFloor11x12_5",[0.166748,13.4217,-0.00143909],-177.975,[0,0,1]],["valor_CargoNet",[-1.77441,15.817,0.936561],-269.287,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[4.86157,14.9863,1.61956],-89.3386,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-4.73706,15.1429,1.37156],-269.287,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-1.43384,18.759,1.39756],-179.536,[0,0,1]]],
					[
						["valor_woodenboard",60],
						["valor_cliff_stone_medium",100],
						["valor_cement_bag",40]
					],
					[20,40],
					["hero_2"],
					5
				]
			};
		};

	};


	case 3: // Hero level 3 house
	{
		switch (_state) do
		{
			case 0: // in build
			{
				[
					[["Land_PoleWall_02_end_F",[4.65009,11.0935,0.497626],358.831,[0,0,1]],["Land_PoleWall_02_end_F",[3.08704,13.8396,0.497626],87.8769,[0,0,1]],["valor_CargoNet_infinite",[4.48167,13.7737,0.497626],-1.16209,[0,0,1]],["Land_PoleWall_02_end_F",[6.12282,13.98,0.497626],268.634,[0,0,1]],["Land_PoleWall_02_end_F",[4.56274,15.4475,0.497626],178.501,[0,0,1]],["valor_baseFloor16x17",[-1.92526,18.658,-0.00143909],267.746,[0,0,1]],["Land_Garaz_mala_ruins",[-6.6756,19.5417,0.497626],-1.16209,[0,0,1]],["Land_House_1W02_ruins_F",[0.451401,20.6985,0.497626],-1.16209,[0,0,1]]],
					[
						["valor_woodenboard",120],
						["valor_cliff_stone_medium",150],
						["valor_cement_bag",80],
						["valor_cinder_blocks",60]
					],
					[20,40],
					["hero_3"],
					6
				]
			};

			case 1: // build complete
			{
				[
					[["Land_House_2W02_F",[1.36043,16.8831,0.497561],267.746,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-3.62555,16.979,4.48221],88.2961,[-0.00372251,0.112943,0.993595]],["valor_baseFloor16x17",[-1.92526,18.658,-0.00143909],267.746,[0,0,1]],["Land_Garaz_mala",[-6.32559,18.5806,0.512561],178.11,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[5.86867,18.6909,1.73156],267.746,[0,0,1]],["Russell_Barricade01",[4.71906,19.5476,4.34556],267.777,[0,0,1]],["Russell_Barricade02",[4.67435,20.1738,4.05656],87.5399,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[5.80482,20.7048,1.72456],267.746,[0,0,1]],["Russell_Barricade02",[4.65285,20.7407,4.05656],267.746,[0,0,1]],["valor_CargoNet",[0.77272,21.842,1.28856],267.746,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[5.72439,22.6968,1.72856],267.746,[0,0,1]],["Russell_Barricade02",[-3.90639,24.2168,4.27456],267.746,[0,0,1]],["Russell_Barricade01",[-3.91966,24.2295,4.48056],267.746,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-0.191071,26.4565,1.65756],177.778,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-0.209442,26.4751,4.63856],177.778,[0,0,1]]],
					[
						["valor_woodenboard",120],
						["valor_cliff_stone_medium",150],
						["valor_cement_bag",80],
						["valor_cinder_blocks",60]
					],
					[20,40],
					["hero_3"],
					6
				]
			};
		};

	};


	case 4: // Bandit level 1 house
	{
		switch (_state) do
		{
			case 0: // in build
			{
				[
					[["Land_PoleWall_02_end_F",[3.8635,5.68457,0.301024],-0.666901,[0,0,1]],["Land_PoleWall_02_end_F",[2.31082,7.18848,0.301024],89.4661,[0,0,1]],["valor_CargoNet_infinite",[3.78593,7.52002,0.301024],-180.33,[0,0,1]],["valor_baseFloor7x13",[-0.895664,8.60815,-0.00143909],-90.4179,[0,0,1]],["Land_PoleWall_02_end_F",[5.35055,7.24414,0.301024],-91.2909,[0,0,1]],["Land_Rail_Station_Small_ruins_F",[-3.10172,8.79785,-0.00143909],-180.33,[0,0,1]],["Land_PoleWall_02_end_F",[3.86386,10.1396,0.301024],179.663,[0,0,1]]],
					[
						["valor_woodenlog",50],
						["valor_cliff_stone_medium",40]
					],
					[20,40],
					["bandit_1"],
					1
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[0.0589981,6.06445,1.27556],-180.33,[0,0,1]],["Land_House_1W10_F",[-0.797012,6.58472,0.300561],-180.33,[0,0,1]],["valor_baseFloor7x13",[-0.895664,8.60815,-0.00143909],-90.4179,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[4.78436,8.62085,1.36356],89.2551,[0,0,1]],["valor_CargoNet",[3.45183,9.75122,0.889561],-180.33,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-1.97241,10.9951,1.36856],-180.33,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[2.56195,11.1172,1.41956],179.404,[0,0,1]]],
					[
						["valor_woodenlog",50],
						["valor_cliff_stone_medium",40]
					],
					[20,40],
					["bandit_1"],
					1
				]
			};
		};

	};


	case 5: // Bandit level 2 house
	{
		switch (_state) do
		{
			case 0: // in build
			{
				[
					[["Land_PoleWall_02_end_F",[5.08326,11.033,0.300561],357.3,[0,0,1]],["Land_PoleWall_02_end_F",[2.16305,12.4377,0.300561],87.4973,[0,0,1]],["valor_CargoNet_infinite",[4.83852,12.6694,0.300832],87.5043,[0,0,1]],["Land_PoleWall_02_end_F",[6.51358,12.6262,0.300561],267.167,[0,0,1]],["Land_PoleWall_02_end_F",[4.87313,14.0642,0.300561],176.543,[0,0,1]],["Land_House_1W08_ruins_F",[-0.33102,14.8713,0.700561],-0.493706,[0,0,1]],["valor_baseFloor8_5x14",[-0.181465,14.9236,-0.00143909],89.2553,[0,0,1]]],
					[
						["valor_woodenboard",60],
						["valor_cliff_stone_medium",100],
						["valor_cement_bag",40]
					],
					[20,40],
					["bandit_2"],
					2
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[-1.76284,11.3628,1.83156],-0.493706,[0,0,1]],["Land_Shoot_House_Wall_F",[0.772488,12.4966,0.907561],88.1063,[0,0,1]],["valor_CargoNet",[-2.19742,13.4031,1.33296],359.501,[-0.118232,0.0279659,0.992592]],["Land_House_1W08_F",[-0.926098,13.4851,0.300561],-0.493706,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[2.58682,13.3943,2.02956],-0.493706,[0,0,1]],["valor_baseFloor8_5x14",[-0.181465,14.9236,-0.00143909],89.2553,[0,0,1]],["Russell_Barricade01",[-6.63645,13.8501,1.39956],88.7353,[0,0,1]],["Russell_Barricade01",[-6.64545,13.8501,1.55256],88.7353,[0,0,1]],["Russell_Barricade01",[-6.6458,15.168,1.47756],88.7353,[0,0,1]],["Russell_Barricade01",[-6.6368,15.168,1.58256],88.7353,[0,0,1]],["Russell_Barricade01",[-6.66031,16.5029,1.42956],88.7353,[0,0,1]],["Russell_Barricade01",[-6.65131,16.5029,1.56756],88.7353,[0,0,1]],["Russell_Barricade01",[-6.66071,17.1299,1.46756],88.7353,[0,0,1]],["Russell_Barricade01",[-6.65171,17.1299,1.58656],88.7353,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-0.630402,18.2798,2.18856],-0.493706,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-2.96517,18.2437,2.16856],-0.493706,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[4.49777,18.282,2.16556],-0.493706,[0,0,1]]],
					[
						["valor_woodenboard",60],
						["valor_cliff_stone_medium",100],
						["valor_cement_bag",40]
					],
					[20,40],
					["bandit_2"],
					2
				]
			};
		};

	};


	case 6: // Bandit level 3 house
	{
		switch (_state) do
		{
			case 0: // in build
			{
				[
					[["valor_baseFloor15_5x20",[0.596451,16.4412,-0.00143909],-267.285,[0,0,1]],["Land_House_2W05_ruins_F",[1.97118,17.4075,1.10756],-357.991,[0,0,1]],["Land_PoleWall_02_end_F",[-7.58446,19.554,0.512561],1.37219,[0,0,1]],["Land_PoleWall_02_end_F",[-6.03078,21.0864,0.512561],-89.2518,[0,0,1]],["valor_CargoNet_infinite",[-7.41986,21.2224,0.511747],-178.291,[-2.33515e-007,-2.51444e-006,1]],["Land_PoleWall_02_end_F",[-9.06923,21.0979,0.512561],-268.495,[0,0,1]],["Land_PoleWall_02_end_F",[-7.45375,23.907,0.512561],-178.297,[0,0,1]]],
					[
						["valor_woodenboard",120],
						["valor_cliff_stone_medium",150],
						["valor_cement_bag",80],
						["valor_cinder_blocks",60]
					],
					[20,40],
					["bandit_3"],
					3
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[1.24265,11.1304,1.50656],-177.987,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-0.843124,11.2305,1.52756],-177.987,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-0.295822,11.115,4.07756],1.74319,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[2.4998,11.0271,4.06356],1.74319,[0,0,1]],["valor_CargoNet",[-0.308517,13.52,3.81979],2.00912,[1.51596e-007,3.87048e-007,1]],["Land_Shoot_House_Wall_Stand_F",[-2.2739,13.145,4.20556],-89.3188,[0,0,1]],["Land_Garaz_mala",[-5.37065,14.7463,0.512561],-178.73,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[9.63155,12.9482,1.45256],-268.653,[0,0,1]],["valor_baseFloor15_5x20",[0.596451,16.4412,-0.00143909],-267.285,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-2.21394,16.8501,4.21056],-89.3188,[0,0,1]],["Land_House_2W05_F",[5.86766,16.5544,0.512561],-357.991,[0,0,1]]],
					[
						["valor_woodenboard",120],
						["valor_cliff_stone_medium",150],
						["valor_cement_bag",80],
						["valor_cinder_blocks",60]
					],
					[20,40],
					["bandit_3"],
					3
				]
			};
		};

	};


	case 7: // BIG BASE
	{
		switch (_state) do
		{
			case 0: // in build rdy
			{
				[
					[["Land_A_Castle_Bastion_ruins",[0.176086,28.5381,0.129561],-180.179,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[-20.9315,25.7842,0.129334],-180.179,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[23.2718,25.7979,0.129561],-180.179,[0,0,1]],["Land_PoleWall_02_end_F",[-11.3193,42.1484,0.129561],0.747467,[0,0,1]],["Land_PoleWall_02_end_F",[-8.31982,43.5806,0.129561],-91.8075,[0,0,1]],["valor_CargoNet_infinite",[-11.2415,43.7832,0.128337],179.821,[1.0813e-006,3.44087e-006,1]],["Land_PoleWall_02_end_F",[-12.8742,43.6963,0.129561],89.6455,[0,0,1]],["Land_PoleWall_02_end_F",[-11.3258,45.1963,0.129561],-178.38,[0,0,1]],["valor_baseFloor60",[0.0392456,45.8086,-1.68544],-180.179,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[-22.9608,45.8091,0.129561],87.7625,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[22.1628,47.2793,0.129561],88.7435,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[-0.633667,69.2163,0.129561],177.299,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[22.6987,67.1934,0.129561],-180.179,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[-20.2756,68.3438,0.129342],-180.179,[0,0,1]]],
					[
						["valor_woodenboard",200],
						["valor_cliff_stone_medium",300],
						["valor_cement_bag",200],
						["valor_cinder_blocks",350]
					],
					[70,120],
					["bandit_3","hero_3"],
					7
				]
			};


			case 1: // in build rdy
			{
				[
					[["valor_drawBridge",[0.177551,12.6797,-0.00143909],-180.179,[0,0,1]],["Land_A_Castle_Gate",[0.0612793,22.0542,0.12956],-180.179,[0,0,1]],["Land_A_Castle_Stairs_A",[-15.7947,18.8281,-0.00143862],-89.9265,[0,0,1]],["Land_Plank_01_8m_F",[-13.718,18.5952,10.1966],-89.0715,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.0032,18.3154,-0.00143909],-179.88,[0,0,1]],["Land_Plank_01_8m_F",[-11.7035,21.0269,10.5144],42.351,[-0.161788,0.0311132,0.986335]],["Land_Plank_01_4m_F",[-7.3645,23.5903,10.6423],-93.5138,[0.186249,0.000580311,0.982502]],["Land_Plank_01_8m_F",[-17.897,21.7793,10.1806],-3.76254,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[23.2718,25.7979,0.129561],-180.179,[0,0,1]],["Land_Plank_01_8m_F",[-18.3348,29.1323,10.4516],-3.76254,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.6795,25.1738,0.129561],178.99,[0,0,1]],["valor_CargoNet_infinite",[-24.8259,26.8955,10.6281],-180.176,[-9.0183e-007,3.59714e-006,1]],["Land_Plank_01_4m_F",[-20.0858,32.6558,10.4176],-87.2315,[0,0,1]],["Land_Plank_01_8m_F",[-23.4019,32.688,10.4186],88.2705,[0,0,1]],["valor_baseFloor60",[0.0392456,45.8086,-1.68544],-180.179,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[-22.9608,45.8091,0.129561],87.7625,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[22.1628,47.2793,0.129561],88.7435,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[-0.633667,69.2163,0.129561],177.299,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[22.6987,67.1934,0.129561],-180.179,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[-20.2756,68.3438,0.129342],-180.179,[0,0,1]]],
					[
						["valor_woodenboard",200],
						["valor_cliff_stone_medium",300],
						["valor_cement_bag",200],
						["valor_cinder_blocks",350]
					],
					[70,120],
					["bandit_3","hero_3"],
					7
				]
			};


			case 2: // in build rdy
			{
				[
					[["valor_drawBridge",[0.177551,12.6797,-0.00143909],-180.179,[0,0,1]],["Land_A_Castle_Gate",[0.0612793,22.0542,0.12956],-180.179,[0,0,1]],["Land_A_Castle_Stairs_A",[-15.7947,18.8281,-0.00143862],-89.9265,[0,0,1]],["Land_Plank_01_8m_F",[-13.718,18.5952,10.1966],-89.0715,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.0032,18.3154,-0.00143909],-179.88,[0,0,1]],["Land_Plank_01_8m_F",[-11.7035,21.0269,10.5144],42.351,[-0.161788,0.0311132,0.986335]],["Land_Plank_01_4m_F",[-7.3645,23.5903,10.6423],-93.5138,[0.186249,0.000580311,0.982502]],["Land_Plank_01_8m_F",[-17.897,21.7793,10.1806],-3.76254,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[23.2718,25.7979,0.129561],-180.179,[0,0,1]],["Land_Plank_01_8m_F",[-18.3348,29.1323,10.4516],-3.76254,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.6795,25.1738,0.129561],178.99,[0,0,1]],["Land_Plank_01_4m_F",[-20.0858,32.6558,10.4176],-87.2315,[0,0,1]],["Land_Plank_01_8m_F",[-23.4019,32.688,10.4186],88.2705,[0,0,1]],["Land_Plank_01_8m_F",[-26.9594,36.0386,10.4036],-0.442551,[0,0,1]],["valor_baseFloor60",[0.0392456,45.8086,-1.68544],-180.179,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.6269,41.9766,0.12956],-91.5995,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[22.1628,47.2793,0.129561],88.7435,[0,0,1]],["Land_Plank_01_8m_F",[-27.1863,43.7051,10.3646],-2.82155,[0,0,1]],["Land_Plank_01_8m_F",[-27.4626,51.1758,10.3766],-0.857529,[0,0,1]],["Land_A_Castle_Stairs_A",[-14.3667,59.9028,-0.00943899],-89.9265,[0,0,1]],["Land_Plank_01_8m_F",[-27.4303,56.2378,10.4176],1.20949,[0,0,1]],["Land_Plank_01_8m_F",[-20.4487,59.5747,10.4076],89.9425,[0,0,1]],["Land_Plank_01_8m_F",[-23.7427,59.5967,10.4116],92.3785,[0,0,1]],["Land_Plank_01_8m_F",[-16.8627,63.0962,10.4026],178.779,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.8925,62.0454,0.12956],-90.1895,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[-0.633667,69.2163,0.129561],177.299,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[22.6987,67.1934,0.129561],-180.179,[0,0,1]],["Land_A_Castle_Bergfrit",[-22.3015,67.1709,0.129561],178.99,[0,0,1]],["Land_Plank_01_8m_F",[-16.9999,69.8955,10.4066],178.779,[0,0,1]],["valor_CargoNet_infinite",[-23.5186,69.168,10.6281],-180.178,[3.49782e-008,4.75154e-006,1]],["Land_A_Castle_Wall1_20",[-18.0628,74.0552,0.12956],-0.727524,[0,0,1]],["Land_A_Castle_Wall1_Corner",[-27.4027,73.3696,-0.00143909],-0.609543,[0,0,1]]],
					[
						["valor_woodenboard",250],
						["valor_cliff_stone_medium",350],
						["valor_cement_bag",250],
						["valor_cinder_blocks",400]
					],
					[70,120],
					["bandit_3","hero_3"],
					7
				]
			};


			case 3: // in build
			{
				[
					[["valor_drawBridge",[0.177551,12.6797,-0.00143909],-180.179,[0,0,1]],["Land_A_Castle_Gate",[0.0612793,22.0542,0.12956],-180.179,[0,0,1]],["Land_A_Castle_Stairs_A",[-15.7947,18.8281,-0.00143862],-89.9265,[0,0,1]],["Land_Plank_01_8m_F",[-13.718,18.5952,10.1966],-89.0715,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.0032,18.3154,-0.00143909],-179.88,[0,0,1]],["Land_Plank_01_8m_F",[-11.7035,21.0269,10.5144],42.351,[-0.161788,0.0311132,0.986335]],["Land_Plank_01_4m_F",[-7.3645,23.5903,10.6423],-93.5138,[0.186249,0.000580311,0.982502]],["Land_Plank_01_8m_F",[-17.897,21.7793,10.1806],-3.76254,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[23.2718,25.7979,0.129561],-180.179,[0,0,1]],["Land_Plank_01_8m_F",[-18.3348,29.1323,10.4516],-3.76254,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.6795,25.1738,0.129561],178.99,[0,0,1]],["Land_Plank_01_4m_F",[-20.0858,32.6558,10.4176],-87.2315,[0,0,1]],["Land_Plank_01_8m_F",[-23.4019,32.688,10.4186],88.2705,[0,0,1]],["Land_Plank_01_8m_F",[-26.9594,36.0386,10.4036],-0.442551,[0,0,1]],["valor_baseFloor60",[0.0392456,45.8086,-1.68544],-180.179,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.6269,41.9766,0.12956],-91.5995,[0,0,1]],["Land_A_Castle_Wall1_20_ruins",[22.1628,47.2793,0.129561],88.7435,[0,0,1]],["Land_Plank_01_8m_F",[-27.1863,43.7051,10.3646],-2.82155,[0,0,1]],["Land_Plank_01_8m_F",[-27.4626,51.1758,10.3766],-0.857529,[0,0,1]],["Land_A_Castle_Stairs_A",[-14.3667,59.9028,-0.00943899],-89.9265,[0,0,1]],["Land_Plank_01_8m_F",[19.8348,59.1685,10.5376],-91.2195,[0,0,1]],["Land_Plank_01_8m_F",[-27.4303,56.2378,10.4176],1.20949,[0,0,1]],["Land_Plank_01_8m_F",[-20.4487,59.5747,10.4076],89.9425,[0,0,1]],["Land_Plank_01_8m_F",[22.8198,59.1709,10.4916],-91.2195,[0,0,1]],["Land_Plank_01_8m_F",[-23.7427,59.5967,10.4116],92.3785,[0,0,1]],["Land_Plank_01_8m_F",[16.3298,62.9985,10.5756],0.974487,[0,0,1]],["Land_Plank_01_8m_F",[-16.8627,63.0962,10.4026],178.779,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.8925,62.0454,0.12956],-90.1895,[0,0,1]],["Land_A_Castle_Wall1_20",[26.9873,63.5146,0.12956],89.3055,[0,0,1]],["valor_CargoNet_infinite",[23.1221,64.8457,10.6281],-180.178,[-5.03081e-007,-3.56931e-006,1]],["Land_A_Castle_Bergfrit",[21.7774,66.6782,0.129561],0.891495,[0,0,1]],["Land_A_Castle_Bergfrit",[-22.3015,67.1709,0.129561],178.99,[0,0,1]],["Land_Plank_01_8m_F",[16.4619,69.6992,10.4276],0.974487,[0,0,1]],["Land_Plank_01_8m_F",[-16.9999,69.8955,10.4066],178.779,[0,0,1]],["Land_A_Castle_Wall1_20",[-3.74689,74.0903,0.12956],-0.727524,[0,0,1]],["Land_Plank_01_8m_F",[-2.31293,73.8057,10.4266],89.9415,[0,0,1]],["Land_Plank_01_8m_F",[5.38037,74.0176,10.4146],89.9415,[0,0,1]],["Land_Plank_01_8m_F",[-10.049,73.79,10.4226],89.9415,[0,0,1]],["Land_A_Castle_Stairs_A",[13.5904,74.0479,0.082561],88.2695,[0,0,1]],["Land_Plank_01_8m_F",[-13.8298,73.7456,10.4176],89.9415,[0,0,1]],["Land_Plank_01_8m_F",[13.1035,74.0254,10.3666],89.9415,[0,0,1]],["Land_A_Castle_Wall1_20",[16.4863,74.396,-0.00143909],-0.727524,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.0628,74.0552,0.12956],-0.727524,[0,0,1]],["Land_A_Castle_Wall1_Corner",[26.2914,73.7334,0.129561],91.1525,[0,0,1]],["Land_A_Castle_Wall1_Corner",[-27.4027,73.3696,-0.00143909],-0.609543,[0,0,1]]],
					[
						["valor_woodenboard",300],
						["valor_cliff_stone_medium",400],
						["valor_cement_bag",300],
						["valor_cinder_blocks",450]
					],
					[70,120],
					["bandit_3","hero_3"],
					7
				]
			};

			case 4: // build complete rdy
			{
				[
					[["valor_drawBridge",[0.177551,12.6797,-0.00143909],-180.179,[0,0,1]],["Land_A_Castle_Gate",[0.0612793,22.0542,0.12956],-180.179,[0,0,1]],["Land_A_Castle_Stairs_A",[-15.7947,18.8281,-0.00143862],-89.9265,[0,0,1]],["Land_Plank_01_8m_F",[-13.718,18.5952,10.1966],-89.0715,[0,0,1]],["Land_A_Castle_Wall1_20",[17.5197,18.4165,-0.00143909],177.792,[0,0,1]],["Land_Plank_01_8m_F",[14.1957,18.7373,10.3126],-91.3525,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.0032,18.3154,-0.00143909],-179.88,[0,0,1]],["Land_Plank_01_8m_F",[-11.7035,21.0269,10.5144],42.351,[-0.161788,0.0311132,0.986335]],["Land_Plank_01_8m_F",[11.7524,21.4072,10.5862],-33.9486,[0.121581,-0.007209,0.992555]],["Land_Plank_01_4m_F",[-7.3645,23.5903,10.6423],-93.5138,[0.186249,0.000580311,0.982502]],["Land_Plank_01_4m_F",[7.55774,24.1826,10.5491],86.0297,[-0.168042,-0.000523581,0.98578]],["Land_Plank_01_8m_F",[-17.897,21.7793,10.1806],-3.76254,[0,0,1]],["Land_Plank_01_8m_F",[18.1356,22.6177,10.3696],0.974487,[0,0,1]],["Land_Plank_01_8m_F",[-18.3348,29.1323,10.4516],-3.76254,[0,0,1]],["Land_Plank_01_8m_F",[18.2678,29.6221,10.4736],0.974487,[0,0,1]],["Land_A_Castle_Stairs_A",[15.5894,32.9385,-0.00143862],88.2695,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.6795,25.1738,0.129561],178.99,[0,0,1]],["Land_A_Castle_Bergfrit",[23.7106,25.5342,0.129561],0.891495,[0,0,1]],["Land_Plank_01_4m_F",[-20.0858,32.6558,10.4176],-87.2315,[0,0,1]],["Land_Plank_01_8m_F",[-23.4019,32.688,10.4186],88.2705,[0,0,1]],["Land_Plank_01_8m_F",[22.8828,33.1665,10.4366],-89.7235,[0,0,1]],["Land_i_Stone_Shed_V1_F",[21.6772,36.2388,0.129561],90.2645,[0,0,1]],["Land_Plank_01_8m_F",[-26.9594,36.0386,10.4036],-0.442551,[0,0,1]],["valor_CargoNet",[24.7526,38.9946,0.389561],176.637,[0,0,1]],["Land_Plank_01_8m_F",[26.8849,36.335,10.4316],-0.932526,[0,0,1]],["valor_baseFloor60",[0.0392456,45.8086,-1.68544],-180.179,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.6269,41.9766,0.12956],-91.5995,[0,0,1]],["Land_A_Castle_Wall1_20",[27.2083,42.9614,0.12956],89.3055,[0,0,1]],["Land_Fuel_tank_stairs",[25.0226,45.0874,-0.00143909],-90.0355,[0,0,1]],["Land_Plank_01_8m_F",[26.8034,43.9019,10.3846],-0.932526,[0,0,1]],["Land_Plank_01_8m_F",[-27.1863,43.7051,10.3646],-2.82155,[0,0,1]],["Land_Plank_01_8m_F",[-27.4626,51.1758,10.3766],-0.857529,[0,0,1]],["Land_Plank_01_8m_F",[26.7343,51.6279,10.3556],-0.932526,[0,0,1]],["Land_A_Castle_Stairs_A",[-14.3667,59.9028,-0.00943899],-89.9265,[0,0,1]],["Land_Plank_01_8m_F",[26.6505,56.0703,10.3846],-0.932526,[0,0,1]],["Land_Plank_01_8m_F",[19.8348,59.1685,10.5376],-91.2195,[0,0,1]],["Land_Plank_01_8m_F",[-27.4303,56.2378,10.4176],1.20949,[0,0,1]],["Land_Plank_01_8m_F",[-20.4487,59.5747,10.4076],89.9425,[0,0,1]],["Land_Plank_01_8m_F",[22.8198,59.1709,10.4916],-91.2195,[0,0,1]],["Land_Plank_01_8m_F",[-23.7427,59.5967,10.4116],92.3785,[0,0,1]],["Land_Plank_01_8m_F",[16.3298,62.9985,10.5756],0.974487,[0,0,1]],["Land_Plank_01_8m_F",[-16.8627,63.0962,10.4026],178.779,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.8925,62.0454,0.12956],-90.1895,[0,0,1]],["Land_A_Castle_Wall1_20",[26.9873,63.5146,0.12956],89.3055,[0,0,1]],["Land_A_Castle_Bergfrit",[21.7774,66.6782,0.129561],0.891495,[0,0,1]],["Land_A_Castle_Bergfrit",[-22.3015,67.1709,0.129561],178.99,[0,0,1]],["Land_Plank_01_8m_F",[16.4619,69.6992,10.4276],0.974487,[0,0,1]],["Land_Plank_01_8m_F",[-16.9999,69.8955,10.4066],178.779,[0,0,1]],["Land_A_Castle_Wall1_20",[-3.74689,74.0903,0.12956],-0.727524,[0,0,1]],["Land_Plank_01_8m_F",[-2.31293,73.8057,10.4266],89.9415,[0,0,1]],["Land_Plank_01_8m_F",[5.38037,74.0176,10.4146],89.9415,[0,0,1]],["Land_Plank_01_8m_F",[-10.049,73.79,10.4226],89.9415,[0,0,1]],["Land_A_Castle_Stairs_A",[13.5904,74.0479,0.082561],88.2695,[0,0,1]],["Land_Plank_01_8m_F",[-13.8298,73.7456,10.4176],89.9415,[0,0,1]],["Land_Plank_01_8m_F",[13.1035,74.0254,10.3666],89.9415,[0,0,1]],["Land_A_Castle_Wall1_20",[16.4863,74.396,-0.00143909],-0.727524,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.0628,74.0552,0.12956],-0.727524,[0,0,1]],["Land_A_Castle_Wall1_Corner",[26.2914,73.7334,0.129561],91.1525,[0,0,1]],["Land_A_Castle_Wall1_Corner",[-27.4027,73.3696,-0.00143909],-0.609543,[0,0,1]]],
					[
						["valor_woodenboard",350],
						["valor_cliff_stone_medium",450],
						["valor_cement_bag",350],
						["valor_cinder_blocks",500]
					],
					[70,120],
					["bandit_3","hero_3"],
					7
				]
			};
		};

	};


	case 8: // Wall Entrance
	{
		switch (_state) do
		{
			case 0:
			{
				[
					[["Land_Gate_IndVar2_5",[0.218506,4.55566,-0.00143909],-358.073,[0,0,1]]],
					[
						["valor_cinder_blocks",3],
						["valor_ducttape",4],
						["valor_torquewrench_01",1]
					],
					[15,30],
					["bandit_3"]
				]
			};
		};

	};


	case 9: // Wall
	{
		switch (_state) do
		{
			case 0:
			{
				[
					[["zed_kamenna",[0.282959,4.3252,-0.00143909],-359.942,[0,0,1]]],
					[
						["valor_cinder_blocks",2],
						["valor_ducttape",2],
						["valor_torquewrench_01",1]
					],
					[15,30],
					["bandit_3"]
				]
			};
		};

	};


	case 10: // Lookout Tower
	{
		switch (_state) do
		{
			case 0:
			{
				[
					[["Land_Hlaska",[-0.0986328,3.97241,-0.00143909],-1.67186,[0,0,1]]],
					[
						["valor_torquewrench_01",5]
					],
					[15,30],
					["bandit_3"]
				]
			};
		};

	};


	case 11: // Stairs
	{
		switch (_state) do
		{
			case 0:
			{
				[
					[["Land_GH_Stairs_F",[0.0717773,5.27856,1.00162],269.569,[0,0,1]]],
					[
						["valor_cinder_blocks",3],
						["valor_ducttape",1],
						["valor_torquewrench_01",1]
					],
					[15,30],
					["bandit_3"]
				]
			};
		};

	};

	default
	{
		[]
	};

};

if(_base isEqualTo true) then {
	_base = [];
};
_base
