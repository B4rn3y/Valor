
private ["_refresh","_display","_str_text_stats","_listbox_member","_btn_leave","_btn_invite","_btn_kick","_btn_promote","_btn_demote","_btn_setLeader","_btn_create_group","_btn_close","_btn_delete_gang","_btn_give_group_properties","_background_no_gang","_combo_players","_combo_groups","_combo_players_money","_edit_group_name","_edit_give_money","_rank","_online","_ret","_pid","_man_close","_men","_X","_player","_var","_active_groups","_id_group"];
_refresh = param[0,false,[false]];
disableSerialization;
if!(_refresh) then {


	if!(isnull (findDisplay 3004)) exitWith {};
	if(!createDialog "group_menu") exitWith {systemChat "Valor Error :: Could not create the dialog!";};
};
_display = findDisplay 3004;
if(isnull _display) exitWith {};
_str_text_stats = _display displayCtrl 1100;
_listbox_member = _display displayCtrl 1500;
_btn_leave = _display displayCtrl 2400;
_btn_invite = _display displayCtrl 2401;
_btn_kick = _display displayCtrl 2402;
_btn_promote = _display displayCtrl 2403;
_btn_demote = _display displayCtrl 2404;
_btn_setLeader = _display displayCtrl 2405;
_btn_create_group = _display displayCtrl 2406;
_btn_close = _display displayCtrl 2407;
_btn_delete_gang = _display displayCtrl 2408;
_btn_give_group_properties = _display displayCtrl 2409;

_background_no_gang = _display displayCtrl 1004;

_combo_players = _display displayCtrl 2100;
_combo_groups = _display displayCtrl 2101;
_combo_players_money = _display displayCtrl 2102;

_edit_group_name = _display displayCtrl 1400;
_edit_give_money = _display displayCtrl 1401;

_background_no_gang ctrlsetfade 0;
_background_no_gang ctrlCommit 0;

_edit_group_name ctrlsetfade 0;
_edit_group_name ctrlCommit 0;

_btn_create_group ctrlSetFade 0;
_btn_create_group ctrlCommit 0;
if!(playerside isEqualTo civilian) then {_btn_create_group ctrlEnable false;};
_str_text_stats ctrlSetStructuredText parsetext format[" <t size='0.9'>Playtime</t><br/> <t  color='#01DF01' size='1.5'>%1 hours</t> ",[Valor_playtime * 60,"HH:MM"] call BIS_fnc_secondsToString];

{_x ctrlEnable false;} foreach [_listbox_member,_btn_leave,_btn_invite,_btn_kick,_btn_promote,_btn_demote,_btn_setLeader,_combo_players,_btn_delete_gang,_combo_groups,_btn_give_group_properties];

_edit_give_money ctrlSetText "0";
_rank = [getPlayerUID player] call valor_fnc_getGroupRank;

if(_rank isEqualTo 0) exitWith {};

_background_no_gang ctrlsetfade 1;
_background_no_gang ctrlCommit 0;

_edit_group_name ctrlsetfade 1;
_edit_group_name ctrlCommit 0;

_btn_create_group ctrlSetFade 1;
_btn_create_group ctrlCommit 0;
{_x ctrlEnable true;} foreach [_listbox_member,_btn_leave];

if(_rank > 1) then {
	{_x ctrlEnable true;} foreach [_btn_invite,_btn_kick,_combo_players];
};
if(_rank > 2) then {
	{_x ctrlEnable true;} foreach [_btn_promote,_btn_demote,_btn_setLeader,_btn_delete_gang,_combo_groups,_btn_give_group_properties];
};





_online = {
	_ret = objNull;
	{if(getplayeruid _x isEqualTo _pid) exitWith {_ret = _x;}} foreach playableUnits;
	_ret
};

lbClear _combo_players;
lbclear _listbox_member;
lbclear _combo_groups;
lbClear _combo_players_money;


_man_close = nearestObjects[player,["MAN"],3];
_men = [];
{
	if(isplayer _x && alive _x) then {
		_men pushBackUnique _x;
	};
} foreach _man_close;

_men = _men - [player];

{
	_id = _combo_players_money lbadd format["%1",name _X];
	_combo_players_money lbSetData[_id,getplayeruid _x];
} foreach _men;


{
	_pid = _x select 0;
	_rank = _x select 1;
	_name = _x select 2;

	_id = _listbox_member lbAdd format["[%1] - %2",_rank,_name];
	_listbox_member lbSetData[_id,_pid];
	_player = call _online;
	if!(isnull _player) then {
		_var = _player getVariable ["Valor_group_id",[-1,"ERROR"]];
		if(_var isEqualTo [-1,"ERROR"]) then {
			_listbox_member lbSetColor[_id,[1,0.502,0,1]];
		} else {
			_listbox_member lbSetColor[_id,[0.004,0.875,0.004,1]];
		};
		_var = nil;
	} else {
		_listbox_member lbSetColor[_id,[1,0,0,1]];
	};

} foreach (valor_group select 1);

{
	_var = _x getVariable ["Valor_group_id",[-1,"ERROR"]];
	if(_var isEqualTo [-1,"ERROR"] && !(_x getvariable["cop",false])) then {
		_id = _combo_players lbadd (name _x);
		_combo_players lbSetData[_id,getplayeruid _x];
	};
	_var = nil;
} foreach playableUnits;

_active_groups = 0 call valor_fnc_getActiveGroups;
_active_groups = _active_groups - [[(valor_group select 0),(valor_group select 2)]];
{
	_id_group = _x select 0;
	_name = _x select 1;
	_id = _combo_groups lbadd _name;
	_combo_groups lbSetData[_id,_name];
	_combo_groups lbSetValue[_id,_id_group];

} foreach _active_groups;

