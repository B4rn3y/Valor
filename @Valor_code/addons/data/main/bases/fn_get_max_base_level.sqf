
_config_id = param[0,-1,[0]];
if(_config_id isEqualTo -1) exitWith {-1};

_counter = 0;
while{true} do {
	_conf = [_config_id,_counter] call valor_fnc_base_config;
	if(_conf isEqualTo []) exitWith {_counter = _counter - 1;};
	_counter = _counter + 1;
};

_counter