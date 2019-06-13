private ["_vehicle","_set_var","_mode"];

_vehicle = vehicle player;
if(isnil "VALOR_IN_TRADER") then {
	VALOR_IN_TRADER = true;

	_set_var = {
		_mode = _this;

		if(_mode isEqualTo 0) then {
			_vehicle setvariable["group_restricted",[_mode,getplayeruid player],true];
		} else {
			_vehicle setvariable["group_restricted",[_mode,valor_group select 0],true];
		};
	};
	if!(vehicle player isEqualTo player) then {
		if(playerSide isEqualTo opfor) exitWith {_vehicle setvariable["group_restricted",[-2,-1],true];};
		if(isnil "Valor_group") exitWith {0 call _set_var;};
		if(valor_group isEqualTo []) then {
			0 call _set_var;
		} else {
			1 call _set_var;
		};
	};
} else {
	VALOR_IN_TRADER = nil;
	if!(vehicle player isEqualTo player) then {
		_vehicle setvariable["group_restricted",nil,true];
	};
};





