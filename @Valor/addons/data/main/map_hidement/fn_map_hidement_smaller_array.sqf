



_valor_map = param[0,[],[[]]];

if(_valor_map isEqualTo []) exitWith {""};
_normal_array = 0 call valor_fnc_get_hidement_array;

_str = "";

{
	if(_x in _valor_map) then {_str = _str + "1";} else {_str = _str + "0";};
} foreach _normal_array;


_str = str _str;
_str

