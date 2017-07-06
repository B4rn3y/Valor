private ["_fail","_uniform","_goggles","_headgear","_backpack","_rnd"];
_fail = false;
switch (playerside) do
{
	case civilian:
	{
		_uniform = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "civilian_uniforms");
		_goggles = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "civilian_goggles");
		_headgear = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "civilian_headgear");
		_backpack = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "civilian_backpack");
	};

	case west:
	{
		_uniform = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "west_uniforms");
		_goggles = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "west_goggles");
		_headgear = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "west_headgear");
		_backpack = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "west_backpack");
	};

	case independent:
	{
		_uniform = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "independent_uniforms");
		_goggles = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "independent_goggles");
		_headgear = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "independent_headgear");
		_backpack = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "independent_backpack");
	};

	default
	{
		_fail = true;
	};
};

if(_fail) exitWith {};

player forceAddUniform _uniform;
player addBackpack _backpack;
_rnd = random 100;
if(_rnd >= 50) then {
	player addGoggles _goggles;
};

_rnd = random 100;
if(_rnd >= 50) then {
	player addHeadgear _headgear;
};

if(getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Spawn_with_map") isEqualTo 1) then {
	player additem "ItemMap";
	player assignItem "ItemMap";
};