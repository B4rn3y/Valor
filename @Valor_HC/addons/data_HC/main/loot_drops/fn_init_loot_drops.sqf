

private ["_waittime_array","_av_planes","_radius","_item_amount","_loottable_compiled","_conter","_min","_max","_diff","_mult","_loottable","_counter"];

_waittime_array = getarray(missionConfigFile >> "Valor_settings" >> "loot_drops" >> "waittime");
_av_planes = getarray(missionConfigFile >> "Valor_settings" >> "loot_drops" >> "planes");
_radius = getnumber(missionConfigFile >> "Valor_settings" >> "loot_drops" >> "plane_radius");
_item_amount = getnumber(missionConfigFile >> "Valor_settings" >> "loot_drops" >> "item_amount");


waitUntil {!isnil "lootspawn_config_loot_drop"};
waitUntil {!isnil "lootspawn_config_m_military"};
waitUntil {!isnil "lootspawn_config_h_military"};

_loottable_compiled = [];
_conter = 0;
{
	_min = call compile (_x select 0);
	_max = call compile (_x select 1);
	_loottable_compiled pushback [_min,_max,_x select 2,_x select 3, (call compile (_x select 4))];
	_diff = _max - _min;
	_conter = _conter + _diff;
} foreach (lootspawn_config_loot_drop + lootspawn_config_m_military + lootspawn_config_h_military);

_mult = 100/_conter;
_loottable = [];
_counter = 0;
{
	_diff = (_x select 1)- (_x select 0);
	_diff = _diff * _mult;
	_loottable pushback[_counter,(_counter + _diff),_x select 2,_x select 3, _x select 4];
	_counter = _counter + _diff;
} foreach _loottable_compiled;

[_waittime_array,_av_planes,_radius,_loottable,_item_amount] spawn valor_fnc_loot_drop_cycle;

