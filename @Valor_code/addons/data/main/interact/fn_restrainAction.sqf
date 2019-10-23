


private["_unit"];
_unit = cursorObject;
if(player getVariable ["valor_restrained",false]) exitWith{systemChat "You cant do anything while being restrained"};
if(isNull _unit) exitWith {systemchat "Valor :: There is nobody to restrain"}; //Not valid
if((player distance _unit > 3)) exitWith {systemchat "Valor :: You are too far away"};
if((_unit getVariable["valor_restrained",false])) exitWith {};
//if(side _unit == west) exitWith {}; // LHM
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit setVariable["valor_restrained",true,true];


[player] remoteexec["valor_fnc_restrain",_unit];
_man = [];
{
	if(isplayer _x) then {_man pushBackUnique _x};
} foreach (nearestObjects[player,["Man"],20]);

[player,"cuff"] remoteExec["valor_fnc_say3d",_man];
