
private ["_classes","_find_class","_id_class","_ret","_foreachindex","_skills","_class_data","_save","_var_name","_skill","_needed_level","_veteran"];
waitUntil {sleep 1;!isnil "Valor_classes_unlock"};
waitUntil {sleep 1;!isnil "Valor_level"};

_classes = getArray(missionConfigFile >> "Valor_settings" >> "classes" >> "classes_available");


_find_class =
{
	_id_class = param[0,-1,[0]];
	_ret = [];
	{
		if((_x select 0)isEqualTo _id_class) exitWith {_ret = _x;};
	} foreach _classes;
	_ret
};


// delete old variables
{
	{
		{
			if(_foreachindex isEqualTo 0) exitWith {
				missionNamespace setvariable[format["Valor_skill_%1",_x select 1],nil];
			};
		} foreach _x;
	} foreach (_x select 5);
} foreach _classes;


// setup new vars
_skills = [];
{
	if!((_x select 1) isEqualTo -1) then {
		_class_data = [_x select 1] call _find_class;
		{
			_skills pushBack _x;
		} foreach (_class_data select 5);
	};
} foreach Valor_classes_unlock;


_save = 1;
_var_name = "";
{
	_skill = _x;
	{
		if!(_foreachindex isEqualTo 0) then {
			_needed_level = _x select 1;
			if(Valor_level >= _needed_level) then {
				_save = _x select 4;
			};
			if(_foreachindex isEqualTo (count _skill - 1) && !isnil "_save") then {
				if(_save isEqualTo "true" || _save isEqualTo "false") then {
					_save = call compile _save;
				};
				missionNamespace setvariable[format["%1",_var_name],_save];
			};
		} else {
			_var_name = format["Valor_skill_%1",_x select 1];

		};
		_save = nil;
	} foreach _skill;
} foreach _skills;




// init the skills that are initable



{
	switch (_x) do
	{
		case "SOH":
		{
			player setAnimSpeedCoef (missionNamespace getvariable["Valor_skill_SOH",1]);
		};
		case "WF":
		{
			player setUnitRecoilCoefficient ((100 - (missionNamespace getvariable["Valor_skill_WF",0]))/100);
		};
		case "Veteran":
		{
			_veteran = missionNamespace getvariable["Valor_skill_Veteran",1];
			if!(_veteran isEqualTo 1) then {
				player setvariable["Valor_skill_Veteran",(missionNamespace getvariable["Valor_skill_Veteran",1]),true];
			} else {
				player setvariable["Valor_skill_Veteran",nil,true];
			};
		};
	};

} foreach ["SOH","WF","Veteran"];


