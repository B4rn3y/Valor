
private ["_foreachindex","_valor_uid","_cash","_bankacc","_humanity","_gear","_stats","_adminlvel","_donorlevel","_alive","_position","_map_revealed","_playtime"];

{
	diag_log str [_foreachindex,_x];
	diag_log str[_foreachindex,typename _x];
} foreach _this;


if(!isnil "Valor_adminlevel" || !isnil "Valor_armylevel" || !isnil "Valor_donatorlevel" || !isnil "Valor_mediclevel") exitWith {
	Valor_VARS_SET = true;
	[profilename,getplayeruid player,profileNameSteam,format["Vars set before Login @ Player %1",player]] remoteexec["valor_fnc_logToDB",2];
	[player,format["Der Spieler %1(%2) Steamname %3 hatte eine compilefinal Variable vor dem Einloggen gesetzt",profilename,player,profileNameSteam]] remoteexec["valor_fnc_admin_inform",-2];
};

Valor_arrested = false;

switch(playerside) do {


	case independent: {
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



		Valor_UID = _valor_uid;
		Valor_cash = _cash;
		Valor_bankacc = _bankacc;
		Valor_stats = call compile ([_stats] call valor_fnC_mtoArray);
		Valor_gear = [_gear] call valor_fnc_mToArray;
		if(typeName Valor_gear isEqualTo "STRING") then {Valor_gear = call compile format["%1", Valor_gear];};

		Valor_adminlevel = compileFinal str _adminlvel;
		Valor_donatorlevel = compileFinal str _donorlevel;

		Valor_alive = _alive;
		Valor_position = [_position] call valor_fnc_mToArray;
		if(typeName Valor_position isEqualTo "STRING") then {Valor_position = call compile format["%1", Valor_position];};
		Valor_playtime = call compile _playtime;



		Valor_map = [_map_revealed] call valor_fnc_map_hidement_mArray;
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