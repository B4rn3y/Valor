


_victim = _this select 0;
_where_did_victim_get_hit = _this select 1;
_damage_fo_that_selection = _this select 2;
_damager_causer = _this select 3;
_prijectile = _this select 4;
_hitpartindex = _this select 5;
_trigger_puller = _this select 6;
_hitpoint = _this select 7;
diag_log str _this;


[] remoteexec["valor_fnc_punish_killer",[_trigger_puller]];




