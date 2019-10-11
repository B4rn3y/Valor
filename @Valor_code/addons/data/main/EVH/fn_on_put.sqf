/*
private ["_player","_container","_object","_var","_base_id","_gang_id","_config_id","_base_config","_stuff","_cargo","_arr_count_item","_classname","_amount_needed","_index","_txt","_all_items","_amount"];

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


	_all_items = true;
	{
		_classname = _x select 0;
		_amount = _x select 1;
		_amount_needed = _x select 2;
		if(_amount < _amount_needed) then {
			_all_items = false;
		};
	} foreach _arr_count_item;

	if(_all_items) then {
		[[_config_id,_id,_container],"valor_fnc_changeOutpostStatus",2] call valor_fnc_remoteexec;
		//[_config_id,_id,_container] remoteexec["valor_fnc_changeOutpostStatus",2];
		systemchat "Valor :: All items are available, sending build request to server";
	};


};

*/