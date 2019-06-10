private ["_pid","_ret"];
_pid = param[0,"",[""]];
if(_pid isEqualTo "") exitWith {0};
if(isnil "Valor_group") exitWith {0};
if(Valor_group isEqualTo []) exitWith {0};
_ret = 0;

{
	if(_pid isEqualTo (_x select 0)) then {_ret = _x select 1};
} foreach (Valor_group select 1);

_ret