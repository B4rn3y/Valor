
_ret = true;
_amount = param[0,-1,[-1]];
_add = param[1,false,[false]];
if(_amount isEqualTo -1) exitWith {false};
if(isnil "save_object") exitWith {false};


_var = save_object getVariable["cop_bank",-1];
if(_var isEqualTo -1) exitWith {false};


if(_add) then {
	_var = _var + _amount;
	save_object setVariable["cop_bank",_var,true];
	//[] remoteExec["valor_fnc_update_cop_bankDB",2];
	[[],"valor_fnc_update_cop_bankDB",2] call valor_fnc_remoteexec;
} else {
	if((_var - _amount) < 0) exitWith {_ret = false;};
	_var = _var - _amount;
	save_object setVariable["cop_bank",_var,true];
	[] remoteExec["valor_fnc_update_cop_bankDB",2];
	[[],"valor_fnc_update_cop_bankDB",2] call valor_fnc_remoteexec;
};
_ret
