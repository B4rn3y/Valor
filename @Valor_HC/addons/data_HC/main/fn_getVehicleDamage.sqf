

private ["_vehicle","_ret"];
_vehicle = param [0,Objnull,[Objnull]];
if(isNull _vehicle) exitWith {};


_ret = [((getAllHitPointsDamage _vehicle) select 2)] call valor_fnc_mresarray;

_ret