private ["_obj","_range","_ret"];



_obj = param[0,objNull,[objNull]];
_range = param[1,50,[0]];

if(isnull _obj) exitWith {objNull};

_ret = objNull;
{
	if(alive _x && isplayer _x && currentWeapon _x isEqualTo "valor_carrot") exitWith {_ret = _x;};
} foreach nearestObjects[_obj,["Man"],_range];



_ret