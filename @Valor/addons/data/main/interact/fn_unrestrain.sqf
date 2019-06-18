

private ["_restrained_person","_time","_cP","_cpUp","_unit"];

_restrained_person = param [0,Objnull,[Objnull]];

if(isNull _restrained_person) exitWith {};



switch (playerside) do
{
	case civilian:
	{
		if!(isnil "valor_is_processing") exitWith {};
		if!(isnil "Valor_interrupt") exitWith {};
		valor_is_processing = true;
		[_restrained_person,format["Unrestraining %1",name _restrained_person]] spawn valor_fnc_processevh;
		_time = 0.2;
		_cP = 0.01;
		_cpUp = 0.01;
		_id = player addaction["Cancel",{Valor_interrupt = true; sleep 5;Valor_interrupt=nil;}];
		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
					sleep 0.35;
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};

			sleep _time;
			_cP = _cP + _cpUp;
			_unit setvariable["percent",_cP * 100];

			if(_cP >= 1) exitWith {};
			if!(_restrained_person getvariable["valor_restrained",false]) exitWith {};
			if(player distance _restrained_person > 5) exitWith {};
			if((vehicle player) != player) exitWith {};
			if!(alive player) exitWith {};
			if(!isnil "Valor_interrupt") exitWith {};
		};
		player removeAction _id;
		player switchmove "";
		if!(_restrained_person getvariable["valor_restrained",false]) exitWith {valor_is_processing=nil;};
		if(!isnil "Valor_interrupt") exitWith {valor_is_processing=nil;};
		if!(alive player) exitWith {valor_is_processing=nil;};
		if(player distance _unit > 5) exitWith { systemchat "Valor :: You moved too far away!";valor_is_processing=nil;};
		if((vehicle player) != player) exitWith {systemchat "Valor :: You cant do that in a vehicle!"; valor_is_processing = nil;};
		if(isnull _restrained_person) exitWith {systemchat "Valor :: This person is already offline";valor_is_processing = nil;};
		valor_is_processing = nil;
		_restrained_person setvariable["valor_restrained",nil,true];
	};

	case opfor:
	{
		_restrained_person setvariable["valor_restrained",nil,true];
	};
};