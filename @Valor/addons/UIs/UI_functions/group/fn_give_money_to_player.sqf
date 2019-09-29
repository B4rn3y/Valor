private ["_display","_combo_players_money","_edit_give_money","_sel","_rank","_pid_tofind","_OBJ_player","_amount_give"];


_display = findDisplay 3004;
if(isnull _display) exitWith {};
_combo_players_money = _display displayCtrl 2102;
_edit_give_money = _display displayCtrl 1401;
_sel = lbCurSel _combo_players_money;
if(isnil "Valor_cash") exitWith {};
if(_sel isEqualTo -1) exitWith {["Valor :: You havent selected anyone"] spawn valor_Fnc_exp_hint};


_pid_tofind = _combo_players_money lbData _sel;
if(_pid_tofind isEqualTo "") exitWith {diag_log "Valor :: No Pid"};
if(_pid_tofind isEqualTo getplayeruid player) exitWith { ["Valor :: Thats u, u ****!"] spawn valor_Fnc_exp_hint;};


_OBJ_player = [_pid_tofind] call valor_fnc_findPlayerToUID;

if(isnull _OBJ_player) exitWith {};


_amount_give = parsenumber (ctrlText _edit_give_money);
iF(_amount_give isEqualTo 0) exitWith {["You have to enter a amount of money to give"] spawn valor_fnc_exp_hint;};


if((Valor_cash - _amount_give) < 0) exitWith {["You dont have enough money on you."] spawn valor_fnc_exp_hint;};

Valor_cash = Valor_cash - _amount_give;


[1] call valor_fnc_step_update;


[_amount_give,profileName,0] remoteExec["valor_fnc_get_money",_OBJ_player];
