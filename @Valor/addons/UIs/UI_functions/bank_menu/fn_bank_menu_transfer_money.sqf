private ["_to_bank","_display","_str_text_show_money","_edit_transfert_to_bankacc","_edit_withdraw_from_bankacc","_amount_to_add","_can_do"];

_to_bank = param[0,false,[false]];

_display = findDisplay 3017;
if(isnull _display) exitWith {};
_str_text_show_money = _display displayCtrl 1100;
_edit_transfert_to_bankacc = _display displayCtrl 1400;
_edit_withdraw_from_bankacc = _display displayCtrl 1401;

if(isnil "Valor_cash") exitWith {};
iF(isnil "Valor_bankacc") exitWith {};


_amount_to_add = 0;
if(_to_bank) then {
	_amount_to_add = parseNumber (ctrlText _edit_transfert_to_bankacc);
} else {
	_amount_to_add = parseNumber (ctrlText _edit_withdraw_from_bankacc);
};

if(_amount_to_add <= 0) exitWith {["Wrong Input"] spawn valor_fnc_exp_hint;};

_can_do = true;

if(_to_bank) then {
	if((Valor_cash - _amount_to_add) < 0) then {_can_do = format["You dont have this much money on your hand."];};
} else {
	if((Valor_bankacc - _amount_to_add) < 0) then {_can_do = format["You dont have this much money on your bank."];};
};

if((typeName _can_do) isEqualTo "STRING") exitWith {[_can_do] spawn valor_fnc_exp_hint;};

if(_to_bank) then {
	Valor_cash = Valor_cash - _amount_to_add;
	Valor_bankacc = Valor_bankacc + _amount_to_add;
} else {
	Valor_bankacc = Valor_bankacc - _amount_to_add;
	Valor_cash = Valor_cash + _amount_to_add;
};

_str_text_show_money ctrlSetStructuredText parsetext format["<t align='left' size='0.8'>Cash: </t><t align='left' size='1.0' color='#01DF01'>$%1</t><t align='right' size='0.8'>Bank: </t><t align='right' size='1.0' color='#01DF01'>$%2</t>",[Valor_cash] call valor_fnc_numbertext,[Valor_bankacc] call valor_fnc_numbertext];

