
private ["_display","_edit_group_name","_btn_create_group","_group_name","_length","_chrByte","_allowed","_badChar"];
disableSerialization;
_display = findDisplay 3004;
if(isnull _display) exitWith {};
if!(isnil "Valor_creating") exitWith {systemchat "Valor :: You cant do that yet"};
_edit_group_name = _display displayCtrl 1400;
_btn_create_group = _display displayCtrl 2406;
if!(playerside isEqualTo civilian) exitWith {};
_group_name = ctrltext _edit_group_name;

_length = count (toArray(_group_name));
if(_length isEqualTo 0) exitWith {systemchat "Valor :: You havent entered a name for your group"};
_chrByte = toArray (_group_name);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜäöüabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {systemchat "Valor :: Your group name is too long - 32 chars allowed"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {systemchat "Valor :: Your group name has an invalid character"};


_btn_create_group spawn {_btn = _this;disableSerialization;{Valor_creating = true;_btn ctrlSetText format["Waiting  -  [%1]",_x];sleep 1;} foreach [7,6,5,4,3,2,1];_btn ctrlSetText "Create Group"; Valor_creating = nil;};

[[0,player,getPlayerUID player,_group_name],"valor_fnc_syncGroupDB",2] call valor_fnc_remoteexec;
//[0,player,getPlayerUID player,_group_name] remoteexec["valor_fnc_syncGroupDB",2];