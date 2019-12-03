
private ["_damage","_source","_bullet","_classname"];
_damage = _this select 2;
_source = _this select 3;
_bullet = _this select 4;
_instigator = _this select 6;

_classname = typeof _source;
if(isnull _instigator && _bullet isEqualTo "") then {_damage = 0;};
_damage

