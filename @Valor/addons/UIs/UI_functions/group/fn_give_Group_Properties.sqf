

private ["_display","_combo_groups","_sel","_rank","_Group_name","_former_Group_id_","_action"];

_display = findDisplay 3004;
if(isnull _display) exitWith {};
_combo_groups = _display displayCtrl 2101;
_sel = lbCurSel _combo_groups;
if(_sel isEqualTo -1) exitWith {systemchat "Valor :: You havent selected any group!"};

_rank = [getplayeruid player] call valor_fnc_getGroupRank;
iF(_rank < 3) exitWith {systemchat "Valor :: You cant do that :("};

_Group_name = _combo_groups lbData _sel;
if(_Group_name isEqualTo "") exitWith {diag_log "Valor :: No Group Name"};

_former_Group_id_ = _combo_groups lbValue _sel;
if(_former_Group_id_ isEqualTo -1) exitWith {diag_log "Valor :: No Group ID"};



_action = [
	format["Do you really want to give the group %1 all properties of your gang? The properties will belong to the selected Gang after the next Server Restart.",_Group_name],
	"Valor Group Sytem",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};




_action = [
	format["Are you sure about that? The properties will belong to the selected Gang after the next Server Restart."],
	"Valor Group Sytem",
	"YES",
	"NO"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};



[5,player,valor_group select 0,_former_Group_id_] remoteexec["valor_fnc_syncGroupDB",2];


//[1,player,valor_group select 0,_entry select 0,_rank] remoteexec["valor_fnc_syncGroupDB",2];
//[0,valor_group select 0,_members] remoteexec["valor_fnc_syncGroup",([valor_group select 0] call valor_fnc_getGroupMembers)];

