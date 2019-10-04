
private ["_bloodsucker_prob","_rnd"];

if!(isnil "Valor_bloodsucker_active") exitWith {};

_bloodsucker_prob = getnumber(missionConfigFile >> "Valor_settings" >> "bloodsucker_settings" >> "bloodsucker_appearance_probability");
if(_bloodsucker_prob isEqualTo 0) exitWith {};

_rnd = random 100;
//systemChat str [_rnd,_bloodsucker_prob];
if(_rnd <= _bloodsucker_prob) then {
	[] spawn valor_Fnc_BloodsuckerMonitoring;
};