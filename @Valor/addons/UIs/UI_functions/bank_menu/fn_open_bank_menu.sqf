
private ["_display","_str_text_show_money","_save"];

createDialog "bank_menu";
disableSerialization;
_display = findDisplay 3017;
_str_text_show_money = _display displayCtrl 1100;

if(isnil "Valor_cash") exitWith {};
iF(isnil "Valor_bankacc") exitWith {};

_save = [Valor_cash,Valor_bankacc];


_str_text_show_money ctrlSetStructuredText parsetext format["<t align='left' size='0.8'>Cash: </t><t align='left' size='1.0' color='#01DF01'>$%1</t><t align='right' size='0.8'>Bank: </t><t align='right' size='1.0' color='#01DF01'>$%2</t>",[Valor_cash] call valor_fnc_numbertext,[Valor_bankacc] call valor_fnc_numbertext];


waitUntil {isnull(findDisplay 3017)};

if!(_save isEqualTo [Valor_cash,Valor_bankacc]) then {
	[3] call valor_fnc_step_update;
};