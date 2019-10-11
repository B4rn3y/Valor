
private ["_group_id","_ret","_var","_id"];

_group_id = param[0,-1,[0]];
if(_group_id isEqualTo -1) exitWith {[]};
_ret = [];
{
	_var = _x getVariable["Valor_group_id",[]];
	if!(_var isEqualTo []) then {
		_id = _var select 0;
		if(_id isEqualTo _group_id) then {
			_ret pushBack _x;
		};
	};

} foreach playableUnits;

_ret

