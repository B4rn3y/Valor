

private ["_foreachindex","_valor_uid","_cash","_bankacc","_armystats","_armylevel","_armygear","_adminlvel","_donorlevel","_blacklist","_armyalive","_armyposition","_playtime","_survival_zone","_map_revealed","_humanity","_gear","_stats","_arrested","_alive","_position","_medicstats","_mediclevel","_medicgear","_medicalive","_medicposition"];

{
	diag_log str [_foreachindex,_x];
	diag_log str[_foreachindex,typename _x];
} foreach _this;


if(!isnil "Valor_adminlevel" || !isnil "Valor_armylevel" || !isnil "Valor_donatorlevel" || !isnil "Valor_mediclevel") exitWith {
	Valor_VARS_SET = true;
	[profilename,getplayeruid player,profileNameSteam,format["Vars set before Login @ Player %1",player]] remoteexec["valor_fnc_logToDB",2];
};

switch(playerside) do {
	case west: {
		_valor_uid = param[0,-1,[1337]];
		_cash = param[1,-1,[1337]];
		_bankacc = param[2,-1,[1337]];
		_armystats = param[3,[],[[],""]];
		_armylevel = param[4,-1,[1337]];
		_armygear = param[5,"",["",[]]];
		_adminlvel = param[6,0,[1337]];
		_donorlevel = param[7,0,[1337]];
		_blacklist = param[8,0,[1337]];
		_armyalive = param[9,0,[1337]];
		_armyposition = param[10,[],[[],""]];
		_playtime = param[11,0,[1337,""]];
		_survival_zone = param[12,0,[0]];
		_map_revealed = param[13,"",[[],""]];



		Valor_UID = _valor_uid;
		Valor_cash = _cash;
		Valor_bankacc = _bankacc;
		Valor_stats = call compile ([_armystats] call valor_fnC_mtoArray);
		Valor_armylevel = compilefinal str _armylevel;
		Valor_mediclevel = compileFinal str 0;
		Valor_gear = [_armygear] call valor_fnc_mToArray;
		if(typeName Valor_gear isEqualTo "STRING") then {Valor_gear = call compile format["%1", Valor_gear];};

		Valor_adminlevel = compileFinal str _adminlvel;
		Valor_donatorlevel = compileFinal str _donorlevel;
		if(_blacklist isEqualTo 1) then {
			Valor_blacklist = true;
		};
		Valor_alive = _armyalive;
		Valor_position = [_armyposition] call valor_fnc_mToArray;
		if(typeName Valor_position isEqualTo "STRING") then {Valor_position = call compile format["%1", Valor_position];};
		Valor_playtime = call compile _playtime;
		Valor_arrested = false;

		if(_survival_zone isEqualTo 1) then {
			Valor_survival_zone = true;
		};

		Valor_map = [_map_revealed] call valor_fnc_map_hidement_mArray;
	};

	case civilian: {
		_valor_uid = param[0,-1,[1337]];
		_cash = param[1,-1,[1337]];
		_bankacc = param[2,-1,[1337]];
		_humanity = param[3,-1,[1337]];
		_gear = param[4,"",["",[]]];
		_stats = param[5,[],[[],""]];
		_arrested = param[6,0,[1337]];
		_adminlvel = param[7,0,[1337]];
		_donorlevel = param[8,0,[1337]];
		_blacklist = param[9,0,[1337]];
		_alive = param[10,0,[1337]];
		_position = param[11,[],[[],""]];
		_playtime = param[12,0,[1337,""]];
		_survival_zone = param[13,0,[0]];
		_map_revealed = param[14,"",[[],""]]; // wenn das Array leer ist, ist alles aufgedeckt

		Valor_UID = _valor_uid;
		Valor_cash = _cash;
		Valor_bankacc = _bankacc;
		Valor_stats = call compile ([_stats] call valor_fnC_mtoArray);
		Valor_armylevel = compilefinal str 0;
		Valor_mediclevel = compileFinal str 0;
		Valor_gear = [_gear] call valor_fnc_mToArray;
		if(typeName Valor_gear isEqualTo "STRING") then {Valor_gear = call compile format["%1", Valor_gear];};

		Valor_adminlevel = compileFinal str _adminlvel;
		Valor_donatorlevel = compileFinal str _donorlevel;
		if(_blacklist isEqualTo 1) then {
			Valor_blacklist = true;
		};
		Valor_alive = _alive;
		Valor_position = [_position] call valor_fnc_mToArray;
		if(typeName Valor_position isEqualTo "STRING") then {Valor_position = call compile format["%1", Valor_position];};
		Valor_playtime = call compile _playtime;
		Valor_humanity = _humanity;
		Valor_arrested = if(_arrested isEqualTo 1) then {true} else {false};

		if(_survival_zone isEqualTo 1) then {
			Valor_survival_zone = true;
		};
		Valor_map = [_map_revealed] call valor_fnc_map_hidement_mArray;

	};

	case independent: {
		_valor_uid = param[0,-1,[1337]];
		_cash = param[1,-1,[1337]];
		_bankacc = param[2,-1,[1337]];
		_medicstats = param[3,[],[[],""]];
		_mediclevel = param[4,-1,[1337]];
		_medicgear = param[5,"",["",[]]];
		_adminlvel = param[6,0,[1337]];
		_donorlevel = param[7,0,[1337]];
		_blacklist = param[8,0,[1337]];
		_medicalive = param[9,0,[1337]];
		_medicposition = param[10,[],[[],""]];
		_playtime = param[11,0,[1337,""]];
		_survival_zone = param[12,0,[0]];
		_map_revealed = param[13,"",[[],""]];



		Valor_UID = _valor_uid;
		Valor_cash = _cash;
		Valor_bankacc = _bankacc;
		Valor_stats = call compile ([_medicstats] call valor_fnC_mtoArray);
		Valor_armylevel = compilefinal str 0;
		Valor_mediclevel = compileFinal str _mediclevel;
		Valor_gear = [_medicgear] call valor_fnc_mToArray;
		if(typeName Valor_gear isEqualTo "STRING") then {Valor_gear = call compile format["%1", Valor_gear];};

		Valor_adminlevel = compileFinal str _adminlvel;
		Valor_donatorlevel = compileFinal str _donorlevel;
		if(_blacklist isEqualTo 1) then {
			Valor_blacklist = true;
		};
		Valor_alive = _medicalive;
		Valor_position = [_medicposition] call valor_fnc_mToArray;
		if(typeName Valor_position isEqualTo "STRING") then {Valor_position = call compile format["%1", Valor_position];};
		Valor_playtime = call compile _playtime;
		Valor_arrested = false;

		if(_survival_zone isEqualTo 1) then {
			Valor_survival_zone = true;
		};

		Valor_map = [_map_revealed] call valor_fnc_map_hidement_mArray;
	};
};

if(Valor_alive isEqualTo 0) then {
	Valor_gear = [];
	Valor_position = [];
	Valor_arrested = false;
} else {
	Valor_thirst = Valor_stats select 0;
	Valor_hunger = Valor_stats select 1;
	player setdamage (Valor_stats select 2);
	Valor_blood = Valor_stats select 3;
};