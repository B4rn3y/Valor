
private ["_zombie","_group_id","_see_range","_targets","_var","_the_target"];
_zombie = param[0,objNull,[objNull]];
_group_id = param[1,-1,[-1]];
if(isnull _zombie) exitWith {[]};
if(_group_id isEqualTo -1) exitWith {[]};
_see_range = 40;

_targets = nearestObjects[_zombie,["MAN"],_see_range];

_targets = _targets select {_var = _x getvariable["valor_group_id",[-1,"test"]];(isplayer _x && ((_zombie distance _x) <= _see_range)) && !(_x getvariable["valor_zmbienoaggro",false]) && alive _x && ([_zombie,_x] call valor_fnc_zombie_checkVisibility) && !(_group_id isEqualTo (_var select 0))};

diag_log str _targets;

if(_targets isEqualTo []) exitWith {[]};

_the_target = selectRandom _targets;

_zombie setvariable["VALOR_Target",_the_target];

[_the_target]


