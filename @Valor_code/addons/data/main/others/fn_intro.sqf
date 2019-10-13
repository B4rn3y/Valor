




/*
cam über die karte:
Welcome to the Valor Mod on Chernarus Redux, a Survival and Roleplay Mod combined.
A nuclear crisis has haunted the Land and Zombies and other creatures are roaming the land.
Survivors of this tragedy fight each other for food, water and shelter, some of them though have created a last resistance against this threat.

cam switch to SC
This is the so called Survivor City, it is guarded by a milita to enforce the law and keep it free of zombies.
Vehicle and Item Traders have established themselves in this place, these sell and buy items.
Visitors of the city have to follow the RDM and VDM Rules.

cam show bases
Survivors can build themselves Bases



*/





























VALOR_INTRO = true;









valor_intro_cam = "camera" camCreate [0, 0, 0];
valor_intro_cam cameraEffect ["Internal", "BACK"];
valor_intro_cam camSetFocus [-1, -1];
showCinemaBorder false;
valor_intro_cam camCommit 0;

valor_intro_cam camsetpos [8439.47,2614.23,1.0018158];
valor_intro_cam camSetTarget [6529.3,2211.45,7.001683];
valor_intro_cam camCommit 0;



valor_intro_cam camSetPos [6947.05,2633.75,20.00143909];
valor_intro_cam camCommit 20;
sleep 20;


valor_intro_cam camSetPos [6666.65,2333.24,20.00143909];
valor_intro_cam camCommit 20;
sleep 10;

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



