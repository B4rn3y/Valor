
private ["_money_to_pay","_bank","_ret","_money"];

_money_to_pay = param[0,-1,[-1]];
_bank = param[1,false,[false]];
if(_money_to_pay isEqualTo -1) exitWith {false};
if(isnil "valor_cash") exitWith {false};
if(isnil "Valor_bankacc") exitWith {false};
_ret = true;
if(_bank) then {
	_money = Valor_bankacc;
	if((_money - _money_to_pay) < 0) exitWith {_ret=false;};
	_money = _money - _money_to_pay;
	Valor_bankacc = _money;
} else {
	_money = valor_cash;
	if((_money - _money_to_pay) < 0) exitWith {_ret=false;};
	_money = _money - _money_to_pay;
	valor_cash = _money;
};

if(_ret) then {
	[3] call valor_fnc_step_update;
};

_ret
