

private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit OR !(_unit getvariable["restrained",false])) exitWith {};

if((player distance _unit > 3)) exitWith {};
_unit attachTo [player,[0.1,1.1,0]];
player reveal _unit;

