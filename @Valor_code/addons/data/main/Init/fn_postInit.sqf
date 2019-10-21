
if (isServer) exitWith {};
if(!hasInterface && !isDedicated) exitWith {};
if (!hasInterface) exitWith {};
enableSaving [false, false];

profileNamespace setVariable ['GUI_BCG_RGB_R',1];
profileNamespace setVariable ['GUI_BCG_RGB_G',0];
profileNamespace setVariable ['GUI_BCG_RGB_B',0];
profileNamespace setVariable ['GUI_BCG_RGB_A',0.937124];

player allowDamage false;
enableSentences false;
enableRadio false;
0 fadeRadio 0;
showChat false;
showHud false;


0 spawn {

	waitUntil {((!isnull (findDisplay 46)) && (!isnull (findDisplay 63)))};

	0 call valor_fnc_openLoadingScreen;

	[1] spawn valor_fnc_mainInit;

	player addRating 9999999;
};


