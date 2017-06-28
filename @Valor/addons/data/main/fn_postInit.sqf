
if (isServer) exitWith {};

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

[1] call valor_fnc_mainInit;