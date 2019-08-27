private ["_type_killed","_humanity","_xp_add","_humanity_change","_text","_humanity_config","_humanity_border_B3","_humanity_border_B2","_humanity_border_B1","_humanity_border_SU","_humanity_border_H1","_humanity_border_H2","_humanity_border_H3","_role"];

_type_killed = param[0,"",[""]];
_humanity = param[1,2500,[0]];

if(_type_killed isEqualTo "") exitWith {};
_xp_add = 0;
_humanity_change = 0;
_text = "";
switch (_type_killed) do
{


	case "Bandit":
	{
		_xp_add =  getnumber(missionConfigFile >> "Valor_settings" >> "level_system" >> "bandit_killed");
		_humanity_change = getnumber(missionConfigFile >> "Valor_settings" >> "humanity" >> "bandit_killed");
		_text = "Bandit killed";
		Valor_stats_entities set[0,((Valor_stats_entities select 0)+1)];
	};

	case "Player":
	{
		_humanity_config = getArray(missionConfigFile >> "Valor_settings" >> "humanity" >> "humanity_config");

		_humanity_border_B3 = _humanity_config select 0;
		_humanity_border_B2 = _humanity_config select 1;
		_humanity_border_B1 = _humanity_config select 2;
		_humanity_border_SU = _humanity_config select 3;
		_humanity_border_H1 = _humanity_config select 4;
		_humanity_border_H2 = _humanity_config select 5;
		_humanity_border_H3 = _humanity_config select 6;



		_role = switch (true) do
		{
			case (_humanity <= _humanity_border_B3):
			{
				"bandit_3"
			};

			case (_humanity <= _humanity_border_B2):
			{
				"bandit_2"
			};

			case (_humanity <= _humanity_border_B1):
			{
				"bandit_1"
			};

			case (_humanity < _humanity_border_H1):
			{
				"survivor"
			};

			case (_humanity < _humanity_border_H2):
			{
				"hero_1"
			};

			case (_humanity < _humanity_border_H3):
			{
				"hero_2"
			};

			case (_humanity >= _humanity_border_H3):
			{
				"hero_3"
			};
		};

		_humanity_change = getnumber(missionConfigFile >> "Valor_settings" >> "humanity" >> format["kill_%1",_role]);

		_text = "Player killed";
		Valor_stats_entities set[1,((Valor_stats_entities select 1)+1)];
	};

	case "Zombie":
	{
		_xp_add =  getnumber(missionConfigFile >> "Valor_settings" >> "level_system" >> "zombie_killed");
		_humanity_change = getnumber(missionConfigFile >> "Valor_settings" >> "humanity" >> "zombie_killed");
		_text = "Zombie killed";
		Valor_stats_entities set[2,((Valor_stats_entities select 2)+1)];
	};

	case "Raptor":
	{
		_xp_add =  getnumber(missionConfigFile >> "Valor_settings" >> "level_system" >> "raptor_killed");
		_humanity_change = getnumber(missionConfigFile >> "Valor_settings" >> "humanity" >> "raptor_killed");
		_text = "Raptor killed";
		Valor_stats_entities set[4,((Valor_stats_entities select 4)+1)];
	};

};


if!(_xp_add isEqualTo 0) then {
	[_xp_add,_text] spawn valor_fnc_addexp;
};

if!(_humanity_change isEqualTo 0) then {
	[_humanity_change,_text] spawn valor_fnc_addHumanity;
};