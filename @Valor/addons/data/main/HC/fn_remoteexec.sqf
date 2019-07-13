private ["_params","_function"];

_params = _this select 0;
_function = param[1,"",[""]];
if(_function isEqualTo "") exitWith {};
_target = _this select 2;

if(_target isEqualTo 2 && HC_AVAILABLE) then {
	_target = [HC1];
};

_params remoteExec[_function,_target];