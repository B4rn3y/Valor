
private ["_player","_container","_object","_var","_config_id","_build","_outpost_config","_stuff","_classname","_amount_needed","_index","_cargo","_arr_count_item","_cant_take","_amount","_removed","_foreachindex"];

_player = _this select 0;
_container = _this select 1;
_object = _this select 2;
if!(typeof _container isEqualTo "B_CargoNet_01_ammo_F") exitWith {};

// outposts
_var = _container getvariable "valor_outpost_ids";
if!(isnil "_var") exitWith {
	_id = _var select 0;
	_config_id = _var select 1;
	_build = _var select 2;
	_arr_count_item = [];
	_cargo = getItemCargo _container;


	_outpost_config = [_config_id] call valor_fnc_outpost_config;

	_stuff = _outpost_config select 2;


	{
		_classname = _x select 0;
		_amount_needed = _x select 1;
		_index = (_cargo select 0) find _classname;
		if!(_index isEqualTo -1) then {
			_arr_count_item pushBackUnique [_classname,(_cargo select 1) select _index,_amount_needed];
		} else {
			_arr_count_item pushBackUnique [_classname,0,_amount_needed];
		};


	} foreach _stuff;


	_cant_take = false;
	{
		_classname = _x select 0;
		_amount = _x select 1;
		_amount_needed = _x select 2;
		iF(_classname isEqualTo _object) exitWith {
			if(_amount <= _amount_needed) then {
				_cant_take = true;
			};
		};

	} foreach _arr_count_item;

	if(_cant_take) then {
		_removed = false;
		{
			if(_object in _x) exitWith {
				switch (_foreachindex) do
				{
					case 0:
					{
						player removeItemFromUniform _object;
						_removed = true;
					};

					case 1:
					{
						player removeItemFromVest _object;
						_removed = true;
					};

					case 2:
					{
						player removeItemFromBackpack _object;
						_removed = true;
					};


				};
			};
		} foreach [uniformItems player,vestItems player,backpackItems player];
		_container addItemCargoGlobal[_object,1];
	};



};
