

private ["_unit","_cash"];
_unit = param[0,objNull,[objNull]];
if(isnull _unit) exitWith {};
titleText["Searching...","PLAIN DOWN"];
sleep random 5;

_cash = _unit getvariable["cash",0];
titleText[format["You found $%1 on this body",_cash],"PLAIN DOWN"];

if(_cash isEqualTo 0) exitWith {};
_unit setVariable["cash",nil,true];
VALOR_CASH = VALOR_CASH + _cash;
[3] call valor_fnc_step_update;
