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
					[["Land_PoleWall_02_end_F",[6.1908,15.5576,0.301023],0.0809021,[0,0,1]],["valor_baseFloor8x15",[0.238617,16.76,-0.00143909],-269.169,[0,0,1]],["Land_House_1W10_ruins_F",[-1.26764,18.094,0.301024],-359.913,[0,0,1]],["Land_PoleWall_02_end_F",[4.68802,18.3372,0.301023],-270.874,[0,0,1]],["B_CargoNet_01_ammo_F",[6.08005,18.2405,0.300023],-359.912,[2.56034e-006,-3.98613e-006,1]],["Land_PoleWall_02_end_F",[7.72598,18.4114,0.301023],-90.1165,[0,0,1]],["Land_PoleWall_02_end_F",[6.19812,19.9121,0.301023],-180.25,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[-1.56589,13.0203,1.98369],-0.696875,[0,0,1]],["Russell_Barricade02",[1.12482,14.2131,1.86062],265.577,[0,0,1]],["Russell_Barricade01",[1.10257,14.2339,2.08086],270.208,[0,0,1]],["B_CargoNet_01_ammo_F",[-0.802231,14.8032,1.07235],359.303,[0.0018488,-0.00186349,0.999996]],["Russell_Barricade02",[2.77048,15.0735,1.96853],-0.696875,[0,0,1]],["Russell_Barricade01",[2.83334,15.0862,2.15667],-0.696875,[0,0,1]],["valor_baseFloor8x15",[-0.0317459,16.6423,-0.00143909],90.0462,[0,0,1]],["Russell_Barricade01",[-6.30962,15.5188,1.47654],88.5321,[0,0,1]],["Russell_Barricade01",[-6.33858,15.5164,1.63495],88.5321,[0,0,1]],["Land_ds_HouseV_3I1",[0.476273,16.9673,0.301023],-0.696875,[0,0,1]],["Russell_Barricade01",[-6.33328,16.9717,1.61281],88.5321,[0,0,1]],["Russell_Barricade01",[-6.32428,16.9719,1.76879],88.5321,[0,0,1]],["Russell_Barricade01",[-6.36331,18.3716,1.76386],88.5321,[0,0,1]],["Russell_Barricade02",[-6.36172,18.4055,1.54076],86.9121,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-1.47476,19.8359,2.07002],179.251,[0,0,1]],["Russell_Barricade01",[-5.29453,19.7334,2.01912],-0.696875,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[4.77541,19.9419,2.04889],-0.696875,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
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
					[["Land_PoleWall_02_end_F",[4.67874,12.6072,0.361516],-358.65,[0,0,1]],["Land_PoleWall_02_end_F",[1.86536,14.2151,0.361516],-268.452,[0,0,1]],["B_CargoNet_01_ammo_F",[4.55008,14.2571,0.360516],-268.446,[1.36969e-007,-2.5547e-007,1]],["Land_PoleWall_02_end_F",[6.2182,14.0964,0.361516],-88.7832,[0,0,1]],["Land_PoleWall_02_end_F",[4.68228,15.6462,0.361516],-179.407,[0,0,1]],["valor_baseFloor11x12_5",[0.404755,17.8811,-0.00143909],-268.195,[0,0,1]],["Land_Rail_Station_Small_ruins_F",[-0.560059,19.1343,0.361516],-359.507,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[-2.43286,11.771,1.27342],-1.8551,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-4.70923,13.6529,1.35992],-272.257,[0,0,1]],["Land_House_1W09_F",[0.0446777,15.0049,0.361516],-272.257,[0,0,1]],["valor_baseFloor11x12_5",[0.0874023,17.1075,-0.00143909],-180.944,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-4.89893,18.5724,1.37133],-272.257,[0,0,1]],["B_CargoNet_01_ammo_F",[-1.97559,19.3994,0.935348],-272.256,[-1.68634e-007,-6.1499e-007,1]],["Land_Shoot_House_Wall_Long_Stand_F",[4.69507,18.9134,1.61912],-92.3089,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-1.78784,22.3545,1.39788],-182.506,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
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
					[["Land_PoleWall_02_end_F",[5.50366,9.52319,0.497626],359.809,[0,0,1]],["Land_PoleWall_02_end_F",[3.9877,12.2954,0.497626],88.8542,[0,0,1]],["B_CargoNet_01_ammo_F",[5.38016,12.2056,0.496624],-0.183743,[-7.72983e-007,1.01267e-006,1]],["Land_PoleWall_02_end_F",[7.02524,12.384,0.497626],269.612,[0,0,1]],["Land_PoleWall_02_end_F",[5.4903,13.8777,0.497626],179.478,[0,0,1]],["valor_baseFloor16x17",[-0.782318,16.2083,-0.00143909],268.723,[0,0,1]],["Land_Garaz_mala_ruins",[-5.67651,18.1631,0.497624],-0.184437,[0,0,1]],["Land_House_1W02_ruins_F",[1.4686,19.1985,0.497625],-0.184437,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
				]
			};

			case 1: // build complete
			{
				[
					[["Land_House_2W02_F",[3.49978,14.9553,0.497625],268.025,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-1.48562,15.0754,4.48237],88.5754,[-0.00316481,0.112959,0.993595]],["valor_baseFloor16x17",[0.223198,16.7463,-0.00143909],268.025,[0,0,1]],["Land_Garaz_mala",[-4.17717,16.6909,0.512749],178.389,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[8.01679,16.7417,1.73164],268.025,[0,0,1]],["Russell_Barricade01",[6.87215,17.604,4.34562],268.056,[0,0,1]],["Russell_Barricade02",[6.83025,18.2302,4.05632],87.8188,[0,0,1]],["B_CargoNet_01_ammo_F",[2.93703,19.9177,1.28791],268.025,[-1.79558e-006,2.4786e-006,1]],["Russell_Barricade02",[6.8117,18.7969,4.05632],268.025,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[7.96296,18.7561,1.72489],268.025,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[7.89207,20.748,1.72854],268.025,[0,0,1]],["Russell_Barricade02",[-1.73064,22.3147,4.2744],268.025,[0,0,1]],["Russell_Barricade01",[-1.74402,22.3271,4.48044],268.025,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[1.9958,24.5361,1.65739],178.057,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[1.97655,24.5554,4.63837],178.057,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
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
					[["Land_PoleWall_02_end_F",[5.06987,13.5913,0.301023],357.75,[0,0,1]],["Land_Rail_Station_Small_ruins_F",[-1.40123,15.0103,0.301024],-2.24347,[0,0,1]],["valor_baseFloor7x13",[0.301865,15.1377,-0.00143909],87.6687,[0,0,1]],["Land_PoleWall_02_end_F",[3.48676,16.4348,0.301023],86.7951,[0,0,1]],["B_CargoNet_01_ammo_F",[5.06032,16.2109,0.300023],357.756,[-1.30064e-008,1.06423e-007,1]],["Land_PoleWall_02_end_F",[6.52365,16.592,0.301023],267.553,[0,0,1]],["Land_PoleWall_02_end_F",[4.92151,18.0439,0.301023],177.419,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[0.651375,15.1199,1.27529],-179.448,[0,0,1]],["Land_House_1W10_F",[-0.196503,15.6533,0.301023],-179.448,[0,0,1]],["valor_baseFloor7x13",[-0.263596,17.6775,-0.00143909],-89.5361,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[5.41516,17.603,1.36352],90.1371,[0,0,1]],["B_CargoNet_01_ammo_F",[4.0965,18.7537,0.944557],180.548,[-0.00520318,4.9476e-005,0.999987]],["Land_Shoot_House_Wall_Stand_F",[-1.30423,20.0811,1.36818],-179.448,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[3.23196,20.1338,1.41979],180.286,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
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
					[["Land_Rail_Station_Small_ruins_F",[-1.47099,16.4534,0.407451],-0.172056,[0,0,1]],["Land_PoleWall_02_end_F",[5.60117,15.6311,0.40745],359.821,[0,0,1]],["valor_baseFloor8_5x14",[0.453125,16.5334,0.104987],89.5774,[0,0,1]],["Land_PoleWall_02_end_F",[4.08581,18.4036,0.40745],88.8666,[0,0,1]],["B_CargoNet_01_ammo_F",[5.4776,18.3147,0.406429],-0.170722,[-9.11246e-006,-3.90183e-005,1]],["Land_PoleWall_02_end_F",[7.12341,18.4917,0.40745],269.624,[0,0,1]],["Land_PoleWall_02_end_F",[5.58877,19.9856,0.40745],179.49,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[-1.207,13.344,1.83206],-0.382934,[0,0,1]],["Land_Shoot_House_Wall_F",[1.33022,14.4724,0.90726],88.217,[0,0,1]],["B_CargoNet_01_ammo_F",[-0.789749,15.3569,1.07064],359.617,[-2.69291e-007,-2.21235e-007,1]],["Land_House_1W08_F",[-0.366104,15.4646,0.301023],-0.382934,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[3.147,15.3669,2.02945],-0.382934,[0,0,1]],["valor_baseFloor8_5x14",[0.381313,16.9014,-0.00143909],89.3665,[0,0,1]],["Russell_Barricade01",[-6.07546,15.8401,1.39979],88.8461,[0,0,1]],["Russell_Barricade01",[-6.08447,15.8401,1.55266],88.8461,[0,0,1]],["Russell_Barricade01",[-6.08219,17.158,1.47781],88.8461,[0,0,1]],["Russell_Barricade01",[-6.07319,17.158,1.58253],88.8461,[0,0,1]],["Russell_Barricade01",[-6.09412,18.4939,1.4293],88.8461,[0,0,1]],["Russell_Barricade01",[-6.08513,18.4939,1.56717],88.8461,[0,0,1]],["Russell_Barricade01",[-6.09399,19.1206,1.46723],88.8461,[0,0,1]],["Russell_Barricade01",[-6.08499,19.1206,1.58683],88.8461,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-0.0606995,20.2581,2.1889],-0.382934,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-2.39581,20.2268,2.16842],-0.382934,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[5.06698,20.2505,2.16527],-0.382934,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
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
					[["Land_PoleWall_02_end_F",[4.86567,10.9658,0.512746],-268.69,[0,0,1]],["Land_PoleWall_02_end_F",[7.68569,9.36963,0.512746],-358.887,[0,0,1]],["B_CargoNet_01_ammo_F",[7.55022,11.0188,0.511748],-268.683,[4.62296e-007,-2.29975e-006,1]],["Land_PoleWall_02_end_F",[9.21901,10.865,0.512746],-89.0204,[0,0,1]],["Land_PoleWall_02_end_F",[7.67668,12.4084,0.512746],-179.644,[0,0,1]],["valor_baseFloor15_5x20",[0.256241,16.4783,-0.00143909],-269.189,[0,0,1]],["Land_House_2W05_ruins_F",[2.6627,18.3391,0.512747],-359.894,[0,0,1]],["Land_Garaz_mala_ruins",[-5.93516,17.7466,0.512749],-359.894,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
				]
			};

			case 1: // build complete
			{
				[
					[["Land_Shoot_House_Wall_Stand_F",[1.10539,10.9761,1.50682],-178.729,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-0.980972,11.0496,1.52759],-178.729,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[-0.432281,10.9409,4.07755],1.00076,[0,0,1]],["Land_Shoot_House_Wall_Long_Stand_F",[2.36377,10.8892,4.06406],1.00076,[0,0,1]],["B_CargoNet_01_ammo_F",[-0.476517,13.3457,3.81998],-358.733,[7.59413e-007,6.71616e-007,1]],["Land_Shoot_House_Wall_Stand_F",[-2.43692,12.9443,4.20522],-90.0611,[0,0,1]],["Land_Garaz_mala",[-5.55424,14.5066,0.512749],-179.472,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[9.47018,12.9026,1.45275],-269.395,[0,0,1]],["valor_baseFloor15_5x20",[0.391083,16.2783,-0.00143909],-268.027,[0,0,1]],["Land_Shoot_House_Wall_Stand_F",[-2.42497,16.6504,4.21022],-90.0611,[0,0,1]],["Land_House_2W05_F",[5.65977,16.4595,0.512748],-358.733,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[15,30]
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
					[["Land_A_Castle_Gate_ruins",[-0.019104,23.564,0.129474],-178.636,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[-16.8613,25.7485,0.129474],-178.636,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[23.1718,23.7168,0.129474],-178.636,[0,0,1]],["Land_PoleWall_02_end_F",[6.54773,44.0781,0.129478],3.38211,[0,0,1]],["valor_baseFloor60",[2.00757,42.9263,-1.6853],-178.636,[0,0,1]],["Land_PoleWall_02_end_F",[5.08881,45.71,0.129478],-88.3489,[0,0,1]],["B_CargoNet_01_ammo_F",[6.83966,45.6704,0.128475],181.364,[1.20044e-006,3.30296e-006,1]],["Land_PoleWall_02_end_F",[9.90894,45.5249,0.129478],-88.3489,[0,0,1]],["Land_PoleWall_02_end_F",[6.57422,47.1919,0.129478],181.346,[0,0,1]],["Land_A_Castle_Wall2_30_ruins",[23.1497,44.4082,0.129478],90.5969,[0,0,1]],["Land_A_Castle_Wall2_30_ruins",[-19.5811,47.1587,0.129478],-89.3477,[0,0,1]],["Land_A_Castle_Wall2_30_ruins",[2.26233,64.2417,0.129481],0.844467,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[-16.0488,65.5098,0.129481],-178.636,[0,0,1]],["Land_A_Castle_Bergfrit_ruins",[24.1594,64.3042,0.129481],-178.636,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[50,80]
				]
			};


			case 1: // in build rdy
			{
				[
					[["valor_drawBridge",[0.140381,9.97559,-0.00143909],-180.76,[0,0,1]],["Land_A_Castle_Gate",[-0.0713501,19.3491,0.129474],-180.76,[0,0,1]],["Land_A_Castle_Stairs_A",[-15.894,15.9614,-0.00143862],-90.5076,[0,0,1]],["Land_Plank_01_8m_F",[-13.8154,15.7495,10.1966],-89.6528,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.097,15.4263,-0.00143909],-180.461,[0,0,1]],["Land_Plank_01_8m_F",[-11.8251,18.2017,10.5139],41.7698,[-0.162101,0.0294777,0.986334]],["Land_Plank_01_4m_F",[-7.5119,20.8086,10.6423],-94.0947,[0.186226,0.00246912,0.982504]],["Land_Plank_01_8m_F",[-18.0257,18.8911,10.1803],-4.3437,[0,0,1]],["Land_Plank_01_8m_F",[-18.5386,26.2393,10.4516],-4.3437,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.8424,22.2261,0.129474],178.41,[0,0,1]],["B_CargoNet_01_ammo_F",[-25.2803,24.0269,10.628],179.24,[-2.32857e-007,-4.67264e-007,1]],["Land_Plank_01_4m_F",[-20.3246,29.7456,10.4178],-87.8127,[0,0,1]],["Land_Plank_01_8m_F",[-23.6407,29.7446,10.4189],87.6895,[0,0,1]],["Land_Plank_01_8m_F",[-27.2328,33.0576,10.4038],-1.02362,[0,0,1]],["valor_baseFloor60",[-0.334106,43.1011,-1.6853],-180.76,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.9598,38.9888,0.129479],-92.1809,[0,0,1]],["Land_Plank_01_8m_F",[-27.5373,40.7217,10.3646],-3.40213,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[50,80]
				]
			};


			case 2: // in build rdy
			{
				[
					[["valor_drawBridge",[0.0960693,9.69482,-0.00143909],-180.57,[0,0,1]],["Land_A_Castle_Gate",[-0.0845337,19.0684,0.129474],-180.57,[0,0,1]],["Land_A_Castle_Stairs_A",[-15.9183,15.7334,-0.00143862],-90.3175,[0,0,1]],["Land_Plank_01_8m_F",[-13.8404,15.5146,10.1966],-89.4627,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.1231,15.2056,-0.00143909],-180.271,[0,0,1]],["Land_Plank_01_8m_F",[-11.8419,17.9604,10.5139],41.9599,[-0.162002,0.0300153,0.986334]],["Land_Plank_01_4m_F",[-7.52026,20.5532,10.6423],-93.9047,[0.186233,0.00185138,0.982504]],["Land_Plank_01_8m_F",[-18.0403,18.6704,10.1803],-4.15366,[0,0,1]],["Land_Plank_01_8m_F",[-18.5288,26.02,10.4516],-4.15366,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.8459,22.0249,0.129474],178.6,[0,0,1]],["Land_Plank_01_4m_F",[-20.3033,29.5322,10.4178],-87.6227,[0,0,1]],["Land_Plank_01_8m_F",[-23.6194,29.542,10.4189],87.8795,[0,0,1]],["Land_Plank_01_8m_F",[-27.2004,32.8677,10.4038],-0.833572,[0,0,1]],["valor_baseFloor60",[-0.268555,42.8218,-1.6853],-180.57,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.9077,38.8008,0.129479],-91.9908,[0,0,1]],["Land_Plank_01_8m_F",[-27.4794,40.5322,10.3646],-3.21208,[0,0,1]],["Land_Plank_01_8m_F",[-27.8067,48.0015,10.3764],-1.24835,[0,0,1]],["Land_A_Castle_Stairs_A",[-14.7706,56.8174,-0.00921488],-90.3175,[0,0,1]],["Land_Plank_01_8m_F",[-27.8091,53.064,10.4178],0.818481,[0,0,1]],["Land_Plank_01_8m_F",[-20.8499,56.4478,10.4075],89.5517,[0,0,1]],["Land_Plank_01_8m_F",[-24.1447,56.4468,10.4115],91.9874,[0,0,1]],["Land_Plank_01_8m_F",[-17.2877,59.9927,10.4027],178.389,[0,0,1]],["Land_A_Castle_Wall1_20",[-28.3102,58.8677,0.129481],-90.5804,[0,0,1]],["Land_A_Castle_Bergfrit",[-22.7551,64.0308,0.129481],178.6,[0,0,1]],["Land_Plank_01_8m_F",[-17.4722,66.792,10.4069],178.389,[0,0,1]],["Land_A_Castle_Wall1_20",[-4.24744,71.0767,0.129483],-1.11855,[0,0,1]],["B_CargoNet_01_ammo_F",[-24.2481,66.1621,10.628],176.247,[1.45849e-007,2.0822e-006,1]],["Land_Plank_01_8m_F",[-2.81207,70.8013,10.4269],89.5503,[0,0,1]],["Land_Plank_01_8m_F",[-10.5479,70.7339,10.4228],89.5503,[0,0,1]],["Land_Plank_01_8m_F",[-14.3278,70.6631,10.418],89.5503,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.5632,70.9438,0.129483],-1.11855,[0,0,1]],["Land_A_Castle_Wall1_Corner",[-27.8978,70.1943,-0.00143909],-1.0002,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[50,80]
				]
			};


			case 3: // in build
			{
				[
					[["valor_drawBridge",[0.45343,9.87744,-0.00143909],-181.141,[0,0,1]],["Land_A_Castle_Gate",[0.17926,19.2485,0.129474],-181.141,[0,0,1]],["Land_A_Castle_Stairs_A",[-15.6204,15.7563,-0.00143862],-90.8894,[0,0,1]],["Land_Plank_01_8m_F",[-13.5405,15.5586,10.1966],-90.0346,[0,0,1]],["Land_A_Castle_Wall1_20",[-17.8199,15.2065,-0.00143909],-180.842,[0,0,1]],["Land_Plank_01_8m_F",[-11.5666,18.0234,10.5139],41.388,[-0.162294,0.0283968,0.986334]],["Land_Plank_01_4m_F",[-7.27094,20.6592,10.6423],-94.4766,[0.186205,0.0037101,0.982504]],["Land_Plank_01_8m_F",[-17.7717,18.6714,10.1803],-4.72554,[0,0,1]],["Land_Plank_01_8m_F",[-18.3335,26.0166,10.4516],-4.72554,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.6105,21.9678,0.129474],178.028,[0,0,1]],["Land_Plank_01_4m_F",[-20.1429,29.5103,10.4178],-88.1945,[0,0,1]],["Land_Plank_01_8m_F",[-23.459,29.4868,10.4189],87.3076,[0,0,1]],["Land_Plank_01_8m_F",[-27.073,32.7769,10.4038],-1.40546,[0,0,1]],["valor_baseFloor60",[-0.241821,42.999,-1.6853],-181.141,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.8395,38.7021,0.129479],-92.5627,[0,0,1]],["Land_A_Castle_Wall1_20",[26.9716,40.6079,0.129478],88.3428,[0,0,1]],["Land_Plank_01_8m_F",[-27.4285,40.438,10.3646],-3.78397,[0,0,1]],["Land_Plank_01_8m_F",[26.55,41.542,10.3849],-1.89551,[0,0,1]],["Land_Plank_01_8m_F",[-27.8303,47.9038,10.3764],-1.82024,[0,0,1]],["Land_Plank_01_8m_F",[26.351,49.2651,10.3558],-1.89551,[0,0,1]],["Land_A_Castle_Stairs_A",[-14.8829,56.8491,-0.00921488],-90.8894,[0,0,1]],["Land_Plank_01_8m_F",[26.1931,53.707,10.3849],-1.89551,[0,0,1]],["Land_Plank_01_8m_F",[-27.8832,52.9658,10.4178],0.246597,[0,0,1]],["Land_Plank_01_8m_F",[19.3266,56.689,10.538],-92.1821,[0,0,1]],["Land_Plank_01_8m_F",[-20.9582,56.4189,10.4075],88.9798,[0,0,1]],["Land_Plank_01_8m_F",[22.3103,56.7417,10.4914],-92.1821,[0,0,1]],["Land_Plank_01_8m_F",[-24.2528,56.3853,10.4115],91.4155,[0,0,1]],["Land_Plank_01_8m_F",[-17.4315,59.9995,10.4027],177.817,[0,0,1]],["Land_Plank_01_8m_F",[15.7578,60.46,10.5754],0.0118256,[0,0,1]],["Land_A_Castle_Wall1_20",[-28.4424,58.7642,0.129481],-91.1523,[0,0,1]],["Land_A_Castle_Wall1_20",[26.4046,61.1558,0.129481],88.3428,[0,0,1]],["B_CargoNet_01_ammo_F",[22.4535,62.1455,10.628],175.675,[2.53006e-007,-2.65131e-006,1]],["Land_A_Castle_Bergfrit",[21.1427,64.2314,0.129481],-0.0715027,[0,0,1]],["Land_A_Castle_Bergfrit",[-22.939,63.9829,0.129481],178.028,[0,0,1]],["Land_Plank_01_8m_F",[15.7764,67.1611,10.4275],0.0118256,[0,0,1]],["Land_Plank_01_8m_F",[-17.684,66.7964,10.4069],177.817,[0,0,1]],["Land_A_Castle_Wall1_20",[-4.5025,71.2124,0.129483],-1.69043,[0,0,1]],["Land_Plank_01_8m_F",[-3.06458,70.9517,10.4269],88.9784,[0,0,1]],["Land_Plank_01_8m_F",[4.62476,71.293,10.4141],88.9784,[0,0,1]],["Land_Plank_01_8m_F",[-10.7993,70.8066,10.4228],88.9784,[0,0,1]],["Land_A_Castle_Stairs_A",[12.8322,71.4619,0.0825477],87.3063,[0,0,1]],["Land_Plank_01_8m_F",[-14.5782,70.6982,10.418],88.9784,[0,0,1]],["Land_Plank_01_8m_F",[12.3458,71.4316,10.3666],88.9784,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.8163,70.937,0.129483],-1.69043,[0,0,1]],["Land_A_Castle_Wall1_20",[15.7227,71.8584,-0.00143909],-1.69043,[0,0,1]],["Land_A_Castle_Wall1_Corner",[-28.1429,70.0947,-0.00143909],-1.57208,[0,0,1]],["Land_A_Castle_Wall1_Corner",[25.5368,71.3608,0.129483],90.1892,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[50,80]
				]
			};

			case 4: // build complete rdy
			{
				[
					[["valor_drawBridge",[-0.778015,9.55811,-0.00143909],-181.48,[0,0,1]],["Land_A_Castle_Gate",[-1.10751,18.9272,0.129474],-181.48,[0,0,1]],["Land_A_Castle_Wall1_20",[16.4294,15.687,-0.00143909],176.491,[0,0,1]],["Land_Plank_01_8m_F",[13.0989,15.9321,10.3122],-92.6542,[0,0,1]],["Land_A_Castle_Stairs_A",[-16.8863,15.3413,-0.00143862],-91.2277,[0,0,1]],["Land_Plank_01_8m_F",[-14.8052,15.1563,10.1966],-90.3729,[0,0,1]],["Land_Plank_01_8m_F",[10.5955,18.5449,10.5859],-35.2493,[0.121707,-0.00444265,0.992556]],["Land_Plank_01_8m_F",[-12.8459,17.6328,10.5139],41.0497,[-0.162458,0.0274381,0.986334]],["Land_A_Castle_Wall1_20",[-19.0825,14.7788,-0.00143909],-181.181,[0,0,1]],["Land_Plank_01_4m_F",[-8.56586,20.2939,10.6423],-94.8148,[0.18618,0.00480944,0.982504]],["Land_Plank_01_4m_F",[6.33902,21.2256,10.5494],84.7287,[-0.167988,-0.00433951,0.985779]],["Land_Plank_01_8m_F",[16.9492,19.9004,10.3692],-0.326462,[0,0,1]],["Land_Plank_01_8m_F",[-19.0547,18.2437,10.1803],-5.06383,[0,0,1]],["Land_Plank_01_8m_F",[16.9222,26.9063,10.4738],-0.326462,[0,0,1]],["Land_A_Castle_Stairs_A",[14.1696,30.1616,-0.00143862],86.968,[0,0,1]],["Land_Plank_01_8m_F",[-19.6599,25.585,10.4516],-5.06383,[0,0,1]],["Land_A_Castle_Bergfrit",[22.4566,22.9429,0.129474],-0.40979,[0,0,1]],["Land_A_Castle_Bergfrit",[-24.9129,21.5059,0.129474],177.69,[0,0,1]],["Land_Plank_01_4m_F",[-21.4899,29.0684,10.4178],-88.5328,[0,0,1]],["Land_Plank_01_8m_F",[21.4556,30.5552,10.4366],-91.0249,[0,0,1]],["Land_i_Stone_Shed_V1_F",[20.1808,33.5996,0.129495],88.9628,[0,0,1]],["Land_Plank_01_8m_F",[-24.8058,29.0259,10.4189],86.9693,[0,0,1]],["B_CargoNet_01_ammo_F",[23.1925,36.4233,0.388494],175.337,[6.34865e-007,3.71553e-006,1]],["Land_Plank_01_8m_F",[25.3851,33.813,10.4316],-2.2338,[0,0,1]],["Land_Plank_01_8m_F",[-28.4391,32.2939,10.4038],-1.74374,[0,0,1]],["valor_baseFloor60",[-1.66879,42.6748,-1.6853],-181.48,[0,0,1]],["Land_A_Castle_Wall1_20",[25.5582,40.4443,0.129478],88.0046,[0,0,1]],["Land_A_Castle_Wall1_20",[-29.2406,38.2153,0.129479],-92.901,[0,0,1]],["Land_Fuel_tank_stairs",[23.3248,42.521,-0.00143909],-91.3363,[0,0,1]],["Land_Plank_01_8m_F",[25.1311,41.3755,10.3849],-2.2338,[0,0,1]],["Land_Plank_01_8m_F",[-28.8399,39.9531,10.3646],-4.12225,[0,0,1]],["Land_Plank_01_8m_F",[24.8866,49.0981,10.3558],-2.2338,[0,0,1]],["Land_Plank_01_8m_F",[-29.2857,47.416,10.3764],-2.15852,[0,0,1]],["Land_A_Castle_Stairs_A",[-16.3913,56.438,-0.00921488],-91.2277,[0,0,1]],["Land_Plank_01_8m_F",[24.7024,53.5386,10.3849],-2.2338,[0,0,1]],["Land_Plank_01_8m_F",[17.8185,56.48,10.538],-92.5204,[0,0,1]],["Land_Plank_01_8m_F",[-29.3686,52.478,10.4178],-0.0916901,[0,0,1]],["Land_Plank_01_8m_F",[20.8018,56.5508,10.4914],-92.5204,[0,0,1]],["Land_Plank_01_8m_F",[-22.464,55.9727,10.4075],88.6415,[0,0,1]],["Land_Plank_01_8m_F",[-25.7584,55.9189,10.4115],91.0772,[0,0,1]],["Land_Plank_01_8m_F",[14.2275,60.2295,10.5754],-0.326462,[0,0,1]],["Land_Plank_01_8m_F",[-18.9586,59.5732,10.4027],177.479,[0,0,1]],["Land_A_Castle_Wall1_20",[-29.9619,58.2729,0.129481],-91.4906,[0,0,1]],["Land_A_Castle_Wall1_20",[24.87,60.9883,0.129481],88.0046,[0,0,1]],["Land_A_Castle_Bergfrit",[19.59,64.0332,0.129481],-0.40979,[0,0,1]],["Land_Plank_01_8m_F",[14.2065,66.9312,10.4275],-0.326462,[0,0,1]],["Land_A_Castle_Bergfrit",[-24.4894,63.5239,0.129481],177.69,[0,0,1]],["Land_Plank_01_8m_F",[-19.2511,66.3687,10.4069],177.479,[0,0,1]],["Land_A_Castle_Wall1_20",[-6.09604,70.8628,0.129483],-2.02872,[0,0,1]],["Land_Plank_01_8m_F",[-4.65646,70.6104,10.4269],88.6401,[0,0,1]],["Land_Plank_01_8m_F",[3.03061,70.9971,10.4141],88.6401,[0,0,1]],["Land_A_Castle_Stairs_A",[11.237,71.2144,0.0825477],86.968,[0,0,1]],["Land_Plank_01_8m_F",[-12.3902,70.4199,10.4228],88.6401,[0,0,1]],["Land_Plank_01_8m_F",[10.7508,71.1812,10.3666],88.6401,[0,0,1]],["Land_Plank_01_8m_F",[-16.1685,70.2891,10.418],88.6401,[0,0,1]],["Land_A_Castle_Wall1_20",[14.1251,71.6274,-0.00143909],-2.02872,[0,0,1]],["Land_A_Castle_Wall1_20",[-20.4079,70.5029,0.129483],-2.02872,[0,0,1]],["Land_A_Castle_Wall1_Corner",[23.9419,71.1885,0.129483],89.8509,[0,0,1]],["Land_A_Castle_Wall1_Corner",[-29.7293,69.605,-0.00143909],-1.91037,[0,0,1]]],
					[
						["valor_ducttape",20]
					],
					[50,80]
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
