private ["_packet"];

_packet = [playerside,getplayeruid player];
switch (playerside) do
{
	case civilian:
	{
		_packet pushback [([valor_gear] call valor_fnc_mresarray),valor_cash,valor_bankacc,([[Valor_thirst,Valor_hunger,damage player,Valor_blood,[]]] call valor_fnc_mresarray),valor_alive,([[getposatl player,getdir player]] call valor_fnc_mresarray),Valor_playtime,([Valor_map] call valor_fnc_map_hidement_smaller_array),(if(Valor_arrested) then {1} else {0})];
	};

	default
	{
		_packet pushback [([valor_gear] call valor_fnc_mresarray),valor_cash,valor_bankacc,([[Valor_thirst,Valor_hunger,damage player,Valor_blood,[]]] call valor_fnc_mresarray),valor_alive,([[getposatl player,getdir player]] call valor_fnc_mresarray),Valor_playtime,([Valor_map] call valor_fnc_map_hidement_smaller_array)];
	};
};


_packet remoteexec["valor_fnc_syncPlayerToDB",2];