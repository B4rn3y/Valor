



private ["_action","_camera"];
closeDialog 0;
closeDialog 0;

_action = [
		"Do you want to disconnect from the server?",
		"Valor",
		"YES",
		"NO"
	] call BIS_fnc_guiMessage;

if!(_action) exitWith {};

if(isnil "Valor_init_done") exitWith {
	["Aborted",true,true] spawn BIS_fnc_endMission;
};

[] call valor_fnc_syncPlayerToDB;
disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
showHud false;
hintSilent "";

//delete the current hud

// create Camera flyby
_camera = "camera" camCreate (position player);
_camera cameraEffect ["internal","back"];
_camera camSetTarget player;
_camera camCommit 0;
_camera camSetPos (player modelToWorld [0,0,60]);
_camera camCommit 1;
sleep 1;
_camera camSetTarget (player modelToWorld[0,0,10000]);
_camera camCommit 3;

cutText ["","BLACK",2]; //Fade the screen to black, in prep for the outro.
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;


sleep 0.25;

for "_i" from 0 to 100 do {
	if(_i == 100) then {
		disableUserInput false;
		["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
		sleep (random 0.2);
	};

	[format["<t size='1.3' align='center'> Synchronizing player data.. (%1%2)</t> ",_i,"%"],0,0.95,10,0,0,8] spawn BIS_fnc_dynamicText;

	sleep 0.025;
};

["Aborted",true,0] spawn BIS_fnc_endMission;


