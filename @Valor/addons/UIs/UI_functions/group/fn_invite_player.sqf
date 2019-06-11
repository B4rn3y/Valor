
private ["_promote","_display","_listbox_member","_sel","_rank","_pid","_members","_entry","_current_rank","_new_entry","_index"];

_display = findDisplay 3004;
if(isnull _display) exitWith {};
_combo_players = _display displayCtrl 2100;
_sel = lbCurSel _combo_players;
if(_sel isEqualTo -1) exitWith {systemchat "Valor :: You havent selected anyone"};

_rank = [getplayeruid player] call valor_fnc_getGroupRank;
iF(_rank < 2) exitWith {systemchat "Valor :: You cant invite people :("};

_pid_tofind = _combo_players lbData _sel;
if(_pid_tofind isEqualTo "") exitWith {diag_log "Valor :: No Pid"};
if(_pid_tofind isEqualTo getplayeruid player) exitWith {systemchat "Valor :: Thats u, u ****!"};


_OBJ_player = [_pid_tofind] call valor_fnc_findPlayerToUID;

if(isnull _OBJ_player) exitWith {};

[Valor_group select 0, Valor_group select 1, Valor_group select 2] remoteexec["valor_fnc_player_invited",_OBJ_player];


//[1,player,valor_group select 0,_entry select 0,_rank] remoteexec["valor_fnc_syncGroupDB",2];
//[0,valor_group select 0,_members] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];

