
private ["_box","_var","_entry_list","_display","_listbox","_combo_players","_combo_group","_entry_players","_entry_groups","_id_entry","_active_groups"];

_box = param[0,objNull,[objNull]];
_update = param[1,false,[false]];

if(isnull _box) exitWith {};
_var = _box getVariable["valor_base_ids",[]];
if(_var isEqualTo []) exitWith {};
if!((count _var )>= 5) exitWith {};

_entry_list = _var select 3;

if!(_update) then {
	createDialog "base_entry";
	Valor_base_box = _box;
};

_display = findDisplay 3016;
if(isnull _display) exitWith {};

_listbox = _display displayCtrl 1500;
_combo_players = _display displayCtrl 2100;
_combo_group = _display displayCtrl 2101;

_entry_players = [[getplayeruid player,profileName]];
_entry_groups = [];

lbclear _listbox;
lbClear _combo_players;
lbClear _combo_group;

{
	_id_entry = _x select 0;
	_name = _x select 1;
	if((typeName _id_entry) isEqualTo "STRING") then {
		_entry_players pushBackUnique [_id_entry,_name];
	} else {
		_entry_groups pushBackUnique [_id_entry,_name];
	};
} foreach _entry_list;


{
	if!([getplayeruid _x,name _x] in _entry_players) then {
		_id = _combo_players lbadd name _x;
		_combo_players lbSetData[_id,str[getPlayerUID _x,name _x]];
	};
} foreach (playableUnits - [player]);


_active_groups = 0 call valor_fnc_getActiveGroups;
{
	_id_group = _x select 0;
	_name = _x select 1;
	if!(_x in _entry_groups) then {
		_id = _combo_group lbadd _name;
		_combo_group lbSetData[_id,str[_id_group, _name]];
	};
} foreach _active_groups;

_listbox lbadd "Players:";
{
	_id = _listbox lbadd (_x select 1);
	_listbox lbSetData[_id,(_x select 0)];
} foreach _entry_players;


_listbox lbadd "Groups:";
{
	_id = _listbox lbadd (_x select 1);
	_listbox lbSetValue[_id,(_x select 0)];
} foreach _entry_groups;

if!(_update) then {
	waitUntil {isnull (finddisplay 3016)};
	Valor_base_box = nil;
};