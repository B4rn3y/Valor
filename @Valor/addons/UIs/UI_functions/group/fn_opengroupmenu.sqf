_refresh = param[0,false,[false]];
if(_refresh) then {
	closedialog 0;

	disableSerialization;
	if(!createDialog "group_menu") exitWith {systemChat "Valor Error :: Could not create the dialog!";};
};
_display = findDisplay 3004;
if(isnull _display) exitWith {};
_str_text_playtime = _display displayCtrl 1100;
_listbox_member = _display displayCtrl 1500;
_btn_leave = _display displayCtrl 2400;
_btn_invite = _display displayCtrl 2401;
_btn_kick = _display displayCtrl 2402;
_btn_promote = _disply displayCtrl 2403;
_btn_demote = _display displayCtrl 2404;
_btn_setLeader = _display displayCtrl 2405;
_btn_create_group = _display displayCtrl 2406;
_btn_close = _display displayCtrl 2407;
_btn_delete_gang = _display displayCtrl 2408;

_background_no_gang = _display displayCtrl 1004;

_combo_players = _display displayCtrl 2100;

_edit_group_name = _display displayCtrl 1400;

{_x ctrlEnable false;} foreach [_listbox_member,_btn_leave,_btn_invite,_btn_kick,_btn_promote,_btn_demote,_btn_setLeader,_combo_players,_btn_delete_gang];


_rank = [getPlayerUID player] call valor_fnc_getGroupRank;

if(_rank isEqualTo 0) exitWith {};

_background_no_gang ctrlsetfade 1;
_background_no_gang ctrlCommit 0;

_edit_group_name ctrlsetfade 1;
_edit_group_name ctrlCommit 0;

_btn_create_group ctrlSetFade 1;
_btn_create_group ctrlCommit 0;
{_x ctrlEnable false;} foreach [_listbox_member,_btn_leave];

if(_rank > 1) then {
	{_x ctrlEnable true;} foreach [_btn_invite,_btn_kick,_combo_players];
};
if(_rank > 2) then {
	{_x ctrlEnable true;} foreach [_btn_promote,_btn_demote,_btn_setLeader,_btn_delete_gang];
};


_online = {
	_ret = objNull;
	{if(getplayeruid _x isEqualTo _pid) exitWith {_ret = _x;}} foreach playableUnits;
	_ret
};

lbClear _combo_players;
lbclear _listbox_member;
{
	_pid = _x select 0;
	_rank = _x select 1;
	_name = _x select 2;

	_id = _listbox_member lbAdd format["[%1] - %2",_rank,_name];
	_listbox_member lbSetData[_id,_pid];

	if!(isnull _online) then {
		if((side _online) in [opfor,independent,blufor]) then {
			_listbox_member lbSetColor[_id,[1,0.502,0,1]];
		} else {
			_listbox_member lbSetColor[_id,[0.004,0.875,0.004,1]];
		};

	} else {
		_listbox_member lbSetColor[_id,[1,0,0,1]];
	};

} foreach (valor_group select 1);

{
	_var = _x getVariable "Valor_group_id";
	if(isnil "_var") then {
		_id = _combo_players lbadd (name _x);
		_combo_players lbSetData[_id,getplayeruid _x];
	};
	_var = nil;
} foreach playableUnits;



