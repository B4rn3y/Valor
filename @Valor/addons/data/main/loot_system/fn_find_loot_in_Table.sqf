private ["_chance","_loottable","_my_loot"];
_chance = param[0,-1,[1]];
_loottable = param[1,"",[""]];
if(_loottable isEqualTo "") exitWith {systemchat "ERROR: Loottable unbekannt"};
if(_chance isEqualTo -1) exitWith {systemchat "ERROR: Chance unbekannt"};
_my_loot = [];
{
	if((_x select 0) isequalto _loottable) then {
		{
			if((_x select 0) <= _chance && (_x select 1) >= _chance) exitWith {_my_loot = [_x select 2,_x select 3,_x select 4];};

		} foreach (_x select 1);


	};
	if!(_my_loot isequalto []) exitWith {};

} foreach lootspawn_config;
_my_loot