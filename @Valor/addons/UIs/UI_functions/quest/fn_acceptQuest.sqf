

if(isnil "Valor_completed_quests") exitWith {systemchat "Valor ERROR :: Quest Config doesnt exist"};

_Quest_path = param[0,-1,[-1]];
_quest_id = param[1,-1,[0]];



if(_Quest_path isEqualTo -1) exitWith {systemchat "Valor ERROR :: Quest Path nil"};
if(_quest_id isEqualTo -1) exitWith {systemchat "Valor ERROR :: Quest ID nil"};

Valor_completed_quests pushback [_Quest_path,_quest_id,false];
[10] call valor_fnc_step_update;









