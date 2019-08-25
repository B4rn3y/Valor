
createDialog "skills";

_display = findDisplay 3011;
disableSerialization;

_str_text = _display displayCtrl 1100;


_classes = getArray(missionConfigFile >> "Valor_settings" >> "classes" >> "classes_available");
if(_classes isEqualTo []) exitWith {closeDialog 0;};

_find_class =
{
	_id_class = param[0,-1,[0]];
	_ret = [];
	{
		if((_x select 0)isEqualTo _id_class) exitWith {_ret = _x;};
	} foreach _classes;
	_ret
};

_tv = (finddisplay 3011) ctrlCreate ["RscTreeSearch", -1];
_tv ctrlSetFont "PuristaMedium";
_tv ctrlSetFontHeight 0.035;
_tv ctrlSetPosition [0.00252566,0.0505048,0.615151,0.781818];
_tv ctrlSetBackgroundColor [0,0,0,0.25];
_tv ctrlCommit 0;
//_tv ctrlAddEventHandler ["TreeDblClick","_this spawn {}"];
_tv ctrlAddEventHandler ["TreeSelChanged","_this call valor_fnc_skill_menu_TreeSelChanged"];
tvClear _TV;

_empty = true;
_index = 0;
_index_2 = 0;
_index_0 = _tv tvadd[[],"Available Skills:"];
{
	_unlocked = _x select 0;
	_id = _x select 1;
	if(_unlocked && !(_id isEqualTo -1)) then {
		_empty = false;
		_class_data = [_id] call _find_class;
		_name = _class_data select 1;
		_level_needed = _class_data select 2;
		_skills = _class_data select 5;
		_index_1 = _tv tvadd[[_index_0],_name];
		{
			{
				if(typename _x isEqualTo "STRING") then {
					_index_2 = _tv tvadd[[_index_0,_index_1],_x];
				} else {
					_index_3 = _tv tvadd[[_index_0,_index_1,_index_2],format["[%1] %2",_x select 1,_x select 2]];
					if(Valor_level >= (_x select 1)) then {
						_tv tvSetColor[[_index_0,_index_1,_index_2,_index_3],[0.004,0.875,0.227,1]];
						_tv tvSetData[[_index_0,_index_1,_index_2,_index_3],format["[%1,%2]",_id,(_x select 0)]];
					} else {
						_tv tvSetColor[[_index_0,_index_1,_index_2,_index_3],[0.98,0.345,0.345,1]];
						_tv tvSetData[[_index_0,_index_1,_index_2,_index_3],format["[%1,%2]",_id,(_x select 0)]];
					};
				};
			} foreach _x;
		} foreach _skills;
	};
} foreach Valor_classes_unlock;

tvExpandAll _tv;