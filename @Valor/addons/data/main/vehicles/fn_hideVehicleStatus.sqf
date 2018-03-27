


private ["_vehicle","_ADD_ID"];
_vehicle = param[0,objNull,[objNull]];
_ADD_ID = param[2,-1,[-1]];
if(isnull _vehicle) exitWith {};
_var = _vehicle getvariable "ADDACTION_IDS";
if(isnil "_var") exitWith {};
_vehicle removeAction _ADD_ID;
{_vehicle removeAction _x;} foreach (_vehicle getvariable["ADDACTION_IDS",[]]);
_vehicle setvariable["ADDACTION_IDS",nil];

_vehicle addaction["<t color='#0000ff'>Show Vehicle Status</t>",Valor_fnc_showVehicleDamage];





