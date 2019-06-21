_unit = param[0,objNull,[objNull]];
if(isnull _unit) exitWith {};
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeGoggles _unit;
{
	_unit removeMagazine _x;
} foreach (magazines _unit);

if!(hmd _unit isEqualTo "") then {
	_unit unlinkItem (hmd _unit);
};

{
	_unit unassignItem _x;
	_unit removeItem _x;
} foreach (assignedItems _unit);

removeHeadGear _unit;
RemoveAllWeapons _unit;


