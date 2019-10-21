private ["_control_and_index","_place","_control","_index","_idc","_item_name","_classname","_config","_displayName","_food_item_info","_type","_amount_fill","_sounds","_item_add","_fountains","_medic_item_info","_amount_heal","_new_damage"];


_control_and_index = param[0,[],[[]]];
if(_control_and_index isEqualTo []) exitWith {};
_place = param[1,"",[""]];
if(_place isEqualTo "") exitWith {};

_control = _control_and_index select 0;
_index = _control_and_index select 1;
_idc = ctrlIDC _control;
_item_name = lbText [_idc, _index];
_classname = "";

switch (_place) do
{
	case "u":
	{
		{
			_config = [_x] call valor_fnc_getConfig;
			_displayName = getText(configFile >> _config >> _x >> "displayName");
			if(_displayName isEqualTo _item_name) exitWith {_classname = _x;};
		} foreach (uniformItems player);
	};

	case "v":
	{
		{
			_config = [_x] call valor_fnc_getConfig;
			_displayName = getText(configFile >> _config >> _x >> "displayName");
			if(_displayName isEqualTo _item_name) exitWith {_classname = _x;};
		} foreach (vestItems player);
	};

	case "b":
	{
		{
			_config = [_x] call valor_fnc_getConfig;
			_displayName = getText(configFile >> _config >> _x >> "displayName");
			if(_displayName isEqualTo _item_name) exitWith {_classname = _x;};
		} foreach (backpackItems player);
	};
};

//systemChat _classname;


_food_item_info = getArray(missionConfigFile >> "Valor_settings" >> "food_items" >> _classname);
//_food_item_info = ["food",60,["action_eat_chips_0","action_eat_chips_1","action_eat_chips_2"],""];
if!(_food_item_info isEqualTo []) exitWith {

	_type = _food_item_info select 0;
	_amount_fill = _food_item_info select 1;
	_sounds = _food_item_info select 2;
	_item_add = _food_item_info select 3;



	if(_type isEqualTo "food") then {
		if((Valor_hunger + _amount_fill) > 100) then {
			Valor_hunger = 100;
		} else {
			Valor_hunger = Valor_hunger + _amount_fill;
		};
		playSound selectRandom _sounds;
	} else {
		if((Valor_thirst + _amount_fill) > 100) then {
			Valor_thirst = 100;
		} else {
			Valor_thirst = Valor_thirst + _amount_fill;
		};

		playSound selectRandom _sounds;
	};

	[_place,_classname,_item_add] spawn {
		switch (_this select 0) do
		{
			case "u":
			{
				player removeItemFromUniform (_this select 1);
				if!((_this select 2) isEqualTo "") then {
					player addItemToUniform (_this select 2);
				};
			};

			case "v":
			{
				player removeItemFromVest (_this select 1);
				if!((_this select 2) isEqualTo "") then {
					player addItemToVest (_this select 2);
				};
			};

			case "b":
			{
				player removeItemFromBackpack (_this select 1);
				if!((_this select 2) isEqualTo "") then {
					player addItemToBackpack (_this select 2);
				};
			};
		};
	};
	false
};

_medic_item_info = getArray(missionConfigFile >> "Valor_settings" >> "medic_items" >> _classname);

if!(_medic_item_info isEqualTo []) exitWith {

	_amount_heal = _medic_item_info select 0;
	_sounds = _medic_item_info select 1;
	_item_add = _medic_item_info select 2;

	_new_damage = getDammage player - (_amount_heal / 100);
	if(_new_damage < 0 || (missionNamespace getvariable["Valor_skill_FA",false])) then {
		_new_damage = 0;
	};

	player setdamage _new_damage;

	playSound selectrandom _sounds;
	if(vehicle player isEqualTo player) then {
		player playMoveNow "ainvpknlmstpslaywrfldnon_medic";
	};

	[_place,_classname,_item_add] spawn {
		switch (_this select 0) do
		{
			case "u":
			{
				player removeItemFromUniform (_this select 1);
				if!((_this select 2) isEqualTo "") then {
					player addItemToUniform (_this select 2);
				};
			};

			case "v":
			{
				player removeItemFromVest (_this select 1);
				if!((_this select 2) isEqualTo "") then {
					player addItemToVest (_this select 2);
				};
			};

			case "b":
			{
				player removeItemFromBackpack (_this select 1);
				if!((_this select 2) isEqualTo "") then {
					player addItemToBackpack (_this select 2);
				};
			};
		};
	};
	false
};


// ["valor_blueprint1","valor_blueprint2","valor_blueprint3","valor_blueprint4","valor_blueprint5","valor_blueprint6","valor_blueprint7"]
// add classname here together with functions
switch (_classname) do
{
	case "valor_waterbottle_01_empty" : {
		if!(vehicle player isEqualTo player) exitWith {};
		_fountains = nearestTerrainObjects[player,["FOUNTAIN"],3.5];
		if!(_fountains isEqualTo []) then {
			_item_add = "valor_bottleplastic_v2";
			playSound "action_fillwater_0";
			[_classname,_item_add,_place] spawn {
				switch (_this select 2) do
				{
					case "u":
					{
						player removeItemFromUniform (_this select 0);
						if!((_this select 1) isEqualTo "") then {
							player addItemToUniform (_this select 1);
						};
					};

					case "v":
					{
						player removeItemFromVest (_this select 0);
						if!((_this select 1) isEqualTo "") then {
							player addItemToVest (_this select 1);
						};
					};

					case "b":
					{
						player removeItemFromBackpack (_this select 0);
						if!((_this select 1) isEqualTo "") then {
							player addItemToBackpack (_this select 1);
						};
					};
				};
			};
		};
	};

	case "valor_blueprint1": // Hero_lvl_1_house
	{
		[1,_classname,_place] spawn valor_fnc_place_Base;
	};

	case "valor_blueprint2": // Hero_lvl_2_house
	{
		[2,_classname,_place] spawn valor_fnc_place_Base;
	};

	case "valor_blueprint3": // Hero_lvl_3_house
	{
		[3,_classname,_place] spawn valor_fnc_place_Base;
	};

	case "valor_blueprint4": // Bandit_lvl_1_house
	{
		[4,_classname,_place] spawn valor_fnc_place_Base;
	};

	case "valor_blueprint5": // Bandit_lvl_2_house
	{
		[5,_classname,_place] spawn valor_fnc_place_Base;
	};

	case "valor_blueprint6": // Bandit_lvl_3_house
	{
		[6,_classname,_place] spawn valor_fnc_place_Base;
	};

	case "valor_blueprint7": // Big Fortress
	{
		[7,_classname,_place] spawn valor_fnc_place_Base;
	};

	case "valor_blueprint8": // Wall entrance
	{
		[8] spawn valor_fnc_place_wall;
	};

	case "valor_blueprint9": // Wall
	{
		[9] spawn valor_fnc_place_wall;
	};

};















false