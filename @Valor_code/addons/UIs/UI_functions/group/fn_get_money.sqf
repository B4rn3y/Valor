private ["_amount","_type"];

_amount = param[0,0,[0]];
_from = param[1,"",[""]];
_type = param[2,0,[0]]; // 0 cash   -  1 bank

if(_amount <= 0) exitWith {};


if(_type isEqualTo 0) then {
	Valor_cash = Valor_cash + _amount;
} else {
	Valor_bankacc = Valor_bankacc + _amount;
};

if!(_from isEqualTo "") then {
	[format["You got $%1 from %2.",_amount,_from]] spawn valor_fnc_exp_hint;
};

[3] call valor_fnc_step_update;

