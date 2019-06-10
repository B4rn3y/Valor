
private ["_display","_edit_group_name","_btn_create_group","_group_name","_length","_chrByte","_allowed","_badChar"];
_display = findDisplay 3004;
if(isnull _display) exitWith {};

_edit_group_name = _display displayCtrl 1400;
_btn_create_group = _display displayCtrl 2406;

_group_name = ctrltext _edit_group_name;

_length = count (toArray(_group_name));
_chrByte = toArray (_group_name);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜäöüabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {systemchat "Valor :: Your group name is too long - 32 chars allowed"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {systemchat "Valor :: Your group name has an invalid character"};

_btn_create_group ctrlEnable false;
_btn_create_group spawn {sleep 7; _btn_create_group ctrlEnable true};

[0,player,getPlayerUID player,_group_name] remoteexec["valor_fnc_syncGroupDB",2];