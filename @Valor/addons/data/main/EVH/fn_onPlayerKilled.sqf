private ["_unit","_killer","_time_died","_display","_str_text"];

disableSerialization;
closeDialog 0;
_unit = param [0,ObjNull,[ObjNull]];
_killer = param [1,ObjNull,[ObjNull]];

[5] call valor_fnc_step_update;

if  !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, (getPosATL _unit select 2)];
};




//Set some vars
_time_died = time;
_unit setvariable["time_dead",_time_died,true];

//Setup our camera view
valor_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
valor_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
valor_deathCamera camSetTarget _unit;
valor_deathCamera camSetRelPos [0,3.5,4.5];
valor_deathCamera camSetFOV .5;
valor_deathCamera camSetFocus [50,0];
valor_deathCamera camCommit 0;

[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; valor_deathCamera camSetTarget _unit; valor_deathCamera camSetRelPos [0,3.5,4.5]; valor_deathCamera camCommit 0;};
};

_display = findDisplay 46;
_str_text = _display ctrlCreate ["RscStructuredText", 645];

_str_text ctrlSetPosition [0, 0.7, 1, 0.5];
_str_text ctrlCommit 0;

while {(time - _time_died)< 60} do
{
	_str_text ctrlSetStructuredText parsetext format["<t color='#FF0000' align='center' size='1.5'>DEATH IN:</t><br/><t  color='#FFFFFF' align='center' size='1.1'>%1</t>",round (60 - (time - _time_died))];
	sleep 1;
};


ctrlDelete _str_text;


valor_hunger = 100;
valor_thirst = 100;
Valor_cash = 0;
valor_gear = [];

