
private ["_probability","_rnd","_waittime","_zombie_amount","_gate_health","_event_time","_cop_amount_needed","_zombie_event_time_begin","_zed_damage","_outpost","_outpost_config","_outpost_name","_pos","_distance","_zombie_spawn_pos","_gate","_start_time"];
iF(isnil "Valor_outposts_build") exitWith {};
if(Valor_outposts_build isEqualTo []) exitWith {};
_probability = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "zombie_horde_probability");
_rnd = random 100;
if!(_rnd > 0 && _rnd <= _probability) exitWith {};
_waittime = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "zombie_horde_start_time");
_zombie_amount = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "zombie_horde_amount");
_gate_health = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "outpost_gate_health");
_event_time = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "zombie_event_time");
_cop_amount_needed = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "amount_cops_needed");
_zombie_event_time_begin = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "zombie_event_time_begin");
_zed_damage = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "zombie_damage");
_waittime = random _waittime;


_outpost = selectRandom Valor_outposts_build;
_outpost_config = [_outpost] call valor_fnc_outpost_config;
_outpost_name = _outpost_config select 5;
_pos = (_outpost_config select 3) select 0;
_distance = (_outpost_config select 3) select 1;
_zombie_spawn_pos = _outpost_config select 4;
_gate = nearestObject[_pos,"Land_Net_Fence_Gate_F"];
_start_time = servertime + _waittime;
[_waittime,_zombie_amount,_gate_health,_gate,_zombie_spawn_pos,_event_time,_cop_amount_needed,_zombie_event_time_begin,_outpost_name,_zed_damage,_outpost] spawn valor_fnc_zombie_monitoring_event_main;