
private ["_ui","_progressbar","_str_text_inside_progressbar","_lvl_display","_text_in_progressbar","_LVL_ANZEIGE"];

_ui = uiNamespace getVariable ["valor_HUD",displayNull];
if(isnull _ui) exitWith {};
_progressbar = _ui displayCtrl 1100;
_str_text_inside_progressbar = _ui displayCtrl 1099;
_lvl_display = _ui displayCtrl 1101;

_progressbar progressSetPosition (Valor_level_xp/Valor_xp_needed_level);
_str_text_inside_progressbar ctrlSetStructuredText parsetext format["<t size='1.0' align='center'>%1 / %2</t>",Valor_level_xp,Valor_xp_needed_level];
_lvl_display ctrlSetStructuredText parsetext format["<t size='0.9' align='center'>%1</t>",Valor_level];