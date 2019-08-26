private ["_unit","_pid","_time","_person_reviving","_time_until_dead","_cP","_cpUp"];

_unit = param[0,objNull,[objNull]];
if(isnull _unit) exitWith {};
_pid = param[3,"",[""]];
if(_pid isEqualTo "") exitWith {};
if!(isnil "valor_is_processing") exitWith {};
_time = _unit getvariable["time_dead",-1];
iF(_time isEqualTo -1) exitWith {};

_person_reviving = objNull;
{
	if(getplayeruid _x isEqualTo _pid) exitWith {_person_reviving=_x};
} foreach playableUnits;

if(isnull _person_reviving) exitWith {systemchat "Valor :: This person is already offline"};

_time_until_dead = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Time_until_dead");

if((time - _time) >= _time_until_dead) exitWith {systemchat "Valor :: You are too late, he cant be revived anymore"};

_person_reviving setvariable["reviving",true,true];

valor_is_processing = true;
[_unit,format["Reviving %1",name _person_reviving]] spawn valor_fnc_processevh;
_time = 0.6;
_cP = 0.01;
_cpUp = 0.01 * (missionNamespace getvariable["Valor_skill_HV",1]);
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
	if(player distance _unit > 10) exitWith {};
	if((vehicle player) != player) exitWith {};
	if!(alive player) exitWith {};
	if(!isnil "Valor_interrupt") exitWith {};
};
player removeAction _id;
player switchmove "";
if(!isnil "Valor_interrupt") exitWith {valor_is_processing=nil;_person_reviving setvariable["reviving",nil,true];};
if!(alive player) exitWith {valor_is_processing=nil;_person_reviving setvariable["reviving",nil,true];};
if(player distance _unit > 10) exitWith { systemchat "Valor :: You moved too far away!";valor_is_processing=nil;_person_reviving setvariable["reviving",nil,true];};
if((vehicle player) != player) exitWith {systemchat "Valor :: You cant do that in a vehicle!"; valor_is_processing = nil;_person_reviving setvariable["reviving",nil,true];};
if(isnull _person_reviving) exitWith {systemchat "Valor :: This person is already offline";valor_is_processing = nil;_person_reviving setvariable["reviving",nil,true];};
valor_is_processing = nil;
_person_reviving setvariable["revived",true,true];
sleep 1;
_person_reviving setvariable["reviving",nil,true];