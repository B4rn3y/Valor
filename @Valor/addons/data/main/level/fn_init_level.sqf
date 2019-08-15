
private ["_xp","_base_level_xp","_add_per_level","_ret","_max_xp_this_level","_current_xp","_current_level","_xp_to_next_level"];

_xp = param[0,0,[0]];


_base_level_xp = 100;
_add_per_level = 50;


_ret = [0,0]; // level, xp

_max_xp_this_level = _base_level_xp;
_current_xp = _xp;
_current_level = 0;


_xp_to_next_level = _max_xp_this_level - _current_xp;
if(_current_xp < _max_xp_this_level) exitWith {_ret = [_current_level,_current_xp,_xp_to_next_level,_max_xp_this_level];_ret};
if(_current_xp isEqualTo _max_xp_this_level) exitWith {_ret = [(_current_level + 1),0,(_base_level_xp + (_add_per_level * (_current_level + 1))),(_base_level_xp + (_add_per_level * (_current_level + 1)))];_ret};
_current_xp = _current_xp - _base_level_xp;
while {true} do
{
	_current_level = _current_level + 1;
	_max_xp_this_level = _base_level_xp + (_add_per_level * _current_level);
	_current_xp = _current_xp - _max_xp_this_level;

	if(_current_xp < 0) exitWith {_ret = [_current_level,(_max_xp_this_level - (_current_xp * -1)),_max_xp_this_level - (_max_xp_this_level - (_current_xp * -1)),_max_xp_this_level];};
	if(_current_xp isEqualTo 0) exitWith {_ret = [(_current_level + 1),0,(_base_level_xp + (_add_per_level * (_current_level + 1))),(_base_level_xp + (_add_per_level * (_current_level + 1)))];};

};


_ret