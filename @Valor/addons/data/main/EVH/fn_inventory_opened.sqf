
private ["_container","_container2","_exit","_var","_mode","_number","_time","_config_id","_build","_outpost_config","_stuff","_cargo","_arr_count_item","_classname","_amount_needed","_index","_txt","_amount","_base_id","_gang_id","_object_id","_group_id","_base_config"];
_container = _this select 1;
_container2 = _this select 2;

// setup evh for double click action
waituntil {!(isnull (finddisplay 602))};
((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "[_this,""u""] call valor_fnc_inventory_useItem"]; //uniform
((findDisplay 602) displayCtrl 638 ) ctrlSetEventHandler ["LBDblClick", "[_this,""v""] call valor_fnc_inventory_useItem"]; // vest
((findDisplay 602) displayCtrl 619 ) ctrlSetEventHandler ["LBDblClick", "[_this,""b""] call valor_fnc_inventory_useItem"]; // backpack


// vehicles inventory handling
if(_container iskindof "Landvehicle" || _container iskindof "AIR" || _container iskindof "SHIP" || _container2 iskindof "Landvehicle" || _container2 iskindof "AIR" || _container2 iskindof "SHIP") exitWith {

	if(playerSide in [opfor,independent,blufor]) exitWith {};
	_exit = false;
	_var = _container getvariable "group_restricted";
	if(isnil "_var") exitWith {};

	_mode = _var select 0;
	_number = _var select 1;
	_var = nil;
	switch (_mode) do
	{
		case 1:
		{
			if(isnil "valor_group") exitWith {_exit = true;};
			if(valor_group isEqualTo []) exitWith {_exit = true;};

			if!(_number isEqualTo (valor_group select 0)) exitWith {_exit = true;};
		};

		case -2:
		{
			_exit = true;
		};

		default
		{
			if!(_number isEqualTo (getplayeruid player)) exitWith {_exit = true;};
		};
	};




	if!(_exit) then {
		if(_container2 iskindof "Landvehicle" || _container2 iskindof "AIR" || _container2 iskindof "SHIP") then {
			_var = _container2 getvariable "group_restricted";
			if(isnil "_var") exitWith {};

			_mode = _var select 0;
			_number = _var select 1;

			switch (_mode) do
			{
				case 1:
				{
					if(isnil "valor_group") exitWith {_exit = true;};
					if(valor_group isEqualTo []) exitWith {_exit = true;};

					if!(_number isEqualTo (valor_group select 0)) exitWith {_exit = true;};
				};

				case -2:
				{
					_exit = true;
				};

				default
				{
					if!(_number isEqualTo (getplayeruid player)) exitWith {_exit = true;};
				};
			};
		};
	};


	if(_exit) exitWith {
		0 spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			for "_i" from 1 to 6 do {
		        closeDialog 0;
		        sleep 0.2;
		    };
		    waitUntil {(!isNull (findDisplay 602))};
		    closeDialog 0;
		    closeDialog 0;
		};
	};

};

if!(typeof _container isEqualTo "B_CargoNet_01_ammo_F") exitWith {};

// cop crate
_var = nil;

_var = _container getvariable "cop";
// close for all others the cops
if(!(isnil "_var") && playerside != opfor) exitWith {0 spawn {waitUntil {dialog}; _time = diag_tickTime; while {diag_tickTime < (_time + 3)} do {closeDialog 0; sleep 0.1;};};};
// cops can use it
if!(isnil "_var") exitWith {};


// outposts
_var = _container getvariable "valor_outpost_ids";
if!(isnil "_var") exitWith {
	_id = _var select 0;
	_config_id = _var select 1;
	_build = _var select 2;



	_outpost_config = [_config_id] call valor_fnc_outpost_config;

	_stuff = _outpost_config select 2;

	while {dialog} do
	{
		_cargo = getItemCargo _container;

		_arr_count_item = [];


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


		_txt = "<t size='1.3' align='center' >Items:</t><br/>";

		{
			_classname = _x select 0;
			_amount = _x select 1;
			_amount_needed = _x select 2;
			if(_amount >= _amount_needed) then {
				_txt = _txt + format[" <t size='1.2' align='center' color='#1BB500'>%1 / %2 </t><img size='1.2' image='%3'/><t size='1.2' align='center' color='#1BB500'> %4</t><br/> ",_amount,_amount_needed,(getText (configFile >> 'CfgWeapons' >> _classname >> 'picture')),(getText (configFile >> 'CfgWeapons' >> _classname >> 'displayname'))];
			} else {
				_txt = _txt + format[" <t size='1.2' align='center' color='#A40303'>%1 / %2 </t><img size='1.2' image='%3'/><t size='1.2' align='center' color='#A40303'> %4</t><br/> ",_amount,_amount_needed,(getText (configFile >> 'CfgWeapons' >> _classname >> 'picture')),(getText (configFile >> 'CfgWeapons' >> _classname >> 'displayname'))];
			};
		} foreach _arr_count_item;

		hint parseText _txt;
		sleep 1;
	};
};









// bases
_var = nil;
_var = _container getvariable "valor_base_ids";
if(isnil "_var") exitWith {};
if(isnil "valor_group") exitWith {0 spawn {waitUntil {dialog}; _time = diag_tickTime; while {diag_tickTime < (_time + 3)} do {closeDialog 0; sleep 0.1;};};};
iF(valor_group isEqualTo []) exitWith {0 spawn {waitUntil {dialog}; _time = diag_tickTime; while {diag_tickTime < (_time + 3)} do {closeDialog 0; sleep 0.1;};};};

_base_id = _var select 0;
_gang_id = _var select 1;
_config_id = _var select 2;
_object_id = -1;
_group_id = valor_group select 0;
if!(_group_id isEqualTo _gang_id) exitWith {0 spawn {waitUntil {dialog}; _time = diag_tickTime; while {diag_tickTime < (_time + 3)} do {closeDialog 0; sleep 0.1;};};};

if(count _var > 3) then {
	_object_id = _var select 3;
};

if (_base_id isequalto -1) exitWith {diag_log "Valor :: Var _base_id of a crate is nil"};
if!(_object_id isEqualTo -1) exitWith {};

_base_config = [_config_id] call valor_fnc_base_config;

_stuff = _base_config select 2;

while {dialog} do {
	_cargo = getItemCargo _container;

	_arr_count_item = [];


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


	_txt = "<t size='1.3' align='center' >Items:</t><br/>";

	{
		_classname = _x select 0;
		_amount = _x select 1;
		_amount_needed = _x select 2;
		if(_amount >= _amount_needed) then {
			_txt = _txt + format[" <t size='1.2' align='center' color='#1BB500'>%1 / %2 </t><img size='1.2' image='%3'/><t size='1.2' align='center' color='#1BB500'> %4</t><br/> ",_amount,_amount_needed,(getText (configFile >> 'CfgWeapons' >> _classname >> 'picture')),(getText (configFile >> 'CfgWeapons' >> _classname >> 'displayname'))];
		} else {
			_txt = _txt + format[" <t size='1.2' align='center' color='#A40303'>%1 / %2 </t><img size='1.2' image='%3'/><t size='1.2' align='center' color='#A40303'> %4</t><br/> ",_amount,_amount_needed,(getText (configFile >> 'CfgWeapons' >> _classname >> 'picture')),(getText (configFile >> 'CfgWeapons' >> _classname >> 'displayname'))];
		};
	} foreach _arr_count_item;

	hint parseText _txt;
	sleep 1;
};








