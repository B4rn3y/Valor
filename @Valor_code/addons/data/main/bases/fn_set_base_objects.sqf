
private ["_objects"];
_objects = param[0,[],[[]]];
if(_objects isEqualTo []) exitWith {};


{
	(_x select 0) setposatl (_x select 1);
} foreach _objects;