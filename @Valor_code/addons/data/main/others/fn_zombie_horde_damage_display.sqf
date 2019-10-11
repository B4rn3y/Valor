
private ["_gate","_gate_health","_health"];
_gate = param[0,objNull,[objNull]];
_gate_health = param[1,-1,[-1]];

iF(isnull _gate) exitWith {};
iF(_gate_health isEqualTo -1)exitWith {};


valor_is_processing = true;
[_gate,"Gate Health"] spawn valor_fnc_processevh;

while {!isnull _gate} do
{
	_health = _gate getvariable["valor_health",-1];
	if(_health isEqualTo -1) exitWith {};
	_health = _health / _gate_health;
	_gate setvariable["percent",_health * 100];
	sleep 1;
};

valor_is_processing = nil;