

disableSerialization;
waitUntil {!isnull(findDisplay 49)};
_display = (findDisplay 49);

_backgroundTitle = _display displayCtrl 1050;
_backgroundTitle ctrlSetBackgroundColor [1,0,0,1];

_abortButton = _display displayCtrl 104;
_abortButton buttonSetAction "";
_abortButton ctrlSetText localize "STR_NOTF_AbortESC";
_abortButton buttonSetAction "[] spawn { [] spawn valor_fnc_clientDisconnect;};";


_title = _display displayCtrl 523;
_title ctrlSetText "Valor";

_saveButton = _display displayCtrl 103;
_saveButton ctrlSetText format["UID: %1",valor_uid];
_saveButton buttonSetAction "";

_saveButton ctrlEnable false;

_respawnButton = _display displayCtrl 1010;
_respawnButton ctrlSetText "Respawn";
_respawnButton ctrlEnable false;
_respawnButton buttonSetAction "
[] spawn {
	closeDialog 0;
	(findDisplay 49) closeDisplay 0;
	closeDialog 0;
	_action = [
		""Do you really want to respawn?"",
		""Valor Respawn"",
		""YES"",
		""NO""
	] call BIS_fnc_guiMessage;

	if(_action) then {
		player setdamage 1;
	};
};";

_fieldManual = _display displayCtrl 122;
_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
_fieldManual ctrlSetText "";



// player is ingame all is fine
if(!isnil "Valor_init_done") then {
	_abortButton ctrlEnable false;
	if(player getVariable["restrained",false]) then {
		_abortButton ctrlEnable false;
	} else {
		_timeStamp = time + 5;
		waitUntil {
			_abortButton ctrlSetText format["%1 - %2",localize "STR_DISP_INT_ABORT",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
		_abortButton ctrlEnable true;
		_abortButton ctrlSetBackgroundColor [1,0,0,1];

		if((getDammage player >= 0.5)) then {
			_respawnButton ctrlCommit 0;
			_respawnButton ctrlEnable true; //Enable respawn button
		};

	};
} else {
// in case of this the game has not finished the initialization process... player can only abort end exit
		_abortButton ctrlEnable false;
		_timeStamp = time + 5;
		waitUntil {
			_abortButton ctrlSetText format["%1 - %2",localize "STR_DISP_INT_ABORT",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
		_abortButton ctrlEnable true;
		_abortButton ctrlSetBackgroundColor [1,0,0,1];
};

waitUntil {isNull (findDisplay 49)};
showChat true;