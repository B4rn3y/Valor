
private ["_jailtime","_markerpos","_time","_distance"];
_jailtime = param[1,-1,[-1]];
if(_jailtime isEqualTo -1) exitWith {};
waitUntil {!isnil "valor_init_done"};
Valor_thirst = 100;
Valor_hunger = 100;

_markerpos = getMarkerPos "cop_jail";
player setposatl _markerpos;
[7] call valor_fnc_step_update;
_jailtime = _jailtime * 60;
_time = servertime + _jailtime;
_distance = 5;
while{(_time - servertime) > 0} do {
	hint parseText format[" <t size='1.1' align='center'>Time left:</t><br/><t size='1.4' align='center'>%1</t>",[(_time - servertime), "MM:SS.MS"] call BIS_fnc_secondsToString];
	if(player distance _markerpos > _distance) exitWith {hint "You escaped the jail"};
	sleep 0.09;
};
[7] call valor_fnc_step_update;
if(player distance _markerpos > _distance) exitWith {hint "You escaped the jail";(format["Valor :: %1 escaped the jail."]) remoteExec["systemChat",opfor]};
hint "You are free now";
player setposatl (getMarkerPos "cop_respawn");

