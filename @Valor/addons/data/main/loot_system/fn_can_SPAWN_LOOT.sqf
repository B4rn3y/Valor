



private ["_marker","_ret"];
_marker = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "no_loot_spawn_Zones");

_ret = true;
{
	if((player distance (getmarkerpos(_x select 0))) < (_x select 1)) exitWith {_ret = false;};
} foreach _marker;


_ret