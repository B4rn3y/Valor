
private ["_object","_new_owner"];

_object = param[0,objNull,[objNull]];

_new_owner = param[1,objNull,[objNull,2]];

if(isnull _object) exitWith {};


if(typename _new_owner isEqualTo "SCALAR") then {
	_object setOwner _new_owner;
} else {
	_object setOwner (owner _new_owner);
};