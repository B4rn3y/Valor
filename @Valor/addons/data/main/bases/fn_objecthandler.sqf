
private ["_object","_var_object","_gorup_id","_object_group_id"];
_object = param[0,objNull,[objNull]];

if(isnil "valor_group") exitWith {};
if(valor_group isEqualTo []) exitWith {};

if(isnull _object) exitWith	{
	_object = nearestobject[player,"Land_Net_Fence_Gate_F"];
	if!(isNull _object) then {
		if(player distance _object < 5) then {
			[_object] call valor_fnc_lockdoor;
		};
	};
};

_var_object = _object getvariable["valor_base_ids",-1];
if(_var_object isEqualTo -1) exitWith {};

_gorup_id = valor_group select 0;
_object_group_id = _var_object select 1;

if(_gorup_id isEqualTo _object_group_id) then {
	[_object] call valor_fnc_lockdoor;
};


