private ["_classname_house","_table","_current_table"];
_classname_house = param[0,"",[""]];
//if(_classname_house isEqualTo "") exitWith {systemchat "ERROR: Classname House unbekannt"};


_table = "";
{
	_current_table = _x select 0;
	{
		if(_x isEqualTo _classname_house) exitWith {_table= _current_table};
	} foreach (_x select 1);
	if!(_table isequalto "") exitWith {};

} foreach lootspawn_house_config;
if(_table isequalto "") then {_table = "general"};

_table