


VALOR_INTRO = true;


valor_intro_cam = "camera" camCreate [0, 0, 0];
valor_intro_cam cameraEffect ["Internal", "BACK"];
valor_intro_cam camSetFocus [-1, -1];
showCinemaBorder false;
valor_intro_cam camCommit 0;
valor_intro_cam camSetTarget [6774.69,2543.35,5.89238];
valor_intro_cam camSetPos [8441.4,2616.64,4.37143];
valor_intro_cam camCommit 0;
//playsound "intro_sound";

//valor_intro_cam camSetTarget [6774.69,2543.35,5.89238];
//valor_intro_cam camSetPos [7165.92,2246.04,20.0015];
//valor_intro_cam camCommit 10;
//playsound "intro_sound";
//sleep 2;

valor_intro_cam camSetPos [6907.27,2391.1,8.64135];
sleep 2;
valor_intro_cam camCommit 12;
sleep 12;

valor_intro_cam camSetPos [6833.74,2488.51,2.00143909];
valor_intro_cam camCommit 12;
sleep 12;

valor_intro_cam camSetPos [6776.06,2541.08,2.00143909];
valor_intro_cam camCommit 12;
sleep 2;
cutText ["", "BLACK OUT", 10];
sleep 10;

switch (playerside) do
{
	case opfor:
	{
		_marker = getarray(missionConfigFile >> "Valor_settings" >> "Spawn_Points" >> "opfor_spawnPoints");
		_marker = selectRandom _marker;
		player setposatl (getmarkerpos _marker);
	};

	case civilian:
	{
		_marker = getarray(missionConfigFile >> "Valor_settings" >> "Spawn_Points" >> "civilian_spawnPoints");
		_marker = selectRandom _marker;
		_pos = getmarkerpos (_marker select 0);
		_radius = _marker select 1;
		_pos_spawn = [_pos, 0, _radius, 1, 0, 20, 1] call BIS_fnc_findSafePos;
		_pos_spawn pushback 0;
		player setposatl _pos_spawn;
	};
};


0 spawn valor_fnc_init_functions;
waitUntil {!isnil "Valor_functions_started"};




cutText ["", "BLACK IN", 10];
[6] call valor_fnc_step_update;
[0] call valor_fnc_step_update;

valor_intro_cam camSetFov 1;
valor_intro_cam camSetPos (player modelToWorld [0,0,200]);
valor_intro_cam camSetTarget ( player);
valor_intro_cam camCommit 0;
cutText ["", "BLACK IN", 10];
valor_intro_cam camSetTarget ( player);
valor_intro_cam camSetPos (player modelToWorld [0,0,2]);
valor_intro_cam camCommit 7;
sleep 7;


valor_intro_cam cameraEffect ["TERMINATE","BACK"];
camDestroy valor_intro_cam;

sleep 5;

VALOR_INTRO = nil;

