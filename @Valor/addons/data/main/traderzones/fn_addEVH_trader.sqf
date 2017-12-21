

if(isnil "Valor_Damage_EVH") then {
	Valor_Damage_EVH = player addEventHandler["handleDamage",{_this call valor_fnc_handledamage_traderzone;}];
} else {
	player removeEventHandler ["handleDamage", Valor_Damage_EVH];
	Valor_Damage_EVH = nil;
};


if(isnil "Valor_GETIN_EVH") then {
	Valor_GETIN_EVH = player addEventHandler["GetInMan",{_this spawn valor_fnc_GetInEVH;}];
} else {
	player removeEventHandler ["GetInMan", Valor_GETIN_EVH];
	Valor_GETIN_EVH = nil;
};


if(isnil "Valor_OpenInventory_EVH") then {
	Valor_OpenInventory_EVH = player addEventHandler["InventoryOpened",{_this spawn valor_fnc_inventory_opened_trader;}];
} else {
	player removeEventHandler ["take", Valor_OpenInventory_EVH];
	Valor_OpenInventory_EVH = nil;
};



if(vehicle player isEqualTo player ) exitWith {};
if!(driver vehicle player isEqualTo player) exitWith {};
_var = (vehicle player) getvariable "allowed_players";
if(!isnil "Valor_GETIN_EVH") then {
	_arr = [];
	{
		_arr pushBackUnique (getplayeruid _x);
	} foreach (crew vehicle player);

	(vehicle player) setvariable["allowed_players",_arr,true];

} else {
	(vehicle player) setvariable["allowed_players",nil,true];
};


