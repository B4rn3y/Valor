

private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit OR !(_unit getvariable["valor_restrained",false])) exitWith {};

disableSerialization;
if!(createDialog "ticket") exitWith {systemChat "Valor :: Could not create the dialog"};

_display = findDisplay 3006;
_edit = _display displayCtrl 1400;
_edit ctrlSetText "0";