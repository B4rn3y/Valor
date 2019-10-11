
private ["_foreachindex","_valor_uid","_cash","_bankacc","_humanity","_gear","_stats","_adminlvel","_donorlevel","_alive","_position","_map_revealed","_playtime","_arrested","_application","_xp","_classes","_stats_killed","_xp_info","_coplevel","_jailtime"];

{
	diag_log str [_foreachindex,_x];
	diag_log str[_foreachindex,typename _x];
} foreach _this;


if(!isnil "Valor_adminlevel" || !isnil "Valor_donatorlevel") exitWith {
	Valor_VARS_SET = true;
	[profilename,getplayeruid player,profileNameSteam,format["Vars set before Login @ Player %1",player]] remoteexec["valor_fnc_logToDB",2];
	[player,format["Der Spieler %1(%2) Steamname %3 hatte eine compilefinal Variable vor dem Einloggen gesetzt",profilename,player,profileNameSteam]] remoteexec["valor_fnc_admin_inform",-2];
};

Valor_arrested = 0;

switch(playerside) do {


	case civilian: {
		_valor_uid = param[0,-1,[1337,""]];
		_cash = param[1,-1,[1337,""]];
		_bankacc = param[2,-1,[1337]];
		_humanity = param[3,-1,[1337,""]];
		_gear = param[4,"",["",[]]];
		_stats = param[5,[],["",[]]];
		_adminlvel = param[6,0,[1337]];
		_donorlevel = param[7,0,[1337]];
		_alive = param[8,0,[1337]];
		_position = param[9,[],[[],""]];
		_map_revealed = param[10,"",[[],""]];
		_playtime = param[11,0,[1337,""]];
		_arrested = param[12,0,[1337]];
		_application = param[13,0,[0]];
		_xp = param[14,0,[0]];
		_classes = param[15,"",["",[]]];
		_stats_killed = param[16,"",["",[]]];
		_group = param[17,[],[[]]];



		Valor_UID = _valor_uid;
		Valor_cash = _cash;
		Valor_bankacc = _bankacc;
		Valor_stats = ([_stats] call valor_fnC_mtoArray);
		if(typeName Valor_stats isEqualTo "STRING") then {Valor_stats = call compile format["%1", Valor_stats];};
		Valor_gear = [_gear] call valor_fnc_mToArray;
		if(typeName Valor_gear isEqualTo "STRING") then {Valor_gear = call compile format["%1", Valor_gear];};

		Valor_adminlevel = compileFinal str _adminlvel;
		Valor_donatorlevel = compileFinal str _donorlevel;
		Valor_coplevel = compileFinal str 0;

		Valor_alive = _alive;
		Valor_position = [_position] call valor_fnc_mToArray;
		if(typeName Valor_position isEqualTo "STRING") then {Valor_position = call compile format["%1", Valor_position];};
		Valor_playtime = call compile _playtime;
		Valor_completed_quests = [];
		Valor_arrested = _arrested;
		Valor_XP = _xp;
		_xp_info = [Valor_XP] call valor_fnc_init_level;
		Valor_level = _xp_info select 0;
		Valor_level_xp = _xp_info select 1;
		Valor_xp_next_level = _xp_info select 2;
		Valor_xp_needed_level = _xp_info select 3;

		Valor_classes_unlock = call compile _classes;

		Valor_humanity = _humanity;
		Valor_stats_entities = call compile _stats_killed;

		if!(_application isEqualTo 0) then {
			if(_application isEqualTo 2) then {
				Valor_application = true;
			} else {
				Valor_application = false;
			};
		};

		Valor_group = _group;
		if!(Valor_group isEqualTo []) then {
			player setVariable["Valor_group_id",[(Valor_group select 0),(Valor_group select 2)],true];
		} else {
			player setVariable["Valor_group_id",[-1,"ERROR"],true];
		};
		Valor_map = [_map_revealed] call valor_fnc_map_hidement_mArray;
	};

	case opfor: {
		_valor_uid = param[0,-1,[1337,""]];
		_cash = param[1,-1,[1337,""]];
		_bankacc = param[2,-1,[1337]];
		_humanity = param[3,-1,[1337,""]];
		_gear = param[4,"",["",[]]];
		_stats = param[5,[],["",[]]];
		_adminlvel = param[6,0,[1337]];
		_donorlevel = param[7,0,[1337]];
		_alive = param[8,0,[1337]];
		_position = param[9,[],[[],""]];
		_map_revealed = param[10,"",[[],""]];
		_playtime = param[11,0,[1337,""]];
		_coplevel = param[12,0,[1337,""]];
		_xp = param[13,0,[0,""]];
		_classes = param[14,"",["",[]]];
		_stats_killed = param[15,"",["",[]]];

		if!(_coplevel > 0) then {
			NOT_WHITELISTED = true;
		};


		Valor_UID = _valor_uid;
		Valor_cash = _cash;
		Valor_bankacc = _bankacc;
		Valor_stats = ([_stats] call valor_fnC_mtoArray);
		if(typeName Valor_stats isEqualTo "STRING") then {Valor_stats = call compile format["%1", Valor_stats];};
		Valor_gear = [_gear] call valor_fnc_mToArray;
		if(typeName Valor_gear isEqualTo "STRING") then {Valor_gear = call compile format["%1", Valor_gear];};

		Valor_adminlevel = compileFinal str _adminlvel;
		Valor_donatorlevel = compileFinal str _donorlevel;
		Valor_coplevel = compilefinal str _coplevel;

		Valor_alive = _alive;
		Valor_position = [_position] call valor_fnc_mToArray;
		if(typeName Valor_position isEqualTo "STRING") then {Valor_position = call compile format["%1", Valor_position];};
		Valor_playtime = call compile _playtime;
		Valor_completed_quests = [];
		Valor_XP = _xp;
		_xp_info = [Valor_XP] call valor_fnc_init_level;
		Valor_level = _xp_info select 0;
		Valor_level_xp = _xp_info select 1;
		Valor_xp_next_level = _xp_info select 2;
		Valor_xp_needed_level = _xp_info select 3;
		Valor_arrested = 0;

		Valor_classes_unlock = call compile _classes;

		Valor_humanity = _humanity;
		Valor_stats_entities = call compile _stats_killed;

		Valor_group = [];
		Valor_map = [_map_revealed] call valor_fnc_map_hidement_mArray;

		player setVariable["cop",true,true];
	};



};
diag_log format["Valor Alive: %1 - Typename %2",Valor_alive,typename Valor_alive];
diag_log format["Valor Position: %1 - Typename %2",Valor_position,typename Valor_position];
if(Valor_alive isEqualTo 0) then {
	Valor_gear = [];
	Valor_position = [];
} else {
	Valor_thirst = Valor_stats select 0;
	Valor_hunger = Valor_stats select 1;
	player setdamage (Valor_stats select 2);
	Valor_blood = Valor_stats select 3;
};

diag_log format["Valor Alive: %1 - Typename %2",Valor_alive,typename Valor_alive];
diag_log format["Valor Position: %1 - Typename %2",Valor_position,typename Valor_position];



if(playerSide isEqualTo civilian && Valor_arrested isEqualTo 1) then {
	_jailtime = 15;
	_jailtime = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "jailtime");
	[_jailtime] spawn valor_fnc_arrested;
};

