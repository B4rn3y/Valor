_id = param[0,-1,[0]];
if(_id isEqualTo -1) exitWith {[]};
_base = [];

_base = switch (_id) do
{
	case 0:
	{
		[
			[["Land_Net_Fence_Gate_F",[1.61523,6.89648,-0.00143909],-180.523,[0,0,1]],["Land_Wall_IndCnc_4_F",[-4.44775,6.95654,-0.00143909],-180.523,[0,0,1]],["Land_Wall_IndCnc_4_F",[-7.37256,6.99927,-0.00143909],-180.523,[0,0,1]],["Land_Wall_IndCnc_4_F",[7.65283,6.9895,-0.00143909],-180.523,[0,0,1]],["Land_Slum_House02_F",[6.41113,10.8564,-0.00143909],-0.665161,[0,0,1]],["Land_Wall_IndCnc_4_F",[10.4683,10.1641,-0.00143909],89.2915,[0,0,1]],["Land_i_Stone_HouseSmall_V3_F",[-4.6499,17.0762,-0.00143909],-89.0924,[0,0,1]],["Land_Wall_IndCnc_4_F",[10.3867,16.1348,-0.00143909],89.2915,[0,0,1]],["B_CargoNet_01_ammo_F",[-4.69043,19.2661,1.24218],-180.523,[-6.94542e-005,-0.00445413,0.99999]],["Land_Cargo_House_V2_F",[4.3623,22.9587,-0.00143909],90.1682,[0,0,1]],["Land_Wall_IndCnc_4_F",[10.0918,22.0698,-0.00143909],85.3399,[0,0,1]],["Land_Wall_IndCnc_4_F",[9.98828,23.907,-0.00143909],86.1217,[0,0,1]],["Land_Wall_IndCnc_4_F",[0.811523,26.8264,-0.00143909],-179.458,[0,0,1]],["Land_Wall_IndCnc_4_F",[-0.244141,26.8472,-0.00143909],-179.458,[0,0,1]],["Land_Wall_IndCnc_4_F",[6.75781,26.7957,-0.00143909],-179.458,[0,0,1]],["CUP_t_pyrus2sW",[9.02393,25.7517,-0.00143909],-180.523,[0,0,1]]],
			["B_CargoNet_01_ammo_F",[0.208008,15.4739,-0.00143909],-180.153,[5.32471e-007,5.02285e-007,1]],
			[
				["valor_ducttape",1]
			],
			[15,40]
		]
	};

	/*
	case 1:
	{
		[
			[["Land_Net_Fence_Gate_F",[0.225098,10.1538,0.0149784],1.14545,[0,0,1]],["Land_A_Castle_Gate",[0.241455,16.1934,-0.00143909],-178.52,[0,0,1]],["Land_Net_Fence_Gate_F",[0.442871,22.4016,-0.00143909],-177.954,[0,0,1]],["Land_Plank_01_4m_F",[8.07397,19.2952,10.8247],-131.486,[-0.291541,-0.16961,0.941401]],["Land_Plank_01_4m_F",[-7.04517,20.572,10.8848],114.767,[0.415595,-0.278625,0.865823]],["Land_A_Castle_Stairs_A",[-7.63965,24.3364,-0.00143862],-128.972,[0,0,1]],["Land_Cliff_boulder_F",[16.0698,22.1692,-0.00143909],45.0621,[0,0,1]],["Land_HighVoltageTower_dam_F",[-20.8118,16.5088,-0.00143909],135.858,[0,0,1]],["Land_Cliff_boulder_F",[-16.04,23.1499,-0.00143909],138.882,[0,0,1]],["Land_Plank_01_8m_F",[-10.6965,24.7007,11.6886],-43.0001,[0,0,1]],["Land_Plank_01_8m_F",[12.4006,24.5549,11.267],-138.288,[0,0,1]],["Land_HBarrier_5_F",[-2.94482,31.334,-0.00143909],-46.1525,[0,0,1]],["Land_HBarrier_5_F",[-2.89404,31.2988,1.09779],-46.1525,[0,0,1]],["Land_A_Castle_Wall1_20",[16.0952,28.4373,0.993661],131.429,[0,0,1]],["Land_A_Castle_Wall1_20",[-15.0906,28.957,1.41439],-132.224,[0,0,1]],["Land_HBarrier_5_F",[1.42065,33.6533,-0.00143909],165.709,[0,0,1]],["Land_HBarrier_5_F",[1.39648,33.7104,1.09779],165.709,[0,0,1]],["Land_Plank_01_4m_F",[-15.8472,30.3264,11.2623],104.307,[0.418045,-0.0107972,0.908362]],["Land_Plank_01_8m_F",[17.365,30.4575,11.2015],-139.435,[0,0,1]],["Land_Plank_01_8m_F",[-19.2214,34.0442,11.6982],-43.0001,[0,0,1]],["Land_A_Castle_Stairs_A",[-19.2695,36.1379,-0.00143862],-88.0866,[0,0,1]],["Land_Plank_01_8m_F",[21.0813,36.0266,11.0755],-165.714,[0.0358128,0.117334,0.992447]],["Land_Plank_01_8m_F",[-21.1843,39.2146,11.1954],178.91,[0.00538392,0.208453,0.978018]],["Land_A_Castle_Bergfrit",[27.7117,41.2417,-0.00143909],2.545,[0,0,1]],["Land_Plank_01_8m_F",[22.2813,45.231,10.6096],-178.52,[0,0,1]],["Land_i_Stone_Shed_V1_F",[-13.2083,49.8108,0.588154],-41.8081,[0,0,1]],["Land_Plank_01_8m_F",[-21.2905,46.2583,10.3592],178.966,[0,0,1]],["Land_A_Castle_Bergfrit",[-26.8813,43.4343,-0.00143909],180.271,[0,0,1]],["Land_A_Castle_Stairs_A",[19.8911,48.8005,-0.00143862],91.9874,[0,0,1]],["B_CargoNet_01_ammo_F",[-17.512,50.447,0.847154],137.254,[-1.86657e-006,3.34575e-006,1]],["Land_Plank_01_4m_F",[21.2966,49.8145,10.4244],143.72,[-0.108279,0.0612926,0.992229]],["Land_Plank_01_8m_F",[-18.2095,52.1404,10.2993],45.4302,[0,0,1]],["Land_Plank_01_8m_F",[18.4075,53.522,10.1236],141.819,[0,0,1]],["Land_A_Castle_Wall1_20",[17.8667,54.708,-0.00143909],52.1909,[0,0,1]],["Land_A_Castle_Wall1_20",[-14.5942,56.1287,-0.00143909],-43.7568,[0,0,1]],["Land_Fuel_tank_stairs",[-9.05688,57.9844,-0.00143909],132.686,[0,0,1]],["Land_Plank_01_8m_F",[-12.8088,57.5146,10.295],45.4302,[0,0,1]],["Land_spp_Panel_Broken_F",[-19.5452,58.502,-0.00143909],134.178,[0,0,1]],["Land_Plank_01_8m_F",[13.6331,59.5151,10.139],141.819,[0,0,1]],["Land_Plank_01_8m_F",[-9.27905,60.7146,10.2866],49.8152,[0,0,1]],["Land_PowerLine_distributor_F",[-11.4395,63.5869,-0.00143909],-40.6844,[0,0,1]],["Land_Plank_01_4m_F",[10.3433,64.2859,10.3087],-178.424,[0,0,1]],["Land_Plank_01_8m_F",[-5.48218,67.0066,10.2795],2.2532,[0,0,1]],["Land_Plank_01_4m_F",[10.4868,67.0029,10.2741],-178.424,[0,0,1]],["Land_A_Castle_Bastion",[2.44971,70.2043,-0.00143909],2.00993,[0,0,1]],["Land_Plank_01_4m_F",[10.4978,69.342,10.2893],179.976,[0,0,1]],["Land_Plank_01_4m_F",[-4.69531,72.532,10.2727],-156.537,[0,0,1]],["Land_Plank_01_4m_F",[9.7063,73.0029,10.1879],155.251,[0,0,1]],["Land_Plank_01_4m_F",[-2.52466,75.5657,10.2658],48.8106,[0,0,1]],["Land_Plank_01_4m_F",[7.34448,75.7603,10.2284],126.606,[0.0424528,-0.00109647,0.999098]],["Land_Plank_01_4m_F",[0.664063,77.187,10.2969],78.471,[0,0,1]],["Land_Plank_01_4m_F",[4.12817,77.1895,10.3136],101.892,[0,0,1]]],
			["B_CargoNet_01_ammo_F",[0.208008,15.4739,-0.00143909],-180.153,[5.32471e-007,5.02285e-007,1]],
			[
				["valor_ducttape",1]
			],
			[40,80] // min distance and max distance for raptor
		]
	};
	*/


	case 1:
	{
		[
			[["valor_drawBridge",[-0.0222168,9.91357,-0.00143909],-180.314,[0,0,1]],["Land_A_Castle_Gate",[-0.161011,19.2876,0.129474],-180.314,[0,0,1]],["Land_A_Castle_Stairs_A",[-16.0096,16.0234,-0.00143862],-90.062,[0,0,1]],["Land_Plank_01_8m_F",[-13.9326,15.7954,10.1966],-89.2072,[0,0,1]],["Land_A_Castle_Wall1_20",[17.3063,15.6909,-0.00143909],177.657,[0,0,1]],["Land_Plank_01_8m_F",[13.9815,16.0034,10.3122],-91.4884,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.2167,15.5054,-0.00143909],-180.015,[0,0,1]],["Land_Plank_01_8m_F",[-11.9233,18.2319,10.5139],42.2154,[-0.161867,0.0307375,0.986334]],["Land_Plank_01_8m_F",[11.5317,18.667,10.5859],-34.0836,[0.121592,-0.0069178,0.992556]],["Land_Plank_01_4m_F",[-7.59009,20.8052,10.6423],-93.6491,[0.186239,0.00102072,0.982504]],["Land_Plank_01_4m_F",[7.33075,21.4336,10.5494],85.8944,[-0.168042,-0.000920985,0.985779]],["Land_Plank_01_8m_F",[-18.1184,18.9692,10.1803],-3.8981,[0,0,1]],["Land_Plank_01_8m_F",[17.9117,19.8931,10.3692],0.839264,[0,0,1]],["Land_Plank_01_8m_F",[-18.5742,26.3218,10.4516],-3.8981,[0,0,1]],["Land_Plank_01_8m_F",[18.0273,26.8979,10.4738],0.839264,[0,0,1]],["Land_A_Castle_Stairs_A",[15.3416,30.2085,-0.00143862],88.1337,[0,0,1]],["Land_A_Castle_Bergfrit",[-23.9091,22.3496,0.129474],178.855,[0,0,1]],["Land_A_Castle_Bergfrit",[23.4799,22.8228,0.129474],0.755936,[0,0,1]],["Land_Plank_01_4m_F",[-20.3329,29.8413,10.4178],-87.3671,[0,0,1]],["Land_Plank_01_8m_F",[22.6339,30.4536,10.4366],-89.8592,[0,0,1]],["Land_Plank_01_8m_F",[-23.6489,29.8662,10.4189],88.1351,[0,0,1]],["Land_i_Stone_Shed_V1_F",[21.4213,33.5234,0.129495],90.1285,[0,0,1]],["B_CargoNet_01_ammo_F",[24.4899,36.2852,0.388494],176.502,[7.11857e-007,3.62504e-006,1]],["Land_Plank_01_8m_F",[26.6288,33.6309,10.4316],-1.06807,[0,0,1]],["Land_Plank_01_8m_F",[-27.2151,33.2075,10.4038],-0.578018,[0,0,1]],["valor_baseFloor60",[-0.239075,43.0415,-1.6853],-180.314,[0,0,1]],["Land_A_Castle_Wall1_20",[-27.896,39.144,0.129479],-91.7353,[0,0,1]],["Land_A_Castle_Wall1_20",[26.9369,40.2578,0.129478],89.1703,[0,0,1]],["Land_Fuel_tank_stairs",[24.7462,42.3794,-0.00143909],-90.1706,[0,0,1]],["Land_Plank_01_8m_F",[26.5289,41.1978,10.3849],-1.06807,[0,0,1]],["Land_Plank_01_8m_F",[-27.46,40.8735,10.3646],-2.95653,[0,0,1]],["Land_Plank_01_8m_F",[26.4415,48.9229,10.3558],-1.06807,[0,0,1]],["Land_Plank_01_8m_F",[-27.7539,48.3438,10.3764],-0.992798,[0,0,1]],["Land_A_Castle_Stairs_A",[-14.6786,57.1016,-0.00921488],-90.062,[0,0,1]],["Land_Plank_01_8m_F",[26.3477,53.3662,10.3849],-1.06807,[0,0,1]],["Land_Plank_01_8m_F",[19.525,56.4473,10.538],-91.3547,[0,0,1]],["Land_Plank_01_8m_F",[-27.7337,53.4058,10.4178],1.07404,[0,0,1]],["Land_Plank_01_8m_F",[-20.7595,56.7593,10.4075],89.8072,[0,0,1]],["Land_Plank_01_8m_F",[22.5092,56.457,10.4914],-91.3547,[0,0,1]],["Land_Plank_01_8m_F",[-24.0543,56.7729,10.4115],92.243,[0,0,1]],["Land_Plank_01_8m_F",[16.011,60.2695,10.5754],0.839264,[0,0,1]],["Land_Plank_01_8m_F",[-17.1815,60.2881,10.4027],178.644,[0,0,1]],["Land_A_Castle_Wall1_20",[-28.209,59.2119,0.129481],-90.3248,[0,0,1]],["Land_A_Castle_Wall1_20",[26.6668,60.811,0.129481],89.1703,[0,0,1]],["Land_A_Castle_Bergfrit",[21.4498,63.9629,0.129481],0.755936,[0,0,1]],["Land_A_Castle_Bergfrit",[-22.6308,64.3506,0.129481],178.855,[0,0,1]],["Land_Plank_01_8m_F",[16.1264,66.9697,10.4275],0.839264,[0,0,1]],["Land_Plank_01_8m_F",[-17.3358,67.0884,10.4069],178.644,[0,0,1]],["Land_A_Castle_Wall1_20",[-4.09192,71.314,0.129483],-0.862991,[0,0,1]],["Land_Plank_01_8m_F",[-2.65784,71.0322,10.4269],89.8058,[0,0,1]],["Land_Plank_01_8m_F",[5.03558,71.2622,10.4141],89.8058,[0,0,1]],["Land_Plank_01_8m_F",[-10.3939,70.999,10.4228],89.8058,[0,0,1]],["Land_A_Castle_Stairs_A",[13.2446,71.3125,0.0825477],88.1337,[0,0,1]],["Land_Plank_01_8m_F",[-14.174,70.9453,10.418],89.8058,[0,0,1]],["Land_Plank_01_8m_F",[12.7578,71.2896,10.3666],89.8058,[0,0,1]],["Land_A_Castle_Wall1_20",[16.1405,71.6675,-0.00143909],-0.862991,[0,0,1]],["Land_A_Castle_Wall1_20",[-18.4081,71.2451,0.129483],-0.862991,[0,0,1]],["Land_A_Castle_Wall1_Corner",[25.9464,71.0283,0.129483],91.0166,[0,0,1]],["Land_A_Castle_Wall1_Corner",[-27.746,70.5371,-0.00143909],-0.744644,[0,0,1]]],
			["B_CargoNet_01_ammo_F",[0.208008,15.4739,-0.00143909],-180.153,[5.32471e-007,5.02285e-007,1]],
			[
				["valor_ducttape",1]
			],
			[40,80] // min distance and max distance for raptor
		]
	};

};


_base
