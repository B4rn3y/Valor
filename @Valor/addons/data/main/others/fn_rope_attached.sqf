

private ["_rope","_no_liftables"];
_rope = _this select 1;
_target = _this select 2;

_no_liftables = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "not_liftable");

if((typeof _target) in _no_liftables) then {
	ropeDestroy _rope;
	systemchat "Valor :: You cant lift that."
};
