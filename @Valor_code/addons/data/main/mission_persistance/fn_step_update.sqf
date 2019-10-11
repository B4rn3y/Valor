
private ["_mode","_error","_set"];
_mode = param[0,-1,[1337]];
_error = false;
if(_mode isEqualTo -1) exitWith {};

_set = [_mode,getplayeruid player,playerside];


switch (_mode) do
{
	case 0:
	{
		_set pushback ([valor_gear] call valor_fnc_mresarray);
	};
	case 1:
	{
		_set pushback Valor_cash;
	};
	case 2:
	{
		_set pushback Valor_bankacc;
	};
	case 3:
	{
		_set pushback [Valor_cash,Valor_bankacc];
	};
	case 4:
	{
		_set pushback ([[Valor_thirst,Valor_hunger,damage player,Valor_blood]] call valor_fnc_mresarray);
	};
	case 5:
	{
		//_set pushback (if(alive player) then {1} else {0});
		_set pushBack Valor_alive;
	};
	case 6:
	{
		_set pushback ([[getposatl player,getdir player]] call valor_fnc_mresarray);
	};
	case 7:
	{
		//_set pushback (if(Valor_arrested) then {1} else {0});
		_set pushBack Valor_arrested
	};
	case 8:
	{
		_set pushback Valor_playtime;
	};
	case 9:
	{
		_set pushback ([Valor_map] call valor_fnc_map_hidement_smaller_array);
	};
	case 10:
	{
		_set pushback Valor_completed_quests;
	};
	case 11:
	{
		_set pushback [Valor_xp,Valor_level];
	};
	case 12:
	{
		_set pushback Valor_classes_unlock;
	};
	case 13:
	{
		_set pushback [valor_humanity,Valor_stats_entities];
	};
	default
	{
		_error = true;
	};


};

if(_error) exitWith {};


[_set,"valor_fnc_step_update_db",2] call valor_fnc_remoteexec;
//_set remoteexec["valor_fnc_step_update_db",2];