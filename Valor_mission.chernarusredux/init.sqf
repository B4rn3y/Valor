if(isServer) exitWith{};

Valor_debug = true;
waitUntil {!isnil "valor_adminlevel"};
[] spawn valor_fnC_teleesp;



Ryanzombiesdamage = 0.05;
ryanzombiesdisableaggressive = 1;
ryanzombiesdisablemoaning = 1;