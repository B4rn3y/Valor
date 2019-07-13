
private ["_display","_header","_listbox","_config","_classname","_price","_spawnpos","_spawndir"];
if(isnull(finddisplay 3003)) exitWith {};

disableSerialization;
_display = findDisplay 3003;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_id = _listbox lbValue (lbCurSel _listbox);
if(_id isEqualTo -1) exitWith {};
_config = _listbox lbdata (lbCurSel _listbox);
if(isNil "_config") exitWith {};
if(_config isEqualTo "") exitWith {};
_config = call compile _config;
_classname = _config select 0;
_price = _config select 1;
_spawnpos = _config select 2;
_spawndir = _config select 3;


if(_classname isEqualTo "" || _id isEqualTo -1 || _price isEqualTo 0 || _spawnpos isEqualTo []) exitWith {diag_log "Valor Error :: Exiting buyvehicle Function line 21"};



// So we need some sort of payment check here, WIP
_can_pay = [_price,true] call valor_fnc_pay;

if!(_can_pay) exitWith{titletext[format["You are missing $%1 on your bank!",[((Valor_bankacc - _price)* -1)] call valor_fnc_numbertext],"PLAIN DOWN"]; };



closeDialog 0;




titleText["Valor :: Your Purchase is being processed. This may take a while.","PLAIN DOWN"];

sleep random 7;

[[_id,player,_classname,_spawnpos,_spawndir,_price],"valor_fnc_createvehicleshop",2] call valor_fnc_remoteexec;
//[_id,player,_classname,_spawnpos,_spawndir,_price] remoteExec["valor_fnc_createvehicleshop",2];



