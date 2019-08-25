


private ["_control","_index","_display","_str_text_Skill_description","_classes","_data","_class","_skill","_X"];


if(isnull(finddisplay 3011)) exitwith {};
_control = _this select 0;
_index = _this select 1;
if(count _index != 4) exitWith {};
disableSerialization;
_display = findDisplay 3011;


_str_text_Skill_description = _display displayCtrl 1100;


_classes = getArray(missionConfigFile >> "Valor_settings" >> "classes" >> "classes_available");
if(_classes isEqualTo []) exitWith {closeDialog 0;};

_data = _control tvdata _index;

_data = call compile _data;

_class = [];
{
	if((_x select 0) isEqualTo (_data select 0)) exitWith {_class = _x;};
} foreach _classes;

_skill = [];
{
	{
		if!(typename _X isEqualTo "STRING") then {
			if((_x select 0) isEqualTo (_data select 1)) exitWith {_skill = _x;};
		};
	} foreach _x;
} foreach (_class select 5);



_str_text_Skill_description ctrlSetStructuredText parseText format["<br/><t color='#FF8000' align='center'>Class:</t> <br/><t size='1.4' align='center'>%1</t><br/><br/><t color='#FF8000' align='center'>Needed level:</t> <br/><t align='center'>%2</t><br/><br/><t color='#FF8000' align='center'>Description:</t> <br/><t align='center'>%3</t>",_class select 1,_skill select 1,_skill select 3];

































