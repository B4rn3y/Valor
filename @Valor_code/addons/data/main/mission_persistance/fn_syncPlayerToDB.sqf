private ["_packet"];

_packet = [playerside,getplayeruid player];

_packet pushback [([valor_gear] call valor_fnc_mresarray),valor_cash,valor_bankacc,([[Valor_thirst,Valor_hunger,damage player,Valor_blood]] call valor_fnc_mresarray),valor_alive,([[getposatl player,getdir player]] call valor_fnc_mresarray),Valor_playtime,([Valor_map] call valor_fnc_map_hidement_smaller_array), Valor_xp, Valor_level, Valor_humanity, Valor_stats_entities];


[_packet,"valor_fnc_syncPlayerToDB_server",2] call valor_fnc_remoteexec;
//_packet remoteexec["valor_fnc_syncPlayerToDB_server",2];