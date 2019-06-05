_container = _this select 1;
Valor_gear = [player] call valor_fnc_gear_to_var;


[0] call valor_fnc_step_update;

if(_container iskindof "Landvehicle" || _container iskindof "AIR" || _container iskindof "SHIP") then {
	_var = _container getvariable "Update_this";
	if(isnil "_var") then {
		_container setvariable["Update_this",true,true];
	};
};

_var = _container getvariable "valor_base_ids";
if!(isnil "_var") then {
	 [_container] remoteexec["valor_fnc_savecrate",2];
};