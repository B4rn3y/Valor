
private ["_zombie","_group_id","_see_range","_targets","_var","_the_target"];
_zombie = param[0,objNull,[objNull]];
_group_id = param[1,objNull,[objNull]];
if(isnull _zombie) exitWith {[]};
if(isnull _group_id) exitWith {[]};
_see_range = 40;

_targets = nearestObjects[_zombie,["MAN"],_see_range];

_var_base = _group_id getVariable["valor_base_ids",[-1,-1,-1,[]]];
_entry = _var_base select 3;
_targets = _targets select {_pid = getplayeruid _x;_var = _x getvariable["valor_group_id",[-1,"test"]];(isplayer _x && ((_zombie distance _x) <= _see_range)) && !(_x getvariable["valor_zmbienoaggro",false]) && alive _x && ([_zombie,_x] call valor_fnc_zombie_checkVisibility) && !(_var in _entry) && !([_pid,name _x] in _entry)};


if(_targets isEqualTo []) exitWith {[]};

_the_target = selectRandom _targets;

_zombie setvariable["VALOR_Target",_the_target];

[_the_target]


