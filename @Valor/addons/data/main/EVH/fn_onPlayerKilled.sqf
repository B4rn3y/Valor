
private ["_unit","_killer","_evh_id","_time_died","_players","_originalTarget","_time_until_dead","_display","_str_text"];

disableSerialization;
closeDialog 0;
_unit = param [0,ObjNull,[ObjNull]];
_killer = param [1,ObjNull,[ObjNull]];
_instigator = param[2,ObjNull,[ObjNull]];
Valor_alive = 0;
[5] call valor_fnc_step_update;

if  !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, (getPosATL _unit select 2)];
};


if!(Valor_group isEqualTo []) then {
	player setVariable["Valor_group_id",[(Valor_group select 0),(Valor_group select 2)],true];
} else {
	player setVariable["Valor_group_id",[-1,"ERROR"],true];
};

_evh_id = (findDisplay 46) displayAddEventHandler  ["KeyDown","if((_this select 1) == 1) then {true}"];


//Set some vars
_time_died = time;
_unit setvariable["time_dead",_time_died,true];
_unit setvariable["cash",Valor_cash,true];
_unit setvariable["realname",profileName,true];
_unit setVariable["PID",getplayeruid player,true];

//Setup our camera view
valor_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
valor_deathCamera cameraEffect ["Internal","Back"];
valor_deathCamera camSetTarget _unit;
valor_deathCamera camSetRelPos [0,3.5,4.5];
valor_deathCamera camSetFOV .5;
valor_deathCamera camSetFocus [50,0];
valor_deathCamera camCommit 0;

[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; valor_deathCamera camSetTarget _unit; valor_deathCamera camSetRelPos [0,3.5,4.5]; valor_deathCamera camCommit 0;};
};

_players = playableUnits - [player];
[_unit, [format["Revive %1",profileName], valor_fnc_revive,getplayeruid player,1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"]] remoteExec ["addAction",_players];
[_unit, [format["Search %1",profileName], valor_fnc_corpse_money_grabber,getplayeruid player,1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"]] remoteExec ["addAction",_players];

_time_until_dead = getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Time_until_dead");

_display = findDisplay 46;
_str_text = _display ctrlCreate ["RscStructuredText", 645];

_str_text ctrlSetPosition [0, 0.7, 1, 0.5];
_str_text ctrlCommit 0;

while {((time - _time_died)< _time_until_dead)&&!(player getvariable["revived",false])} do
{
	_str_text ctrlSetStructuredText parsetext format["<t color='#FF0000' align='center' size='1.5'>DEATH IN:</t><br/><t  color='#FFFFFF' align='center' size='1.1'>%1</t>",round (_time_until_dead - (time - _time_died))];
	sleep 1;
};
if(player getvariable["reviving",false]) then {
	_str_text ctrlSetStructuredText parsetext format["<t color='#0055FF' align='center' size='1.5'>You are being revived</t>"];
};

waitUntil {!(player getvariable["reviving",false])};
ctrlDelete _str_text;

(findDisplay 46) displayRemoveEventHandler ["KeyDown",_evh_id];
if(player getvariable["revived",false]) exitWith {[_unit] spawn valor_fnc_revived};

_person_add_stat = if(isnull _instigator) then {if(isnull _killer) then {ObjNull} else {if(_killer isEqualTo player) then {ObjNull} else {_killer}};} else {if(_instigator isEqualTo player) then {ObjNull} else {_instigator};};
if!(isnull _person_add_stat) then {
	["Player",Valor_humanity] remoteExec["valor_fnc_onEntityKilled",[_person_add_stat]];
};
Valor_stats_entities set[3,((Valor_stats_entities select 3)+1)];
[13] call valor_fnc_step_update;


[] spawn valor_fnc_respawn;