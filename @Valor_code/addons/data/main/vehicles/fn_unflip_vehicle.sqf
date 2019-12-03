
private ["_exit_msg","_pos"];

_exit_msg = "";

if!(isnil "VALOR_IN_TRADER") then {
	if!(getplayeruid player in (OBJ_focused getvariable["owners",[]])) exitWith {_exit_msg = "You can only unflip Vehicles in the Survivor City for which you got the key."};
};

if(_exit_msg != "") exitWith {[_exit_msg] spawn valor_fnC_exp_hint;};

if((player distance OBJ_focused) > 20) exitWith {["Vehicle is too far away"] spawn valor_fnC_exp_hint;};

if(!isnil "Valor_unflip_cooldown") exitwith {
	["You cant do that yet"] spawn valor_fnC_exp_hint;
};
closeDialog 0;
_pos = getposatl OBJ_focused;
OBJ_focused setposatl[_pos select 0, _pos select 1, (_pos select 2) + 1];
[OBJ_focused,[0,0,1]] remoteExecCall ["setVectorUp",0];


0 spawn {Valor_unflip_cooldown = true; sleep 3; Valor_unflip_cooldown = nil;};