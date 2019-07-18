
private ["_chance","_loottable","_my_loot"];
_chance = param[0,-1,[1]];
_loottable = param[1,"",[""]];
if(_loottable isEqualTo "") exitWith {systemchat "ERROR: Loottable unbekannt"};
if(_chance isEqualTo -1) exitWith {systemchat "ERROR: Chance unbekannt"};
_my_loot = [];

_table = [];
call compile format["_table = lootspawn_config_%1",_loottable];
if(isnil "_table") exitWith {};
if(_table isEqualTo []) exitWith {};

{
	if((_x select 0) <= _chance && (_x select 1) >= _chance) exitWith {_my_loot = [_x select 2,_x select 3,_x select 4];};

} foreach _table;



_my_loot