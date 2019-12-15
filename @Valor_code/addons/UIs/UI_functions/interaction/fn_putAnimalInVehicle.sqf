_animal = param [0,a,[objNull]];
if(isNull _animal)exitWith{systemChat "Valor Error :: Animal is null";};

if(configName (inheritsFrom (configFile >> "cfgvehicles" >> (typeof _animal))) isEqualTo "dbo_horse_Base_F")exitWith{["Horses are too big!"] spawn valor_fnc_exp_hint;};

_vehicles = (nearestObjects[player,["Landvehicle","Air","Ship"],16]) select {alive _x} apply {[_x distance player,_x]};	// [[4,car1],[10,car2],[30,car3]]
if(_vehicles isEqualTo [])exitWith{["No vehicle available"] spawn valor_fnc_exp_hint;};
_car = (selectMin _vehicles) # 1;

_bot = (createGroup [civilian, true] ) createUnit ["C_man_w_worker_F", [0,0,0],[], 0, "CAN_COLLIDE"];
[_bot, true] remoteExecCall ["hideObjectGlobal",2];
[_bot, false] remoteExecCall ["enableSimulationGlobal",2];
_bot allowDamage false;
{_bot disableAI _x} foreach ["FSM","AIMINGERROR","SUPPRESSION","AUTOTARGET","TARGET","COVER","SUPPRESSION","AUTOCOMBAT","CHECKVISIBLE","MOVE","PATH"];
_bot moveInCargo _car;
if !(vehicle _bot isEqualTo _car)exitWith{deleteVehicle _bot; ["No free seat available"] spawn valor_fnc_exp_hint;};
_animal attachTo [_car,(_car worldToModelVisual (getposatl _bot))];
_bot;