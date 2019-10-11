

private ["_display","_listbox","_edit","_veh_sel","_pl_sel","_veh","_pid","_player","_var"];

_display = findDisplay 3015;
if(isnull _display) exitWith {};

_listbox = _display displayCtrl 1500;
_edit = _display displayCtrl 1400;

_veh_sel = lbCurSel _listbox;
_pl_sel = lbCurSel _edit;

if(_veh_sel isEqualTo -1) exitWith {["You havent selected a vehicle"] spawn valor_fnc_exp_hint;};
if(_pl_sel isEqualTo -1) exitWith {["You havent selected a player"] spawn valor_fnc_exp_hint;};


_veh = objectFromNetId(_listbox lbData _veh_sel);
if(isnull _veh) exitWith {["This vehicle does not exist anymore O.o"] spawn valor_fnc_exp_hint;};


_pid = _edit lbData _pl_sel;
_player = playableUnits select {getplayeruid _x isEqualTo _pid};

iF(_player isEqualTo []) exitWith {["The selected player cant be found"] spawn valor_fnc_exp_hint;};
_player = _player select 0;

_var = _veh getvariable["owners",[]];
if(_pid in _var) exitWith {["This player already has a key"] spawn valor_fnc_exp_hint;};

_var pushBackUnique _pid;
_veh setvariable["owners",_var,true];
_veh setvariable["update_this",true,true];

[format["You got the key for %1 from %2",gettext(configFile >> "CfgVehicles" >> (typeof _veh) >> "displayname"),profileName]] remoteExec["valor_fnc_exp_hint",[_player]];
