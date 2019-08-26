

private ["_class_id","_remove","_index","_foreachindex"];

_class_id = param[0,-1,[0]];
_remove = param[1,false,[false]];
if(_class_id isEqualTo -1) exitWith {};

if(isnil "Valor_classes_unlock") exitWith {};
if(isnil "Valor_level") exitWith {};


if(_remove) then {
	_index = -1;
	{
		if((_x select 1) isEqualTo _class_id) exitWith {_index = _foreachindex;};
	} foreach Valor_classes_unlock;

	if(_index isEqualTo -1) exitWith {};
	Valor_classes_unlock set[_index,[true,-1]];
} else {
	_index = -1;
	{
		if((_x select 1) isEqualTo -1) exitWith {_index = _foreachindex;};
	} foreach Valor_classes_unlock;
	if(_index isEqualTo -1) exitWith {systemChat "Valor :: You dont have a free class slot, remove one class or unlock more class slots."};
	Valor_classes_unlock set[_index,[true,_class_id]];

};

0 call valor_fnc_updateClassMenu;
Valor_class_changed = true;