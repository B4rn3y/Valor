if(isServer) exitWith{};

//Valor_debug = true;
waitUntil {!isnil "valor_adminlevel"};
//[] spawn valor_fnC_teleesp;
[] spawn valor_fnc_briefing;
//player setvariable["valor_zmbienoaggro",true,true];



Ryanzombiesdamage = 0.05;
