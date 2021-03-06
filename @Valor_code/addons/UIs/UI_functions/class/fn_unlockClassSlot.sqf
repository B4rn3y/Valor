private ["_class_slot","_entry","_class_unlock_levels","_needed_level"];

_class_slot = param[0,-1,[0]];
if(_class_slot isEqualTo -1) exitWith {};

if(isnil "Valor_classes_unlock") exitWith {};
if(isnil "Valor_level") exitWith {};

_entry = Valor_classes_unlock select _class_slot;
if(_entry select 0) exitWith {["Valor :: You have already unlocked this slot"] spawn valor_fnc_exp_hint;};



_class_unlock_levels = getArray(missionConfigFile >> "Valor_settings" >> "classes" >> "classes_unlock_level");
if(_class_unlock_levels isEqualTo []) exitWith {};

_needed_level = _class_unlock_levels select _class_slot;

iF(Valor_level < _needed_level) exitWith {[format["Valor :: Your level is not high enough to do this. Needed LVL: %1", _needed_level]] spawn valor_fnc_exp_hint;};


Valor_classes_unlock set[_class_slot,[true,-1]];

0 call valor_fnc_updateClassMenu;
Valor_class_changed = true;