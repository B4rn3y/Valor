

private ["_ui","_progressbar","_str_text_inside_progressbar","_lvl_display","_hunger_inside","_thirst_inside","_radiation_pic","_health_pic","_dmg_player"];

_ui = uiNamespace getVariable ["valor_HUD",displayNull];
if(isnull _ui) exitWith {};
_progressbar = _ui displayCtrl 1100;
_str_text_inside_progressbar = _ui displayCtrl 1099;
_lvl_display = _ui displayCtrl 1101;
_hunger_inside = _ui displayCtrl 1201;
_thirst_inside = _ui displayCtrl 1203;
_radiation_pic = _ui displayCtrl 1204;
_health_pic = _ui displayCtrl 1205;

_progressbar progressSetPosition (Valor_level_xp/Valor_xp_needed_level);
_str_text_inside_progressbar ctrlSetStructuredText parsetext format["<t  size='1.0' align='center'>%1 / %2</t>",Valor_level_xp,Valor_xp_needed_level];
_lvl_display ctrlSetStructuredText parsetext format["<t  size='0.9' align='center'>%1</t>",Valor_level];

_dmg_player = damage player;

switch (true) do
{
	case (_dmg_player > 0.8):
	{
		_health_pic ctrlSetText "\UIs\textures\HUD\health_1.paa";
	};

	case (_dmg_player > 0.6):
	{
		_health_pic ctrlSetText "\UIs\textures\HUD\health_2.paa";
	};

	case (_dmg_player > 0.4):
	{
		_health_pic ctrlSetText "\UIs\textures\HUD\health_3.paa";
	};

	case (_dmg_player > 0):
	{
		_health_pic ctrlSetText "\UIs\textures\HUD\health_4.paa";
	};

	case (_dmg_player isEqualTo 0):
	{
		_health_pic ctrlSetText "\UIs\textures\HUD\health_5.paa";
	};

};


switch (true) do
{
	case (Valor_hunger > 80):
	{
		_hunger_inside ctrlSetText "\UIs\textures\HUD\status_food_inside_4_ca.paa";
	};

	case (Valor_hunger > 60):
	{
		_hunger_inside ctrlSetText "\UIs\textures\HUD\status_food_inside_3_ca.paa";
	};

	case (Valor_hunger > 40):
	{
		_hunger_inside ctrlSetText "\UIs\textures\HUD\status_food_inside_2_ca.paa";
	};

	case (Valor_hunger > 20):
	{
		_hunger_inside ctrlSetText "\UIs\textures\HUD\status_food_inside_1_ca.paa";
	};

	default
	{
		_hunger_inside ctrlSetText "\UIs\textures\HUD\status_food_inside_0_ca.paa";
	};

};


switch (true) do
{
	case (Valor_thirst > 80):
	{
		_thirst_inside ctrlSetText "\UIs\textures\HUD\status_thirst_inside_4_ca.paa";
	};

	case (Valor_thirst > 60):
	{
		_thirst_inside ctrlSetText "\UIs\textures\HUD\status_thirst_inside_3_ca.paa";
	};

	case (Valor_thirst > 40):
	{
		_thirst_inside ctrlSetText "\UIs\textures\HUD\status_thirst_inside_2_ca.paa";
	};

	case (Valor_thirst > 20):
	{
		_thirst_inside ctrlSetText "\UIs\textures\HUD\status_thirst_inside_1_ca.paa";
	};

	default
	{
		_thirst_inside ctrlSetText "\UIs\textures\HUD\status_thirst_inside_0_ca.paa";
	};

};

if(Valor_radiation > 0) then {

	_radiation_pic ctrlSetFade 0;
	_radiation_pic ctrlCommit 0;
	switch (true) do
	{
		case (Valor_radiation >= 100):
		{
			_radiation_pic ctrlSetText "\UIs\textures\HUD\radiation_100.paa";
		};

		case (Valor_radiation > 85):
		{
			_radiation_pic ctrlSetText "\UIs\textures\HUD\radiation_85.paa";
		};

		case (Valor_radiation > 75):
		{
			_radiation_pic ctrlSetText "\UIs\textures\HUD\radiation_75.paa";
		};

		case (Valor_radiation > 60):
		{
			_radiation_pic ctrlSetText "\UIs\textures\HUD\radiation_60.paa";
		};

		case (Valor_radiation > 40):
		{
			_radiation_pic ctrlSetText "\UIs\textures\HUD\radiation_40.paa";
		};

		case (Valor_radiation > 20):
		{
			_radiation_pic ctrlSetText "\UIs\textures\HUD\radiation_20.paa";
		};

		default
		{
			_radiation_pic ctrlSetText "\UIs\textures\HUD\radiation_0.paa";
		};

	};
} else {
	_radiation_pic ctrlSetFade 1;
	_radiation_pic ctrlCommit 0;
};