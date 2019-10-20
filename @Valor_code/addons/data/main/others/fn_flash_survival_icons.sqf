private ["_water","_hunger_pos","_water_pos","_counter","_water_pic","_hunger_pic"];


_water = param[0,false,[false]];


_hunger_pos = [0.809414 * safezoneW + safezoneX,0.929815 * safezoneH + safezoneY,0.0407032 * safezoneW,0.0744445 * safezoneH];
_water_pos = [0.766797 * safezoneW + safezoneX,0.92963 * safezoneH + safezoneY,0.0407032 * safezoneW,0.0744445 * safezoneH];
_counter = 1;


if(_water) then {
	_water_pic = (findDisplay 46) ctrlCreate ["RscPicture", -1];
	_water_pic ctrlSetPosition _water_pos;
	_water_pic ctrlSetText "\UIs\textures\HUD\status_thirst_border_CA.paa";
	_water_pic ctrlSetFade 1;
	_water_pic ctrlCommit 0;
	while {valor_thirst <= 0} do
	{
		sleep 1;
		if((ctrlFade _water_pic) isEqualTo 1) then {
			_water_pic ctrlSetFade 0;
			_water_pic ctrlCommit 0.5;
		} else {
			_water_pic ctrlSetFade 1;
			_water_pic ctrlCommit 0.5;
		};
		_counter = _counter + 1;
		if(_counter isEqualTo 30) then {
			_counter = 1;
			playSound selectRandom["cough_2","cough_1","cough_0"];
			player setdamage (damage player + 0.05);
		};
	};
	ctrlDelete _water_pic;
} else {
	_hunger_pic = (findDisplay 46) ctrlCreate ["RscPicture", -1];
	_hunger_pic ctrlSetPosition _hunger_pos;
	_hunger_pic ctrlSetText "\UIs\textures\HUD\status_food_border_CA.paa";
	_hunger_pic ctrlSetFade 1;
	_hunger_pic ctrlCommit 0;
	while {valor_hunger <= 0} do
	{
		sleep 1;
		if((ctrlFade _hunger_pic) isEqualTo 1) then {
			_hunger_pic ctrlSetFade 0;
			_hunger_pic ctrlCommit 0.5;
		} else {
			_hunger_pic ctrlSetFade 1;
			_hunger_pic ctrlCommit 0.5;
		};
		_counter = _counter + 1;
		if(_counter isEqualTo 30) then {
			_counter = 1;
			playSound selectRandom["cough_2","cough_1","cough_0"];
			player setdamage (damage player + 0.05);
		};
	};
	ctrlDelete _hunger_pic;
};