
private ["_range_for_spawn","_new_spawn_pos","_var","_var1","_spawn_positions","_Cooldown_time_conf","_time","_house","_perc","_min_loot_slots","_count","_d"];

_range_for_spawn = param[0,80,[0]];
_new_spawn_pos = [];
{
      _var = _x getvariable["valor_base_ids",[]];
	   _var1 = _x getvariable["valor_outpost_ids",[]];
		_spawn_positions = getarray(missionConfigFile >> "Houses_spawn_config" >> (typeof _x) >> "pos");
		_Cooldown_time_conf =  getnumber(missionConfigFile >> "Valor_settings" >> "loot_settings" >> "LootPile_house_spawn_cooldown");
		_time = _x getVariable["Valor_lootspawn_time",-2500];
		if(!(_spawn_positions isEqualTo []) && (_var isequalto []) && (_var1 isequalto []) && ((servertime - _time) > _Cooldown_time_conf)) then {
			_house = _x;
			_spawn_positions = _spawn_positions call BIS_fnc_arrayShuffle;
			_perc = getarray(missionConfigFile >> "Valor_settings" >> "loot_settings" >> "Loot_spawn_perc");
			_min_loot_slots =  getnumber(missionConfigFile >> "Valor_settings" >> "loot_settings" >> "Min_loot_slots");
			if(count(_spawn_positions) > _min_loot_slots) then {
				_count = ceil(count(_spawn_positions) * ((random(_perc)) /100));
				for "_d" from 1 to _count do {
					_new_spawn_pos pushback (_spawn_positions select _count);
				};
			} else {
				_new_spawn_pos = _spawn_positions;
			};
			{
				[_x,_house] spawn valor_fnc_spawn_loot;
			} foreach _spawn_positions;
			sleep 0.2;


		};



} foreach ( (getpos player) nearObjects ["House",_range_for_spawn]);