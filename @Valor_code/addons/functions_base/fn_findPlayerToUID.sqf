

_pid = param[0,"",[""]];
if(_pid isEqualTo "") exitWith {objNull};
_ret = objNull;
{if(getplayeruid _x isEqualTo _pid) exitWith {_ret = _x};} foreach playableUnits;


_ret