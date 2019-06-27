

private ["_vehicle","_ADD_ID","_part","_valor_config_name","_config_name","_item","_holder"];
_vehicle = param[0,objNull,[objNull]];
_ADD_ID = param[2,-1,[-1]];
_part = param[3,[],[[]]];
if(_part isEqualTo []) exitWith {};
if(isnull _vehicle) exitWith {};
_valor_config_name = _part select 0;
_config_name = _part select 1;

diag_log str [_valor_config_name,_config_name];
_item = gettext(missionConfigFile >> "Valor_settings" >> "repair_system" >> format["%1_remove",_valor_config_name]);


if(_item isEqualTo "") exitWith {systemchat "Valor :: This cant be removed"};
playsound "repair";
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
_vehicle removeAction _ADD_ID;


_names = [_config_name];
switch (_config_name) do
{
	case "hitlfwheel":
	{
		_names pushBack "hitlf2wheel";
	};

	case "hitrfwheel":
	{
		_names pushBack "hitrf2wheel";
	};
	case "hitlbwheel":
	{
		_names pushBack "hitlmwheel";
	};

	case "hitrbwheel":
	{
		_names pushBack "hitrmwheel";
	};
};


//_vehicle setHitPointDamage [_config_name, 1];
[_vehicle,_names,1] remoteexec["valor_fnc_setHitpointDamage",0];


_ID = _vehicle addaction[( format["<t color='#ff0000'>Repair %1 - %2%3</t>",if((_config_name select[0,3]) isEqualTo "hit") then {_config_name select[3,(count(_config_name))-1]} else {_config_name},((1) * -100) + 100,"%"]),valor_fnc_repairVehicle,[_valor_config_name,_config_name],1.5,false,false,"","((_target distance player) <= 9) && vehicle player isEqualTo player",20];
_ids = _vehicle getvariable["ADDACTION_IDS",[]];
_ids pushback _ID;
_vehicle setvariable["ADDACTION_IDS",_ids];

_holder =  createVehicle ["groundweaponholder",(getposatl player), [], 0, "can_Collide"];
_holder addItemCargoGlobal [_item, 1];

if!(_vehicle getvariable["Update_this",false]) then {
		_vehicle setvariable["Update_this",true,true];
};
