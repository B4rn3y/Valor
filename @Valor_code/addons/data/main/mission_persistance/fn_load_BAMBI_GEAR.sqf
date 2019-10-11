
private ["_uniform","_goggles","_headgear","_backpack","_rnd","_vest"];

switch (playerside) do
{
	case civilian:
	{
		_uniform = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "uniforms");
		_goggles = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "goggles");
		_headgear = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "headgear");
		_backpack = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "backpack");


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

		0 spawn {
			Valor_gear_loaded = true;
			sleep 3;
			Valor_gear_loaded = nil;
		};
	};

	case opfor:
	{
		_uniform = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "uniforms_cop");
		_goggles = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "goggles_cop");
		_headgear = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "headgear_cop");
		_backpack = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "backpack_cop");
		_vest = selectRandom getarray(missionConfigFile >> "Valor_settings" >> "Bambi_gear" >> "vest_cop");

		player forceAddUniform _uniform;
		player addBackpack _backpack;
		player addGoggles _goggles;
		player addHeadgear _headgear;
		player addVest _vest;
		player additem "ItemMap";
		player assignItem "ItemMap";

		0 spawn {
			Valor_gear_loaded = true;
			sleep 3;
			Valor_gear_loaded = nil;
		};

	};
};


