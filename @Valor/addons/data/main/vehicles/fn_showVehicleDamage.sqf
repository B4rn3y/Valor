


private ["_vehicle","_ADD_ID","_classname","_hitpoints","_names","_damage","_arr_with_names_and_damage","_foreachindex","_arr_for_IDS","_ID"];
_vehicle = param[0,objNull,[objNull]];
_ADD_ID = param[2,-1,[-1]];
if(isnull _vehicle) exitWith {};
_classname = typeOf _vehicle;
_hitpoints = getAllHitPointsDamage _vehicle;
_names = _hitpoints select 0;
_damage = _hitpoints select 2;

_vehicle removeAction _ADD_ID;
_vehicle addaction[( "<t color='#0000ff'>Hide Vehicle Status</t>"),Valor_fnc_hideVehicleStatus];


_arr_with_names_and_damage = [];

{
	_arr_with_names_and_damage pushback [_x,(_damage select _foreachindex)];

} foreach _names;

_arr_for_IDS = [];

{
	switch (true) do
	{
		case ([(_x select 0),"wheel"] call KRON_fnc_StrInStr):
		{
			if!(_x select 1 <= 0.15) then {
				_ID = _vehicle addaction[format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"],valor_fnc_repairVehicle,["Wheel",_x select 0]];
				_arr_for_IDS pushback _ID;
			} else {
				_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),{systemchat "WIP"},["Wheel",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};

		case ((_x select 0)isEqualTo "hitfuel"):
		{
			if(_x select 1 > 0) then {
				_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_repairVehicle,["Fuel",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};

		case ((_x select 0)isEqualTo "hitengine"):
		{
			if!(_x select 1 <= 0.15) then {
				_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_repairVehicle,["Engine",_x select 0]];
				_arr_for_IDS pushback _ID;
			} else {
				_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),{systemchat "WIP"},["Engine",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};

		case ((_x select 0)isEqualTo "hithull"):
		{
			if(_x select 1 > 0) then {
				_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_repairVehicle,["Hull",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};


		case ([(_x select 0),"glass"] call KRON_fnc_StrInStr):
		{
			if(_x select 1 > 0) then {
				_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_repairVehicle,["Glass",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};

		case ([(_x select 0),"hrotor"] call KRON_fnc_StrInStr): // Main Rotor
		{
			if!(_x select 1 <= 0.15) then {
				_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_repairVehicle,["HRotor",_x select 0]];
				_arr_for_IDS pushback _ID;
			} else {
				_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),{systemchat "WIP"},["HRotor",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};

		case ([(_x select 0),"vrotor"] call KRON_fnc_StrInStr): // Rotor at the back // ATQR
		{
			if(_x select 1 > 0) then {
				_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_repairVehicle,["VRotor",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};

		case ([(_x select 0),"avionics"] call KRON_fnc_StrInStr): // Avionics // INST
		{
			if(_x select 1 > 0) then {
				_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_repairVehicle,["Avionics",_x select 0]];
				_arr_for_IDS pushback _ID;
			};
		};

	};

} foreach _arr_with_names_and_damage;


_vehicle setvariable["ADDACTION_IDS",_arr_for_IDS];









