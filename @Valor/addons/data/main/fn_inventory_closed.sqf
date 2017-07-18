_container = _this select 1;
Valor_gear = [player] call valor_fnc_gear_to_var;


[0] call valor_fnc_step_update;

if(_container iskindof "Landvehicle" || _container iskindof "AIR" || _container iskindof "SHIP") then {
	_container setvariable["Inv_Changed",true,true];

};