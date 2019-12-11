private ["_create_display","_display","_btn_1","_btn_2","_btn_3","_btn_4","_btn_5","_btn_6","_btn_7","_btn_8","_btn_9","_btn_10","_attached_player","_classname","_veh_close","_v_close","_pos","_can_pull_out","_base_box_classname","_var"];


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



if((player distance OBJ_focused < 7) && playerSide isEqualTo civilian && !(OBJ_focused getvariable["valor_wall_ids",[]] isEqualTo [])) exitWith {
	call _create_display;
	_btn_1 ctrlshow true;
	_btn_1 ctrlsettext "Remove";
	_btn_1 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_remove_wall;";
};


// another player (restrained)
if((_classname isKindOf "MAN" && alive OBJ_focused && ((player distance OBJ_focused) < 3.1)) || !(_attached_player isEqualTo objNull)) exitWith {

	call _create_display;
	if(OBJ_focused getvariable["valor_restrained",false]) then {
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

		_veh_close = (nearestObjects[player,["Landvehicle","Air","Ship"],10]) select {alive _x && ((locked _x) isEqualTo 0)};
		if(_veh_close isEqualTo []) then {
			_btn_3 ctrlshow true;
			_btn_3 ctrlsettext "Put in Vehicle";
			_btn_3 ctrlEnable false;
		} else {
			_btn_3 ctrlshow true;
			_btn_3 ctrlsettext "Put in Vehicle";
			_btn_3 buttonSetAction "closeDialog 0;_v_close = (nearestObjects[player,[""Landvehicle"",""Air"",""Ship""],10]) select {alive _x && ((locked _x) isEqualTo 0)}; if(_v_close isEqualTo []) exitWith {[""There is no suitable vehicle close""] spawn valor_fnc_exp_hint;};detach OBJ_focused;[OBJ_focused,(_v_close select 0)] remoteExecCall[""moveInCargo"",OBJ_focused];";
		};
	};

	if(playerSide isEqualTo opfor) then {
		_btn_4 ctrlshow true;
		_btn_4 ctrlsettext "Ticket";
		_btn_4 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_ticketDialog;";

		if(OBJ_focused getvariable["valor_restrained",false]) then {
			_btn_5 ctrlShow true;
			_btn_5 ctrlSetText "Jail";
			_btn_5 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_arrestaction;";


			if((player distance (getmarkerpos "cop_jail")) > 20) then {
				_btn_5 ctrlEnable false;
			};
		};
	} else {

	};
};


if((_classname isKindOf "AIR" || _classname isKindOf "Landvehicle" || _classname isKindOf "Ship" ) && alive OBJ_focused && ((player distance OBJ_focused) < 15.1)) exitWith {

	call _create_display;
	_btn_1 ctrlshow true;
	_btn_1 ctrlEnable false;
	_btn_1 ctrlsettext format["DB-ID: %1",OBJ_focused getvariable["DBID",-1]];
	_btn_1 buttonSetAction "";


	_btn_2 ctrlshow true;
	_btn_2 ctrlsettext "Unflip";
	_btn_2 buttonSetAction "0 spawn valor_Fnc_unflip_vehicle;";

	_can_pull_out = if(count (crew OBJ_focused) > 0) then {{if(_x getVariable["valor_restrained",false]) exitWith {true}} foreach (crew OBJ_focused);} else {false};
	if(_can_pull_out) then {
		_btn_3 ctrlshow true;
		_btn_3 ctrlsettext "Pull out";
		_btn_3 buttonSetAction "closeDialog 0;{if(_x getVariable[""valor_restrained"",false]) then {_x action [""Eject"", OBJ_focused];};} foreach (crew OBJ_focused);";
	} else {
		_btn_3 ctrlshow true;
		_btn_3 ctrlsettext "Pull out";
		_btn_3 ctrlEnable false;
	};

	if(playerside isEqualTo opfor) then {
		if(!isnil "VALOR_IN_TRADER" && (attachedObjects OBJ_focused isEqualTo [])) then {
			_btn_4 ctrlshow true;
			_btn_4 ctrlsettext "Attach Siren";
			_btn_4 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_set_attach_pos;";
		} else {
			_btn_4 ctrlshow true;
			_btn_4 ctrlsettext "Attach Siren";
			_btn_4 ctrlEnable false;
		};

		if(!isnil "VALOR_IN_TRADER" && !(attachedObjects OBJ_focused isEqualTo [])) then {
			_btn_5 ctrlshow true;
			_btn_5 ctrlsettext "Remove Siren";
			_btn_5 buttonSetAction "closeDialog 0;_id = OBJ_focused getvariable[""DBID"",-1];if(_id isEqualTo -1) exitWith {[""ERROR: DBID unknown""] spawn valor_fnC_exp_hint;}; [[1,_id],""valor_fnc_update_attach_pos"",2] call valor_fnc_remoteexec; {detach _x; deleteVehicle _x;} foreach (attachedObjects OBJ_focused);";
		} else {
			_btn_5 ctrlshow true;
			_btn_5 ctrlsettext "Remove Siren";
			_btn_5 ctrlEnable false;
		};
	};
};


_base_box_classname = getarray(missionConfigFile >> "Valor_settings" >> "bases" >> "base_box_classnames");

switch (true) do
{
	case (_classname in _base_box_classname):
	{
		switch (playerside) do
		{
			case civilian:
			{
				_var = OBJ_focused getvariable["valor_base_ids",[]];
				if!((count _var) >= 5) exitWith {};
				if!([_var select 0] call valor_fnc_has_base_access) exitWith {};
				call _create_display;

				_btn_1 ctrlshow true;
				_btn_1 ctrlsettext "Manage Entry List";
				_btn_1 buttonSetAction "closeDialog 0;[OBJ_focused] spawn valor_fnc_open_base_entry;";

				_btn_2 ctrlshow true;
				_btn_2 ctrlsettext "Hatch Raptor";
				_btn_2 buttonSetAction "closeDialog 0;[] spawn valor_fnc_hatch_raptor;";

				_btn_3 ctrlshow true;
				_btn_3 ctrlsettext "Bank Menu";
				_btn_3 buttonSetAction "closeDialog 0;[] spawn valor_fnc_open_bank_menu;";

			};
		};
	};

};



