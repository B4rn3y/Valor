
private ["_house","_ret","_numberOfDoors","_locked"];
_house = param[0,objNull,[objNull]];
_ret = false;
_numberOfDoors = 0;
if(isnull _house) exitWith {_ret};


_numberOfDoors = switch (typeof _house) do
{
	case "Land_Garaz_long_open":
	{
		6
	};

	case "Land_Gate_IndVar2_5":
	{
		2
	};

	default
	{
		getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	};
};


if(_numberOfDoors isEqualTo -1 OR _numberOfDoors isEqualTo 0) exitWith {_ret}; //MEH

_locked = _house getvariable ["bis_disabled_Door_1",0];

if(_locked isEqualTo 0) then {
	for "_i" from 1 to _numberOfDoors do {
		_house animate[format["door_%1_rot",_i],0];
		if(typeof _house in ["Land_ConcreteWall_01_l_gate_F"]) then {
			_house animate[format["door_%1_move",_i],0];
		} else {
			_house animate[format["door_%1_rot",_i],0];
		};
		_house setVariable [format["bis_disabled_Door_%1",_i],1,true];
	};
	_ret = true;
} else {
	for "_i" from 1 to _numberOfDoors do {
		if(typeof _house in ["Land_ConcreteWall_01_l_gate_F"]) then {
			_house animate[format["door_%1_move",_i],1];
		} else {
			_house animate[format["door_%1_rot",_i],1];
		};
		_house setVariable [format["bis_disabled_Door_%1",_i],nil,true];
	};
	_ret = true;
};

_ret

