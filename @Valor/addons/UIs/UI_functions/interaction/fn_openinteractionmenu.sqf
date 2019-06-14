
private ["_cursortarget","_display","_btn_1","_btn_2","_btn_3","_btn_4","_btn_5","_btn_6","_btn_7","_btn_8","_btn_9","_btn_10","_classname"];

OBJ_focused = param[0,objNull,[objNull]];
if(isnull _cursortarget) exitWith {};
if!(isnull (findDisplay 3005)) exitWith {};

_create_display = {
	if(!createDialog "interactionmenu") exitWith {systemChat "Valor Error :: Could not create the dialog!";};

	_display = findDisplay 3005;
	if(isnull _display) exitWith {};


	_btn_1 = _display displayCtrl 2400;
	_btn_2 = _display displayCtrl 2401;
	_btn_3 = _display displayCtrl 2402;
	_btn_4 = _display displayCtrl 2403;
	_btn_5 = _display displayCtrl 2404;
	_btn_6 = _display displayCtrl 2405;
	_btn_7 = _display displayCtrl 2406;
	_btn_8 = _display displayCtrl 2407;
	_btn_9 = _display displayCtrl 2408;
	_btn_10 = _display displayCtrl 2409;

	{
		_x ctrlShow false;
	} foreach [_btn_1,_btn_2,_btn_3,_btn_4,_btn_5,_btn_6,_btn_7,_btn_8,_btn_9,_btn_10];
};
_classname = typeof OBJ_focused;


switch (_classname) do
{
	case "B_CargoNet_01_ammo_F":
	{
		switch (playerside) do
		{
			case civilian:
			{
				call _create_display;
				_btn_1 ctrlshow true;
				_btn_1 ctrlsettext "Hatch Raptor";
				_btn_1 buttonSetAction "closeDialog 0;[] spawn valor_fnc_hatch_raptor;";
			};
		};
	};

};



