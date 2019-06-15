
private ["_unit","_display","_edit","_txt","_nmbr","_max_nmbr"];
_unit = OBJ_focused;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit OR !(_unit getvariable["restrained",false])) exitWith {};



_display = findDisplay 3006;
if(isnull _display)exitWith {};
_edit = _display displayCtrl 1400;

_txt = ctrlText _edit;
if!([_txt] call valor_fnc_isNumber) exitWith {systemChat "Valor :: You havent entered a number"};
_nmbr = parseNumber _txt;


if(_nmbr <= 0)exitWith {systemChat "Valor :: You have entered nothing or a wrong number"};

_max_nmbr = 1000;
_max_nmbr = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "max_ticket");

if(_nmbr > _max_nmbr) exitWith {systemChat format["Valor :: You cant make a ticket higher than %1.",_max_nmbr]};

[player,_nmbr] remoteexec["valor_fnc_payticket",_unit];

closeDialog 0;

