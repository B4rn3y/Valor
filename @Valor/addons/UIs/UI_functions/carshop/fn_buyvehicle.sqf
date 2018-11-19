
private ["_display","_header","_listbox","_config","_classname","_price","_spawnpos","_spawndir"];
if(isnull(finddisplay 3003)) exitWith {};

disableSerialization;
_display = findDisplay 3003;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;

_config = _listbox lbdata (lbCurSel _listbox);
_id = _listbox lbValue (lbCurSel _listbox);
diag_log str _config;
_config = call compile _config;
diag_log str _config;
_classname = _config select 0;
_price = _config select 1;
_spawnpos = _config select 2;
_spawndir = _config select 3;


if(_classname isEqualTo "" || _id isEqualTo -1 || _price isEqualTo 0 || _spawnpos isEqualTo []) exitWith {diag_log "Valor Error :: Exiting buyvehicle Function line 21"};


closeDialog 0;


// So we need some sort of payment check here, WIP


systemchat "Valor :: Your Purchase is being processed. This may take a while.";

sleep random 7;


[_id,player,_classname,_spawnpos,_spawndir,_price] remoteExec["valor_fnc_createvehicleshop",2];



