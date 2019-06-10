private ["_group_id","_ret","_var"];

_group_id = param[0,-1,[0]];
if(_group_id isEqualTo -1) exitWith {[]};
_ret = [];
{
	_var = _x getVariable["Valor_group_id",-1];
	if(_var isEqualTo _group_id) then {
		_ret pushBack _x;
	};

} foreach (playableUnits - [player]);

_ret

