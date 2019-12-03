private ["_vehicle","_ADD_ID","_part","_valor_config_name","_config_names","_config_name","_item","_msg_exit","_lock","_var","_ID","_ids","_near_holder","_holder"];



_vehicle = param[0,objNull,[objNull]];
_ADD_ID = param[2,-1,[-1]];
_part = param[3,[],[[]]];
if(isEngineOn _vehicle) exitWith {["You cant remove parts from a vehicle with running engine."] spawn valor_fnc_exp_hint};
if(_part isEqualTo []) exitWith {};
if(isnull _vehicle) exitWith {};
_valor_config_name = _part select 0;
_config_names = _part select 1;
_config_name = _config_names select 0;



_item = gettext(missionConfigFile >> "Valor_settings" >> "repair_system" >> format["%1_remove",_valor_config_name]);


if(_item isEqualTo "") exitWith {systemchat "Valor :: This cant be removed"};
_msg_exit = "";
if!(isnil "VALOR_IN_TRADER") then {
	_lock = locked _vehicle;
	_var = _vehicle getvariable["owners",[]];
	if!((call valor_coplevel)>0) then {
		iF(_lock isEqualTo 2) exitWith {
			iF!((getplayeruid player) in _var) exitWith {_msg_exit = "You dont have a key for this vehicle, exiting"};
		};
	} else {
		iF(_lock isEqualTo 2) then {
			if(!(getplayeruid player in _var) && !("COP" in _var)) exitWith {_msg_exit = "You dont have a key for this vehicle, exiting"};
		};
	};
};

if!(_msg_exit isEqualTo "") exitWith {[_msg_exit] spawn valor_fnc_exp_hint};


playsound "repair";
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";





//_vehicle setHitPointDamage [_config_name, 1];
[_vehicle,_config_names,1] remoteexec["valor_fnc_setHitpointDamage",0];

/*
_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if((_config_name select[0,3]) isEqualTo "hit") then {_config_name select[3,(count(_config_name))-1]} else {_config_name},((1) * -100) + 100,"%"]),valor_fnc_repairVehicle,[_valor_config_name,_config_name],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player",20];
_ids = _vehicle getvariable["ADDACTION_IDS",[]];
_ids pushback _ID;
_vehicle setvariable["ADDACTION_IDS",_ids];
*/

_near_holder = nearestObjects[player,["groundweaponholder"],1];
if!(_near_holder isEqualTo []) then {
	_holder = _near_holder select 0;
	_holder addItemCargoGlobal [_item, 1];
} else {
	_holder =  createVehicle ["groundweaponholder",(getposatl player), [], 0, "can_Collide"];
	_holder addItemCargoGlobal [_item, 1];
};

if!(_vehicle getvariable["Update_this",false]) then {
		_vehicle setvariable["Update_this",true,true];
};
