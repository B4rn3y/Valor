private ["_pos","_house","_house_classname","_rnd","_near_weaponholder","_loot","_log_items","_conf","_holder","_classname","_count","_typ"];

_pos = param[0,[],[[]]];
_house = param[1,objNull,["",objNull]];
if(isnull _house) exitWith {};
_house_classname = typeOf _house;
if(_house_classname isEqualTo "") exitWith {if!(isnil "valor_debug") then {systemchat "ERROR: House Classname unbekannt"};0};
if(_pos isEqualTo []) exitWith {if!(isnil "valor_debug") then {systemchat "ERROR: POS unbekannt"};0};
_rnd = random 101;


_pos = _house modelToWorld _pos;
_near_weaponholder = nearestObjects[_pos,["groundweaponholder"],1];
if!(_near_weaponholder isEqualTo []) exitWith {0};
sleep random 10;
_near_weaponholder = nearestObjects[_pos,["groundweaponholder"],1];
if!(_near_weaponholder isEqualTo []) exitWith {0};
_loot = [_rnd,([_house_classname,_house] call valor_fnc_find_loottable)] call valor_fnc_find_loot_in_table;
if(_loot isEqualTo []) exitWith {if!(isnil "valor_debug") then {systemchat "ERROR: LOOT NIL"};0};

_house setVariable["Valor_lootspawn_time",servertime];

_log_items = getarray(missionConfigFile >> "Valor_settings" >> "loot_settings" >> "Loot_log_items");
if((_loot select 0) in _log_items) then {
	_conf = [(_loot select 0)] call valor_fnc_getconfig;
	[[format["%1(%2) found a %3(%4) @ Pos %5",profileName,getPlayerUID player,gettext(configFile >> _conf >> (_loot select 0) >> "displayname"),(_loot select 0),getPosATL player]],"valor_fnc_log",2] spawn valor_fnC_remoteexec;
};


_holder =  createVehicle ["groundweaponholder",_pos, [], 0, "can_Collide"];

switch ((_loot select 1)) do
{
	case "item":
	{
		_holder addItemCargoGlobal [(_loot select 0), 1];
	};

	case "weapon":
	{
		_holder addWeaponCargoGlobal [(_loot select 0), 1];
	};

	case "magazin":
	{
		_holder addMagazineCargoGlobal [(_loot select 0), 1];
	};

	case "backpack":
	{
		_holder addBackpackCargoGlobal [(_loot select 0), 1];
	};

	default
	{
		_holder addItemCargoGlobal [(_loot select 0), 1];
	};
};

{
	_classname = _x select 0;
	_count = _x select 1;
	_typ = _x select 2;

	switch (_typ) do
	{
		case "item":
		{
			_holder addItemCargoGlobal [_classname, _count];
		};

		case "weapon":
		{
			_holder addWeaponCargoGlobal [_classname, _count];
		};

		case "magazin":
		{
			_holder addMagazineCargoGlobal [_classname, _count];
		};

		case "backpack":
		{
			_holder addBackpackCargoGlobal [_classname, _count];
		};

		default
		{
			_holder addItemCargoGlobal [_classname, _count];
		};
	};




} foreach (_loot select 2);


1