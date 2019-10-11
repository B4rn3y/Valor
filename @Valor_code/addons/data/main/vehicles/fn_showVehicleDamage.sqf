private ["_vehicle","_ADD_ID","_classname","_hitpoints","_names","_damage","_arr_with_names_and_damage","_foreachindex","_arr_for_IDS","_ID","_damage_perc"];


_vehicle = param[0,objNull,[objNull]];
_ADD_ID = param[2,-1,[-1]];
if(isnull _vehicle) exitWith {};
_classname = typeOf _vehicle;
_hitpoints = getAllHitPointsDamage _vehicle;
_names = _hitpoints select 0;
_damage = _hitpoints select 2;

_vehicle removeAction _ADD_ID;
_vehicle addaction[( "<t color='#0000ff'>Hide Vehicle Status</t>"),Valor_fnc_hideVehicleStatus,[],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player",20];


_arr_with_names_and_damage = [];

{
	_arr_with_names_and_damage pushback [_x,(_damage select _foreachindex)];

} foreach _names;

_arr_for_IDS = [];

_damage_perc = missionNamespace getvariable["Valor_skill_Carglass",0.15];

{
	switch (true) do
	{
		/*
		case ([(_x select 0),"wheel"] call KRON_fnc_StrInStr):
		{
			diag_log "found Wheel";
			if([(_x select 0),"2"] call KRON_fnc_StrInStr) exitWith {diag_log format["Exit: %1",(_x select 0)];};
			if([(_x select 0),"m"] call KRON_fnc_StrInStr) exitWith {diag_log format["Exit: %1",(_x select 0)];};
			if!(_x select 1 <= 0.15) then {
				_ID = _vehicle addaction[format["<t color='#ff0000'>Repair %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"],valor_fnc_repairVehicle,["Wheel",_x select 0],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) > 0.15",str(_x select 0)],20];
				_arr_for_IDS pushback _ID;
			} else {
				_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1 - %2%3</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0},((_x select 1) * -100) + 100,"%"]),valor_fnc_removeVehiclePart,["Wheel",_x select 0],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) <= 0.15",str(_x select 0)],20];
				_arr_for_IDS pushback _ID;
			};
		};
	*/

		case ((_x select 0)isEqualTo "hitlfwheel"):
		{

			_ID = _vehicle addaction[format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}],valor_fnc_repairVehicle,["Wheel",[_x select 0,"hitlmwheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) > %2",str(_x select 0),_damage_perc],20];
			_arr_for_IDS pushback _ID;

			_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_removeVehiclePart,["Wheel",[_x select 0,"hitlmwheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) <= %2",str(_x select 0),_damage_perc],20];
			_arr_for_IDS pushback _ID;

		};


		case ((_x select 0)isEqualTo "hitrfwheel"):
		{

			_ID = _vehicle addaction[format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}],valor_fnc_repairVehicle,["Wheel",[_x select 0,"hitrmwheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) > %2",str(_x select 0),_damage_perc],20];
			_arr_for_IDS pushback _ID;

			_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_removeVehiclePart,["Wheel",[_x select 0,"hitrmwheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) <= %2",str(_x select 0),_damage_perc],20];
			_arr_for_IDS pushback _ID;

		};


		case ((_x select 0)isEqualTo "hitrbwheel"):
		{

			_ID = _vehicle addaction[format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}],valor_fnc_repairVehicle,["Wheel",[_x select 0,"hitrf2wheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) > %2",str("hitrf2wheel"),_damage_perc],20];
			_arr_for_IDS pushback _ID;

			_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_removeVehiclePart,["Wheel",[_x select 0,"hitrf2wheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) <= %2",str("hitrf2wheel"),_damage_perc],20];
			_arr_for_IDS pushback _ID;

		};


		case ((_x select 0)isEqualTo "hitlbwheel"):
		{

			_ID = _vehicle addaction[format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}],valor_fnc_repairVehicle,["Wheel",[_x select 0,"hitlf2wheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) > %2",str("hitlf2wheel"),_damage_perc],20];
			_arr_for_IDS pushback _ID;

			_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_removeVehiclePart,["Wheel",[_x select 0,"hitlf2wheel"]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage %1) <= %2",str("hitlf2wheel"),_damage_perc],20];
			_arr_for_IDS pushback _ID;

		};

		case ((_x select 0)isEqualTo "hitfuel"):
		{

			_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_repairVehicle,["Fuel",[_x select 0]],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage ""hitfuel"") > 0",20];
			_arr_for_IDS pushback _ID;

		};

		case ((_x select 0)isEqualTo "hitengine"):
		{

			_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_repairVehicle,["Engine",[_x select 0]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player && (_target getHitPointDamage ""hitengine"") > %1",_damage_perc],20];
			_arr_for_IDS pushback _ID;

			_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_removeVehiclePart,["Engine",[_x select 0]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player  && (_target getHitPointDamage ""hitengine"") <= %1",_damage_perc],20];
			_arr_for_IDS pushback _ID;

		};

		case ((_x select 0)isEqualTo "hitbody"):
		{

			_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1</t>","hull"]),valor_fnc_repairVehicle,["Hull",["hitbody","hithull"]],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player  && (_target getHitPointDamage ""hitbody"") > 0",20];
			_arr_for_IDS pushback _ID;

		};


		case ([(_x select 0),"glass"] call KRON_fnc_StrInStr):
		{

			_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_repairVehicle,["Glass",[_x select 0]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player   && (_target getHitPointDamage %1) > 0",str(_x select 0)],20];
			_arr_for_IDS pushback _ID;

		};

		case ([(_x select 0),"hrotor"] call KRON_fnc_StrInStr): // Main Rotor
		{

			_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_repairVehicle,["HRotor",[_x select 0]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player   && (_target getHitPointDamage %1) > %2",str(_x select 0),_damage_perc],20];
			_arr_for_IDS pushback _ID;

			_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_removeVehiclePart,["HRotor",[_x select 0]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player   && (_target getHitPointDamage %1) <= %2",str(_x select 0),_damage_perc],20];
			_arr_for_IDS pushback _ID;

		};

		case ([(_x select 0),"vrotor"] call KRON_fnc_StrInStr): // Rotor at the back // ATQR
		{

			_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_repairVehicle,["VRotor",[_x select 0]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player   && (_target getHitPointDamage %1) > 0",str(_x select 0)],20];
			_arr_for_IDS pushback _ID;

		};

		case ([(_x select 0),"avionics"] call KRON_fnc_StrInStr): // Avionics // INST
		{

			_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1</t>",if(((_x select 0) select[0,3]) isEqualTo "hit") then {(_x select 0) select[3,(count(_x select 0))-1]} else {_x select 0}]),valor_fnc_repairVehicle,["Avionics",[_x select 0]],1.5,false,false,"",format["((_target distance player) <= 9) && vehicle player isEqualTo player   && (_target getHitPointDamage %1) > 0",str(_x select 0)],20];
			_arr_for_IDS pushback _ID;

		};

	};

} foreach _arr_with_names_and_damage;


_vehicle setvariable["ADDACTION_IDS",_arr_for_IDS];









