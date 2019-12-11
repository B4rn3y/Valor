
private ["_obj","_var","_wall_id","_group_id","_wall_type_id","_my_group_id","_action","_wall_conf","_holder","_near_holder"];

_obj = param[0,objNull,[objNull]];


_var = _obj getvariable["valor_wall_ids",[]];

if(_var isEqualTo []) exitWith {};

_wall_id = _var select 0;
_group_id = _var select 1;
_wall_type_id = _var select 2;

if(_wall_id isEqualTo -1) exitWith {["This Object can be removed after the next restart."] spawn valor_fnC_exp_hint;};

if(isnil "valor_group") exitWith {};
if(valor_group isEqualTo []) exitWith {};

_my_group_id = valor_group select 0;

if!(_my_group_id isEqualTo _group_id) exitWith {["This is not yours..."] spawn valor_fnC_exp_hint;};


_action = [
	format["Do you really want to remove this object? You will get all resources for this object back."],
	"Valor",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};


_wall_conf = [_wall_type_id,0] call valor_fnc_base_config;
if(_wall_conf isEqualTo []) exitWith {};

_holder = objNull;
_near_holder = nearestObjects[player,["groundweaponholder"],1];
if!(_near_holder isEqualTo []) then {
	_holder = _near_holder select 0;
} else {
	_holder =  createVehicle ["groundweaponholder",(getposatl player), [], 0, "can_Collide"];
};

{
	_holder addItemCargoGlobal[(_x select 0),(_x select 1)];
} foreach (_wall_conf select 1);


deleteVehicle _obj;

[[_wall_id],"valor_fnc_delete_wall",2] call valor_fnc_remoteexec;
