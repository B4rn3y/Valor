


private ["_assigned","_price_hay","_count","_money_earn"];

_assigned = _this select 0;
_price_hay = 250;
if(isnull VALOR_LAST_VEHICLE) exitWith {systemChat "Valor :: You have no vehicle driven here O.o"};
if!(alive VALOR_LAST_VEHICLE) exitWith {systemChat "Valor :: The vehicle you drove last is destroyed"};
if(player distance VALOR_LAST_VEHICLE > 15) exitWith {systemChat "Valor :: The vehicle you drove last is too far away"};
titleText["Selling...","PLAIN DOWN"];
sleep random 5;



_count = 0;
{
	if((typeOf _x) isEqualTo "Land_seno_balik") then {
		_count = _count + 1;
		detach _x;
		deleteVehicle _x;
	};
} foreach (attachedObjects VALOR_LAST_VEHICLE);

if(_count isEqualTo 0) exitWith {systemChat "Valor :: The vehicle you drove last has no hay bales on it O.o"};

_money_earn = _count * _price_hay;

titleText[format["You earned $%1",_money_earn],"PLAIN DOWN"];

Valor_cash = Valor_cash + _money_earn;

[3] call valor_fnc_step_update;