/*

valor_intro_cam cameraEffect ["TERMINATE","BACK"];































valor_intro_cam camSetTarget [6718.3,2554.01,0.024004];
valor_intro_cam camSetPos [7165.92,2246.04,20.0015];
valor_intro_cam camCommit 0;
playsound "intro_sound";
sleep 2;

valor_intro_cam camSetPos [6739.48,2536.36,600.024004];
valor_intro_cam camCommit 10;
sleep 12;

_arr = [];
_grps_delete = [];
_arr pushback _wood;
_grp = createGroup blufor;
_grps_delete pushback _grp;
{
	_veh = (_x select 0) createVehicle (_x select 1);
	_veh setdir (_x select 2);
	_veh setposatl (_x select 1);

	_medic = _grp createUnit ["B_recon_M_F",(_x select 1),[],0,"NONE"];
	_medic moveinDriver _veh;
	_medic assignAsDriver _veh;
	_arr pushback _medic;
	_arr pushback _veh;


} foreach [["C_Van_02_medevac_F",[6712.73,2432.48,-0.0190005],270.397,0],["CUP_B_HMMWV_Ambulance_NATO_T",[6721.71,2419.37,-0.0104818],349.412,0]];

_grp = createGroup opfor;
_grps_delete pushback _grp;
{
	_obj = _grp createUnit [(_x select 0),(_x select 1),[],0,"NONE"];
	_obj setposatl (_x select 1);
	_obj setdir (_x select 2);
	_obj setdamage (_x select 3);
	_arr pushback _obj;

} foreach [["RyanZombieCrawler8Opfor",[6688.92,2451.69,0.00143909],0,0.7],["RyanZombieC_NikosOpfor",[6682.27,2450.44,0.103437],32.4562,0.7],["RyanZombieC_man_hunter_1_FmediumOpfor",[6691.29,2444.46,0.00143909],128.124,0.7],["RyanZombieC_man_hunter_1_FmediumOpfor",[6708.95,2447.11,0.00143909],229.078,0.7],["RyanZombie19slowOpfor",[6707,2439.52,0.00143909],172.855,0.7],["RyanZombieCrawler25Opfor",[6702.66,2435.93,0.00143909],0,0.7],["RyanZombieB_Soldier_05_fmediumOpfor",[6715.29,2446.38,2.55464],209.622,0.7],["RyanZombieCrawler1Opfor",[6713.91,2441.69,2.55464],0,0.7],["RyanZombieC_NikosslowOpfor",[6704.35,2432.71,0.00143909],79.776,0.7],["RyanZombie28mediumOpfor",[6719.98,2446.63,2.78424],211.944,0.7],["RyanZombie15slowOpfor",[6707.28,2429.53,0.00143909],352.033,0.7],["RyanZombie28mediumOpfor",[6720.88,2439.64,2.55464],0,0.7],["RyanZombieCrawler20Opfor",[6711.38,2427.93,0.00143909],0,0.7],["RyanZombie17slowOpfor",[6716.65,2427.67,0.00143909],293.352,0.7],["RyanZombieB_Soldier_lite_F_1mediumOpfor",[6720.49,2429.7,5.42434],0,0.7],["RyanZombieCrawler20Opfor",[6716.34,2425.72,5.85085],0,0.7],["RyanZombieC_man_pilot_FOpfor",[6715.05,2423.31,5.77046],13.26,0.7],["RyanZombie21Opfor",[6719.41,2425.82,5.77983],0,0.7],["RyanZombieC_OrestesOpfor",[6709.65,2417.56,4.57678],30.888,0.7],["RyanZombieCrawler20Opfor",[6736.33,2430.9,2.55808],0,0.7],["RyanZombie16slowOpfor",[6730.89,2416.41,0.00143909],300.815,0.7],["RyanZombieCrawler10Opfor",[6726.81,2412.51,0.00143909],0,0.7],["RyanZombieC_man_hunter_1_FslowOpfor",[6731.78,2411.38,0.00143909],319.082,0.7]];


_grp = createGroup blufor;
_grps_delete pushback _grp;
{
	_obj = _grp createUnit [(_x select 0),(_x select 1),[],0,"NONE"];
	_obj setposatl (_x select 1);
	_obj setdir (_x select 2);
	_obj allowdamage false;
	_arr pushback _obj;

} foreach [["B_recon_M_F",[6703.45,2430.33,0.103438],0],["B_recon_JTAC_F",[6706.99,2429.79,0.00143909],0]];








valor_intro_cam camSetPos [6635.27,2475.11,15.3267];
valor_intro_cam camSetTarget [6719.32,2424.12,0.00143909];
valor_intro_cam camCommit 7;
sleep 6;
valor_intro_cam camSetFov 0.5;
sleep 14;
cutText ["", "BLACK FADED", 10];
sleep 1;
cutText ["", "BLACK IN", 10];

_pos = [getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"), 0, 9000, 1, 0, 20, 1] call BIS_fnc_findSafePos;
if((count _pos) isequalto 2) then {_pos pushback 0;};
player setposatl _pos;


{deleteVehicle _x;} foreach _arr;
{deleteGroup _x;} foreach _grps_delete;
valor_intro_cam camSetFov 1;
valor_intro_cam camSetPos (player modelToWorld [0,0,200]);
valor_intro_cam camSetTarget (getposatl player);
valor_intro_cam camCommit 0;
valor_intro_cam camSetTarget (getpos player);
valor_intro_cam camSetPos (player modelToWorld [0,0,2]);
valor_intro_cam camCommit 7;
sleep 7;


valor_intro_cam cameraEffect ["TERMINATE","BACK"];
camDestroy valor_intro_cam;

*/









