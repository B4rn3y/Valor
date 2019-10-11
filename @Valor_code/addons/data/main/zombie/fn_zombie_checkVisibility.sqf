




private ["_zombie","_see_range","_smell_range","_visible_factor","_visible"];
_zombie = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];
if(isnull _zombie) exitWith {false};
if(isnull _target) exitWith {false};
if(!alive _target) exitWith {false};
_see_range = 40;
_smell_range = 2;
_visible_factor = 0.95;

_visible = [_zombie, "GEOM", vehicle _target] checkVisibility [eyepos _zombie, eyepos _target] > _visible_factor || _zombie distance _target < _smell_range;

if(_target getvariable["valor_zmbienoaggro",false]) then {_visible = false};

if(!_visible && _target isEqualTo (_zombie getvariable["VALOR_Target",Objnull]) || !alive _target) then {
	_zombie setvariable["VALOR_Target",Objnull];
};

if(_target isKindOf "LandVehicle" || _target isKindOf "Air") then {
	if(Count crew _target isEqualTo 0) then {
		_visible = false;
		_zombie setvariable["VALOR_Target",Objnull];
	};
};

_visible


