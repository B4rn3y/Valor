



_zombie = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];
if(isnull _zombie) exitWith {false};
if(isnull _target) exitWith {false};
if(!alive _target) exitWith {false};
_attackdistance = 2.5;
if(!alive _zombie) then {_attackdistance = -1;};
if(_zombie distance _target <= _attackdistance && vehicle _target isEqualTo _target) exitWith {true};
false

