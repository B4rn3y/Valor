private ["_vehicle","_set_var","_mode"];

_vehicle = vehicle player;
if(isnil "VALOR_IN_TRADER") then {
	VALOR_IN_TRADER = true;

	[
		"Trader_playertags",
		valor_fnc_trader_playertags
	] call valor_fnc_stackOnEachFrame;

	if(!(vehicle player isEqualTo player) && (driver vehicle player isEqualTo player)) then {
		["You entered the Survivor city, you can now lock your vehicle. (Use the 'U' key)"] spawn valor_fnc_exp_hint;
		Valor_vehicles_key pushBackUnique _vehicle;
		if!((call valor_coplevel) > 0) then {
			_vehicle setvariable["owners",[getPlayerUID player],true];
		} else {
			_vehicle setvariable["owners",["COP"],true];
		};
		_vehicle setvariable["update_this",true,true];

	};
} else {
	VALOR_IN_TRADER = nil;
	if(!(vehicle player isEqualTo player) && (driver vehicle player isEqualTo player)) then {
		_vehicle lock 0;
		_vehicle setvariable["owners",nil,true];
		_vehicle setvariable["update_this",true,true];
		["You left the Survivor city, your vehicle is now unlocked"] spawn valor_fnc_exp_hint;
	};

	[
		"Trader_playertags",
		{}
	] call valor_fnc_stackOnEachFrame;
};





