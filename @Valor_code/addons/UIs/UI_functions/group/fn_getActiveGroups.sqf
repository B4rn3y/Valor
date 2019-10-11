
private ["_ret","_var"];


_ret = [];
{
	_var = _x getVariable["Valor_group_id",[]];
	if!(_var isEqualTo []) then {
		_id = _var select 0;
		_name = _var select 1;
		_ret pushBackUnique [_id,_name];
	};

} foreach playableUnits;

_ret

