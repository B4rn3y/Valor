


private ["_vehicle","_ADD_ID","_part","_item"];
_vehicle = param[0,objNull,[objNull]];
_ADD_ID = param[2,-1,[-1]];
_part = param[3,[],[[]]];
if(_part isEqualTo []) exitWith {};
if(isnull _vehicle) exitWith {};
_valor_config_name = _part select 0;
_config_name = _part select 1;

diag_log str [_valor_config_name,_config_name];
_item = gettext(missionConfigFile >> "Valor_settings" >> "repair_system" >> format["%1_repair",_valor_config_name]);


if(_item isEqualTo "") exitWith {systemchat "Valor :: This cant be repaired"};


if([_item,1,true] call valor_fnc_itemInInventory) then {
	playsound "repair";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	_vehicle removeAction _ADD_ID;
	_vehicle setHitPointDamage [_config_name, 0];

	_ID = _vehicle addaction[( format["<t color='#00ff00'>Remove %1 - %2%3</t>",if((_config_name select[0,3]) isEqualTo "hit") then {_config_name select[3,(count(_config_name))-1]} else {_config_name},((0) * -100) + 100,"%"]),valor_fnc_removeVehiclePart,[_valor_config_name,_config_name],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player",20];
	_ids = _vehicle getvariable["ADDACTION_IDS",[]];
	_ids pushback _ID;
	_vehicle setvariable["ADDACTION_IDS",_ids];
	if!(_vehicle getvariable["Update_this",false]) then {
		_vehicle setvariable["Update_this",true,true];
	};


} else {
	systemchat format["Valor :: You need a %1 to repair this!",(gettext(configfile >> "cfgweapons" >> _item >> "displayname"))];
};




