
private ["_cursortarget","_display","_btn_1","_btn_2","_btn_3","_btn_4","_btn_5","_btn_6","_btn_7","_btn_8","_btn_9","_btn_10","_classname"];

OBJ_focused = param[0,objNull,[objNull]];
if(player getvariable["valor_restrained",false]) exitWith {};
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


_attached_player = objNull;
{iF(isplayer _x) exitWith {_attached_player = _x};} foreach (attachedObjects player);




_classname = typeof OBJ_focused;




// another player (restrained)
if((_classname isKindOf "MAN" && alive OBJ_focused && OBJ_focused getvariable["valor_restrained",false] && ((player distance OBJ_focused) < 3.1)) || !(_attached_player isEqualTo objNull)) exitWith {

	call _create_display;
	_btn_1 ctrlshow true;
	_btn_1 ctrlsettext "Unrestrain";
	_btn_1 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_unrestrain;";

	if(isnull _attached_player) then {
		_btn_2 ctrlshow true;
		_btn_2 ctrlsettext "Escort";
		_btn_2 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_escortAction;";
	} else {
		OBJ_focused = _attached_player;
		_btn_2 ctrlshow true;
		_btn_2 ctrlsettext "Stop Escorting";
		_btn_2 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_stopEscorting;";
	};

	if(playerSide isEqualTo opfor) then {
		_btn_3 ctrlshow true;
		_btn_3 ctrlsettext "Ticket";
		_btn_3 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_ticketDialog;";
	} else {

	};
};




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



