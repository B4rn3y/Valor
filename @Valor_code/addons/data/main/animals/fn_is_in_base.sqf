private ["_range","_obj","_ret","_var","_var1"];



_obj = param[0,objNull,[objNull]];
_range = param[1,50,[0]];

if(isnull _obj) exitWith {false};

_ret = false;
{
	_var = _x getvariable["valor_base_ids",[]];
	_var1 = _x getvariable["valor_wall_ids",[]];
	if!(_var isEqualTo [] && _var1 isEqualTo []) exitWith {_ret = true};
} foreach nearestObjects[_obj,["House"],_range];



_ret