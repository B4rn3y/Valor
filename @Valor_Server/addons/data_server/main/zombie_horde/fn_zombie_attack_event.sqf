



private ["_zombie","_zombie_damage","_dir","_attackSound","_scream","_health"];
_zombie = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];
_zombie_damage = param[2,-1,[-1]];
if(isnull _zombie) exitWith {false};
if(isnull _target) exitWith {false};
if(_zombie_damage isEqualTo -1) exitWith {};
_zombie setvariable["ATTACKING",true];

_dir = _zombie getDir _target;
_zombie setdir _dir;
[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

_attackSound = selectRandom RZ_NormalZombieAttackArray;
playsound3d [_attackSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];


sleep 0.3;

_scream = selectRandom RZ_HumanScreamArray;
[_target, _scream] remoteExecCall ["say3d"];

_health = _target getvariable["valor_health",0];
_health = _health - _zombie_damage;
if(_health <= 0) then {
	_target setvariable["valor_health",0,true];
	deleteVehicle _target;
} else {
	_target setvariable["valor_health",_health,true];
};


sleep 1.2;
_zombie setvariable["ATTACKING",nil];

