



private ["_zombie","_dir","_attackSound","_scream","_vel","_strength"];
_zombie = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];
if(isnull _zombie) exitWith {false};
if(isnull _target) exitWith {false};
_zombie setvariable["ATTACKING",true];

_dir = _zombie getDir _target;
_zombie setdir _dir;
[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

_attackSound = selectRandom RZ_NormalZombieAttackArray;
playsound3d [_attackSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];


sleep 0.3;

_scream = selectRandom RZ_HumanScreamArray;
[_target, _scream] remoteExecCall ["say3d"];

_vel = velocity _target;
_dir = direction _zombie;
_strength = _zombie call RZ_fnc_zombie_getHumanVelocityStrength;
[_target, [(_vel select 0) + (sin _dir * _strength), (_vel select 1) + (cos _dir * _strength), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
_target setdamage ((damage _target) + (0.1 * (_target getvariable["Valor_skill_Veteran",1])));

sleep 1.2;
_zombie setvariable["ATTACKING",nil];

