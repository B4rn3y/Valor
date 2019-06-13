private ["_control_and_index","_place","_control","_index","_idc","_item_name","_classname","_config","_displayName"];
_control_and_index = param[0,[],[[]]];
if(_control_and_index isEqualTo []) exitWith {};
_place = param[1,"",[""]];
if(_place isEqualTo "") exitWith {};

_control = _control_and_index select 0;
_index = _control_and_index select 1;
_idc = ctrlIDC _control;
_item_name = lbText [_idc, _index];
_classname = "";

switch (_place) do
{
	case "u":
	{
		{
			_config = [_x] call valor_fnc_getConfig;
			_displayName = getText(configFile >> _config >> _x >> "displayName");
			if(_displayName isEqualTo _item_name) exitWith {_classname = _x;};
		} foreach (uniformItems player);
	};

	case "v":
	{
		{
			_config = [_x] call valor_fnc_getConfig;
			_displayName = getText(configFile >> _config >> _x >> "displayName");
			if(_displayName isEqualTo _item_name) exitWith {_classname = _x;};
		} foreach (vestItems player);
	};

	case "b":
	{
		{
			_config = [_x] call valor_fnc_getConfig;
			_displayName = getText(configFile >> _config >> _x >> "displayName");
			if(_displayName isEqualTo _item_name) exitWith {_classname = _x;};
		} foreach (backpackItems player);
	};
};



// add classname here together with functions
switch (_classname) do
{


	default
	{
		/* STATEMENT */
	};
};
















false