private ["_display","_pic_player","_str_text_humanity","_str_text_bandit","_str_text_murders","_str_text_zombies","_str_text_killed","_str_text_raptors","_str_text_bloodsucker","_str_text_hero_bandit","_humanity_config","_humanity_border_B3","_humanity_border_B2","_humanity_border_B1","_humanity_border_SU","_humanity_border_H1","_humanity_border_H2","_humanity_border_H3","_role","_foreachindex","_role_name"];


createDialog "humanity";

_display = findDisplay 3012;

_pic_player = _display displayCtrl 1201;

_str_text_humanity = _display displayCtrl 1101;
_str_text_bandit = _display displayCtrl 1102;
_str_text_murders = _display displayCtrl 1103;
_str_text_zombies = _display displayCtrl 1104;
_str_text_killed = _display displayCtrl 1105;
_str_text_raptors = _display displayCtrl 1106;
_str_text_bloodsucker = _display displayCtrl 1107;
_str_text_hero_bandit = _display displayCtrl 1108;

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
	case (Valor_humanity <= _humanity_border_B3):
	{
		"bandit_3"
	};

	case (Valor_humanity <= _humanity_border_B2):
	{
		"bandit_2"
	};

	case (Valor_humanity <= _humanity_border_B1):
	{
		"bandit_1"
	};

	case (Valor_humanity < _humanity_border_H1):
	{
		"survivor"
	};

	case (Valor_humanity < _humanity_border_H2):
	{
		"hero_1"
	};

	case (Valor_humanity < _humanity_border_H3):
	{
		"hero_2"
	};

	case (Valor_humanity >= _humanity_border_H3):
	{
		"hero_3"
	};
};

_pic_player ctrlSetText format["\UIs\textures\humanity\humanity_%1.paa",_role];

_str_text_humanity ctrlSetStructuredText parseText format["<t color='#000000' align='center' size='1.6'>%1</t>",[valor_humanity] call valor_fnc_numbertext];

{
	_x ctrlSetStructuredText parseText format["<t color='#000000' align='center' size='1.6'>%1</t>",(Valor_stats_entities select _foreachindex)];
} foreach [_str_text_bandit,_str_text_murders,_str_text_zombies,_str_text_killed,_str_text_raptors,_str_text_bloodsucker];

_role_name = switch (_role) do
{
	case "bandit_3":
	{
		"Bandit 3"
	};

	case "bandit_2":
	{
		"Bandit 2"
	};

	case "bandit_1":
	{
		"Bandit 1"
	};

	case "survivor":
	{
		"Survivor"
	};

	case "hero_1":
	{
		"Hero 1"
	};

	case "hero_2":
	{
		"Hero 2"
	};

	case "hero_3":
	{
		"Hero 3"
	};

};


_str_text_hero_bandit ctrlSetStructuredText parseText format[" <t size='1.1' color='#000000' align='center'>You are a %1</t> ",_role_name];