_container = _this select 1;
if(valor_alive isEqualTo 0) exitWith {};
Valor_gear = [player] call valor_fnc_gear_to_var;


[0] call valor_fnc_step_update;

if(_container iskindof "Landvehicle" || _container iskindof "AIR" || _container iskindof "SHIP") then {
	_var = _container getvariable "Update_this";
	if(isnil "_var") then {
		_container setvariable["Update_this",true,true];
	};
};

_var = _container getvariable "cop";
if!(isnil "_var") exitWith {
	[_container,2] remoteexec["valor_fnc_savecrate",2];
};


_var = _container getvariable "valor_base_ids";
if!(isnil "_var") then {
	if(count _var > 3) then {
		[_container,1] remoteexec["valor_fnc_savecrate",2];
	} else {
	 	[_container,0] remoteexec["valor_fnc_savecrate",2];
	 };
};