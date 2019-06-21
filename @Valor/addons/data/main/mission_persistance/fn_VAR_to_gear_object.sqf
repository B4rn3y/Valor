private ["_array","_primWeapon","_secWeapon","_handgun","_foreachindex","_X"];
_array = param[0,[],[[]]];
_unit = param[1,objNull,[objNull]];
if(isnull _unit) exitWith {};
[_unit] call valor_fnc_clearPlayerInventory_object;
if(_array isEqualTo []) exitWith {};
_primWeapon = "";
_secWeapon = "";
_handgun = "";


{
	switch (_foreachindex) do
	{
		case 0:
		{
			if!(_x isEqualTo "") then {
				_unit forceaddUniform _x;
			};
		};

		case 1:
		{
			if!(_x isEqualTo "") then {
				_unit addBackpack _x;
			};
		};

		case 2:
		{
			if!(_x isEqualTo "") then {
				_unit addWeapon _x;
				_primWeapon = _X;
			};
		};

		case 3:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addPrimaryWeaponItem _x;
				};
			} foreach _x;
		};

		case 4:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addPrimaryWeaponItem _x;
				};
			} foreach _x;
		};

		case 5:
		{
			if!(_x isEqualTo "") then {
				_unit addWeapon _x;
				_secWeapon = _X;
			};
		};

		case 6:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addsecondaryWeaponItem _x;
				};
			} foreach _x;
		};

		case 7:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addsecondaryWeaponItem _x;

				};
			} foreach _x;
		};

		case 8:
		{
			if!(_x isEqualTo "") then {
				_unit addWeapon _x;
				_handgun = _X;
			};
		};

		case 9:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addhandgunItem _x;
				};
			} foreach _x;
		};

		case 10:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addhandgunItem _x;

				};
			} foreach _x;
		};

		case 11:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addItemToUniform _x;
				};
			} foreach _x;
		};

		case 12:
		{
			if!(_x isEqualTo "") then {
				_unit addvest _x;
			};
		};

		case 13:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addItemTovest _x;
				};
			} foreach _x;
		};

		case 14:
		{
			if!(_x isEqualTo "") then {
				_unit addHeadgear _x;
			};
		};

		case 15:
		{
			if!(_x isEqualTo "") then {
				_unit addgoggles _x;
			};
		};

		case 16:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addItem _x;
					_unit assignItem _x;
				};
			} foreach _x;
		};

		case 17:
		{
			{
				if!(_x isEqualTo "") then {
					_unit addItemToBackpack _x;
				};
			} foreach _x;
		};


	};
} foreach _array;






0 spawn {
	Valor_gear_loaded = true;
	sleep 3;
	Valor_gear_loaded = nil;
};








