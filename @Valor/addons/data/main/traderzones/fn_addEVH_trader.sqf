

if(isnil "Valor_Damage_EVH") then {
	Valor_Damage_EVH = player addEventHandler["handleDamage",{_this call valor_fnc_handledamage_traderzone;}];
} else {
	player removeEventHandler ["handleDamage", Valor_Damage_EVH];
	Valor_Damage_EVH = nil;
};




