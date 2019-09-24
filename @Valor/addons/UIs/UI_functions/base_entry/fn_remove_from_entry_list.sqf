private ["_display","_var","_entry_list","_listbox","_combo_players","_combo_group","_cur_sel","_data","_value","_number","_del_pos","_foreachindex"];



_display = findDisplay 3016;
if(isnull _display) exitWith {};
if(isnil "Valor_base_box") exitWith {};
if(isnull Valor_base_box) exitWith {};

_var = Valor_base_box getVariable["valor_base_ids",[]];
if(_var isEqualTo []) exitWith {};
if!((count _var )>= 5) exitWith {};

_entry_list = _var select 3;

_listbox = _display displayCtrl 1500;
_combo_players = _display displayCtrl 2100;
_combo_group = _display displayCtrl 2101;


_cur_sel = lbCurSel _listbox;
if(_cur_sel isEqualTo -1) exitWith {};

_data = _listbox lbData _cur_sel;
_value = _listbox lbValue _cur_sel;


_number = -1;
if(_data isEqualTo "") then {
	if!(_value isEqualTo -1) then {
		_number = _value;
	};
} else {
	_number = _data;
};

if(_number isEqualTo -1) exitWith {};
if(_number isEqualTo (getplayeruid player)) exitWith {["You cant remove yourself"] spawn valor_fnc_exp_hint;};

_del_pos = -1;
{
	_id = _x select 0;
	if(_id isEqualTo _number) exitWith {_del_pos = _foreachindex};
} foreach _entry_list;


iF(_del_pos isEqualTo -1) exitWith {};

_entry_list deleteAt _del_pos;



Valor_base_box setvariable["valor_base_ids",[_var select 0, _var select 1, _var select 2,_entry_list,_var select 4],true];

[[_var select 0,_entry_list],"valor_fnc_update_entry_list",2] call valor_fnc_remoteexec;

[Valor_base_box,true] spawn valor_fnc_open_base_entry;