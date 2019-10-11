
_object = param[0,objNull,[objNull]];

if(isnull _object) then {
	_object = nearestobject[player,"Land_Net_Fence_Gate_F"];
	if(isnull _object) then {
		_object = nearestobject[player,"Land_ConcreteWall_01_l_gate_F"];
		if(isnull _object) then {
			_object = nearestobject[player,"Land_NetFence_02_m_gate_v1_F"];
		};
	};
};


if(isnull _object) exitWith {};




_custom_distance = switch (typeof _object) do
{
	case "Land_Offices_01_V1_F":
	{
		20
	};

	default
	{
		9
	};
};






if((player distance _object)>_custom_distance) exitWith {};


_var = _object getvariable["cop",false];
if(_var) exitWith {
	if!(playerside isEqualTo opfor) exitWith {};

	switch (typeof _object) do
	{
		case "Land_Net_Fence_Gate_F":
		{
			[_object] call valor_fnc_lockdoor;
		};

		case "Land_ConcreteWall_01_l_gate_F":
		{
			[_object] call valor_fnc_lockdoor;
		};

		case "Land_NetFence_02_m_gate_v1_F":
		{
			[_object] call valor_fnc_lockdoor;
		};

		default
		{
			if((typeOf _object) isEqualTo "valor_drawBridge") exitWith {
				_st = _object animationPhase "draw";
				if(_st isEqualTo 0) then {
					_object animate["draw",1];
				} else {
					_object animate["draw",0];
				};
			};

			_numberOfDoors = switch (typeof _object) do
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
					getNumber(configFile >> "CfgVehicles" >> (typeOf _object) >> "numberOfDoors");
				};
			};

			//Find the nearest door
			_smallestdistance=10;
			_door = -1;
			for "_i" from 1 to _numberOfDoors do {
				_selPos = _object selectionPosition format["Door_%1_trigger",_i];
				if((typeOf _object) isEqualTo "Land_House_2W02_F" && (_i isEqualTo 1 || _i isEqualTo 2)) then {
					_selPos = [-1.72461,1.07813,-4.03519];
				};
				_worldSpace = _object modelToWorld _selPos;
				_distance=player distance _worldSpace;
					if(_distance < 4.5) then {
						if(_distance < _smallestdistance)then{
							_smallestdistance=_distance;
							_door = _i;
						};
					};
			};

			if(_door isEqualTo -1) exitWith {};

			_lock = _object getVariable[format["bis_disabled_Door_%1",_door],0];
			_locked = if(_lock isEqualTo 0) then {false} else {true};

			if(_locked) then {
				_object setVariable[format["bis_disabled_Door_%1",_door],0,true];
				if((typeOf _object) isEqualTo "Land_House_2W02_F" && (_door isEqualTo 1 || _door isEqualTo 2)) then {
					_object animate["door_1a_rot",1];
					_object animate["door_1b_rot",1];
				} else {
					if((typeof _object) isEqualTo "valor_Land_ds_HouseV_3I1") then {
						_object animate[format["door_%1",_door],1];
					} else {
						_object animate[format["Door_%1_rot",_door],1];
					};
				};

			} else {
				if((typeOf _object) isEqualTo "Land_House_2W02_F" && (_door isEqualTo 1 || _door isEqualTo 2)) then {
					_object animate["door_1a_rot",0];
					_object animate["door_1b_rot",0];
				} else {
					if((typeof _object) isEqualTo "valor_Land_ds_HouseV_3I1") then {
						_object animate[format["door_%1",_door],0];
					} else {
						_object animate[format["Door_%1_rot",_door],0];
					};
				};
				_object setVariable[format["bis_disabled_Door_%1",_door],1,true];

			};
		};
	};
};










_var = _object getvariable["valor_wall_ids",[-1,-1]];
if!(_var isEqualTo [-1,-1]) exitWith {
	_id = _var select 0;
	_group_id = _var select 1;
	if(isnil "valor_group") exitWith {};
	if(valor_group isEqualTo []) exitWith {};
	if!((valor_group select 0) isEqualTo _group_id) exitWith {};

	_numberOfDoors = switch (typeof _object) do
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
			getNumber(configFile >> "CfgVehicles" >> (typeOf _object) >> "numberOfDoors");
		};
	};


	_lock = _object getVariable[format["bis_disabled_Door_%1",1],0];
	_locked = if(_lock isEqualTo 0) then {false} else {true};


	if(_locked) then {
		for "_d" from 1 to _numberOfDoors do {
			_object setVariable[format["bis_disabled_Door_%1",_d],0,true];
			_object animate[format["door_%1_rot",_d],1];
		};
	} else {
		for "_d" from 1 to _numberOfDoors do {
			_object animate[format["door_%1_rot",_d],0];
			_object setVariable[format["bis_disabled_Door_%1",_d],1,true];
		};

	};

};

















_var = _object getvariable ["valor_base_ids",[]];

if(_var isEqualTo []) exitWith {};

_base_id = _var select 0;

_access = [_base_id] call valor_fnc_has_base_access;
iF!(_access) exitWith {};

if((typeOf _object) isEqualTo "valor_drawBridge") exitWith {
	_st = _object animationPhase "draw";
	if(_st isEqualTo 0) then {
		_object animate["draw",1];
	} else {
		_object animate["draw",0];
	};
};

_numberOfDoors = switch (typeof _object) do
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
		getNumber(configFile >> "CfgVehicles" >> (typeOf _object) >> "numberOfDoors");
	};
};

//Find the nearest door
_smallestdistance=10;
_door = -1;
for "_i" from 1 to _numberOfDoors do {
	_selPos = _object selectionPosition format["Door_%1_trigger",_i];
	if((typeOf _object) isEqualTo "Land_House_2W02_F" && (_i isEqualTo 1 || _i isEqualTo 2)) then {
		_selPos = [-1.72461,1.07813,-4.03519];
	};
	_worldSpace = _object modelToWorld _selPos;
	_distance=player distance _worldSpace;
		if(_distance < 4.5) then {
			if(_distance < _smallestdistance)then{
				_smallestdistance=_distance;
				_door = _i;
			};
		};
};


if(_door isEqualTo -1) exitWith {};

_lock = _object getVariable[format["bis_disabled_Door_%1",_door],0];
_locked = if(_lock isEqualTo 0) then {false} else {true};



if(_locked) then {
	_object setVariable[format["bis_disabled_Door_%1",_door],0,true];
	if((typeOf _object) isEqualTo "Land_House_2W02_F" && (_door isEqualTo 1 || _door isEqualTo 2)) then {
		_object animate["door_1a_rot",1];
		_object animate["door_1b_rot",1];
	} else {
		if((typeof _object) isEqualTo "valor_Land_ds_HouseV_3I1") then {
			_object animate[format["door_%1",_door],1];
		} else {
			_object animate[format["Door_%1_rot",_door],1];
		};
	};

} else {
	if((typeOf _object) isEqualTo "Land_House_2W02_F" && (_door isEqualTo 1 || _door isEqualTo 2)) then {
		_object animate["door_1a_rot",0];
		_object animate["door_1b_rot",0];
	} else {
		if((typeof _object) isEqualTo "valor_Land_ds_HouseV_3I1") then {
			_object animate[format["door_%1",_door],0];
		} else {
			_object animate[format["Door_%1_rot",_door],0];
		};
	};
	_object setVariable[format["bis_disabled_Door_%1",_door],1,true];

};
