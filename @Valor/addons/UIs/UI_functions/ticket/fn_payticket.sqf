

_unit = param[0,objNull,[objNull]];
_ticket = param[1,-1,[-1]];
if(isNull _unit) exitWith {};
if(_ticket isEqualTo -1) exitWith {};


if((Valor_bankacc - _ticket) < 0) exitWith {
	(format["Valor :: %1 has not enough money to pay this ticket.",profileName]) remoteExec["systemChat",_unit];
};

_action = [
	format["Do you want to pay the ticket of $%1?",_ticket],
	"Valor",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if(_action) then {
	if([_ticket,true] call valor_fnc_pay) then {
		(format["Valor :: %1 has paid the ticket.",profileName]) remoteExec["systemChat",_unit];
		systemChat "Valor :: You paid the ticket";
		[_ticket,true] call valor_fnc_update_cop_bank;
	} else {
		(format["Valor :: %1 could not pay for some reason O.o",profileName]) remoteExec["systemChat",_unit];
	};

} else {};