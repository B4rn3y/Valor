



_zombie = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];
if(isnull _zombie) exitWith {false};
if(isnull _target) exitWith {false};
_attackdistance = 2.5;

if(_zombie distance _target <= _attackdistance && objectParent _target isEqualTo _target) exitWith {true};
false

