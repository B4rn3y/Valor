

private ["_range_for_spawn","_var","_var1","_spawn_positions","_house"];

_range_for_spawn = param[0,80,[0]];
{
      _var = _x getvariable["valor_base_ids",[]];
	   _var1 = _x getvariable["valor_outpost_ids",[]];
		_spawn_positions = getarray(missionConfigFile >> "Houses_spawn_config" >> (typeof _x) >> "pos");
		if(!(_spawn_positions isEqualTo []) && (_var isequalto []) && (_var1 isequalto [])) then {
			_house = _x;
			{
				[_x,_house] spawn valor_fnc_spawn_loot;
			} foreach _spawn_positions;
			sleep 0.2;


		};



} foreach ( (getpos player) nearObjects ["House",_range_for_spawn]);