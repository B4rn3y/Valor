private ["_vehicle_attaching","_rope","_no_liftables","_var","_min_distance_base_lift","_objects_close","_can_lift","_exit","_var1","_B_id"];




_vehicle_attaching = _this select 0;
_rope = _this select 1;
_target = _this select 2;

if!(local _vehicle_attaching) exitWith {};

_no_liftables = getarray(missionConfigFile >> "Valor_settings" >> "lift_config" >> "not_liftable");

if((typeof _target) in _no_liftables) exitWith {
	ropeDestroy _rope;
	["Valor :: You cant lift that."] spawn valor_Fnc_exp_hint;
};


if(!isnil "VALOR_IN_TRADER") exitWith {
	if((typeof _target isKindOf "Air") || (typeof _target isKindOf "Landvehicle") || (typeof _target isKindOf "Ship")) then {
			_var = _target getvariable["owners",[]];
			if!((call valor_coplevel)>0) then {
				iF!((getplayeruid player) in _var) exitWith {ropeDestroy _rope;["Valor :: You dont have a key to this vehicle."] spawn valor_Fnc_exp_hint;};
			} else {
				if(!(getplayeruid player in _var) && !("COP" in _var)) exitWith {ropeDestroy _rope;["Valor :: You dont have a key to this vehicle."] spawn valor_Fnc_exp_hint;};

			};
		};
};


_min_distance_base_lift = getnumber(missionConfigFile >> "Valor_settings" >> "lift_config" >> "min_distance_base_lift");


_objects_close = nearestObjects[_target,["House"],_min_distance_base_lift];
_can_lift = true;
_exit = false;
{
	_var = _x getVariable["valor_base_ids",[]];
	_var1 = _x getVariable["valor_wall_ids",[]];
	if(!(_var isEqualTo []) || !(_var1 isEqualTo [])) then {
			if!(_var isEqualTo []) then {
				_B_id = _var select 0;
				if!([_B_id] call valor_fnc_has_base_access) exitWith {_exit = true;};
			} else {
				G_id = _var1 select 1;
				if(isnil "valor_group") exitWith {_exit = true;};
				if(valor_group isEqualTo []) exitWith {_exit = true;};
				if!((valor_group select 0) isEqualTo G_id) exitWith {_exit = true;};
			};
		if(_exit) exitWith {_can_lift = _target distance _x;};
	};
} foreach _objects_close;


if((typeName _can_lift) isEqualTo "SCALAR") exitWith {ropeDestroy _rope;[format["Valor :: The target is too close to base objects. Current distance: %1m - Allowed: %2m.",round _can_lift,_min_distance_base_lift]] spawn valor_Fnc_exp_hint;};
