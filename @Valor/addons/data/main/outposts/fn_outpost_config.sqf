private ["_outpost"];
_id = param[0,-1,[0]];
if(_id isEqualTo -1) exitWith {[]};

_outpost = switch (_id) do
{
	case 0:
	{
		[
			[["Land_Net_Fence_Gate_F",[5724.65,7327.23,0],292.033,[0,0,1],true],["Land_Canal_Wall_Stairs_F",[5720.4,7320.91,2.73425],112.783,[0,0,1],false],["Land_Canal_Wall_Stairs_F",[5726.49,7335.58,2.34897],112.783,[0,0,1],false],["Land_IronPipes_F",[5718.86,7346.69,0.0166016],208.356,[0.0125007,-0.0499286,0.998675],false],["Land_Canal_WallSmall_10m_F",[5724.96,7344.25,3.53769],58.634,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5715.54,7312.14,3.29395],113.95,[0,0,1],false],["Land_IronPipes_F",[5719.24,7347.68,0.0166016],208.356,[0.0125007,-0.0499286,0.998675],false],["Land_Canal_WallSmall_10m_F",[5718.82,7349.83,3.18848],25.6341,[0,0,1],false],["Land_Metal_Shed_F",[5700.36,7316.19,0],23.7001,[0,0,1],false],["Land_Workbench_01_F",[5705.01,7347.8,0.00216675],293.391,[-0.00458577,-0.0386414,0.999243],false,"_object addAction[""Collect"", valor_fnc_harvestitem,[""valor_Land_WoodenLog_F"",2,""Collecting metal..""],1.5,true,true,"""",""(_originalTarget distance player) < 5 && alive player""]"],["Land_Canal_WallSmall_10m_F",[5709.67,7308.25,3.44049],0,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5710.76,7353.71,2.98074],25.6341,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5701.61,7310.04,3.35767],204.507,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5693.52,7313.73,3.2692],204.507,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5702.74,7357.56,2.84442],25.6341,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5685.38,7317.45,3.23291],204.507,[0,0,1],false],["Land_Factory_Main_F",[5686.74,7346.38,3.05176e-005],115.159,[0,0,1],true],["Land_Canal_WallSmall_10m_F",[5694.67,7361.44,2.6972],25.6341,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5677.23,7321.17,3.13348],204.507,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5686.6,7365.32,2.56732],25.6341,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5669.14,7324.87,2.98776],204.507,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5678.59,7369.17,2.42114],25.6341,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5661,7328.59,2.81686],204.507,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5655.4,7334.19,3.7811],245.656,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5658.26,7350.49,3.21878],110.893,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5670.37,7370.98,2.35214],359.445,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5661.45,7358.79,2.89371],110.893,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5655.06,7342.13,3.52457],110.893,[0,0,1],false],["Land_Canal_WallSmall_10m_F",[5664.64,7367.19,2.56],110.893,[0,0,1],false]],
			[["Land_Metal_Shed_F",[5691.02,7339.11,-3.05176e-005],112.239,[0,0,1],false],["Land_CncBarrierMedium_F",[5692.7,7338.48,0],111.82,[0,0,1],false],["valor_CargoNet_infinite",[5689.22,7339.75,0.00164795],113.032,[-0.00415465,-0.039945,0.999193],true]],
			[
				["valor_ducttape",1]
			],
			[[5701.69,7339.76,0.00134277],40], // start search for objects
			[5861.3,7263.05,0.00143433],		// pos to spawn zeds @
			"Metal"
		]
	};

	default
	{
		[]
	};

};


_outpost
