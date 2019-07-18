


private ["_valor_db_map","_normal_array","_arr","_str_to_array","_foreachindex"];

_valor_db_map = param[0,"",[""]];

if(_valor_db_map isEqualTo "" || _valor_db_map isEqualTo """") exitWith {[]};
_normal_array =0 call valor_fnc_get_hidement_array;
_arr = [];
_str_to_array = _valor_db_map splitString "";
if((_str_to_array select 0) isEqualTo """") then {
	_valor_db_map = call compile _valor_db_map;
	_str_to_array = _valor_db_map splitString "";
};


{
	if((_str_to_array select _foreachindex) isEqualTo "1") then {_arr pushback _x;} else {diag_log  (_str_to_array select _foreachindex);};
} foreach _normal_array;



_arr