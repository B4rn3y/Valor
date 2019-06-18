private ["_damage","_damage_mult"];
_damage = _this select 2;
if(_damage isEqualTo 0) exitWith {0};

_damage_mult = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "zombie_horde_damage");
if(_damage_mult isEqualTo 0) exitWith {_damage};
_damage = _damage / _damage_mult;


_damage