

private ["_var","_base_id","_group_id","_action","_removed","_foreachindex"];

if(isnil "OBJ_focused") exitWith {};
if(isnull OBJ_focused) exitWith {};
_var = OBJ_focused getvariable["valor_base_ids",[-1,-1,-1]];
_base_id = _var select 0;
_group_id = _var select 1;
_config_id = _var select 2;
if(_base_id isEqualTo -1) exitWith {systemchat "Valor ERROR :: Unknown _base_id"};

_action = [
	format["Do you really want to deploy a raptor to this base? A base can only have one raptor."],
	"Valor",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;


if!(_action) exitWith {};


_removed = false;
{
	if("valor_Raptor_Egg" in _x) exitWith {
		switch (_foreachindex) do
		{
			case 0:
			{
				player removeItemFromUniform "valor_Raptor_Egg";
				_removed = true;
			};

			case 1:
			{
				player removeItemFromVest "valor_Raptor_Egg";
				_removed = true;
			};

			case 2:
			{
				player removeItemFromBackpack "valor_Raptor_Egg";
				_removed = true;
			};


		};
	};
} foreach [uniformItems player,vestItems player,backpackItems player];

if!(_removed) exitWith {systemchat "Valor :: You dont have a Raptor egg to hatch in the inventory"};

_range = ([_config_id] call valor_fnc_base_config) select 3;

[_base_id,getposatl OBJ_focused,_group_id,_config_id,_range] remoteExec["valor_fnc_insert_raptor",2];
systemchat "Valor :: The raptor is being spawned";


