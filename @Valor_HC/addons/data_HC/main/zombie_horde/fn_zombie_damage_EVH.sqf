
private ["_damage","_source","_bullet","_classname"];
_damage = _this select 2;
_source = _this select 3;
_bullet = _this select 4;


_classname = typeof _source;
if((_classname iskindof "LANDVEHICLE" || _classname isKindOf "SHIP" || _classname isKindOf "AIR") && _bullet isEqualTo "") then {_damage = 0;};
_damage