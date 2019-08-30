_display_text = param[0,"",[""]];
disableSerialization;

_ui = uiNamespace getVariable["valor_screen",displayNull];
if(isnull _ui) exitWith {};
_strTEXT = _ui displayCtrl 1100;
_strTEXT ctrlSetStructuredText parsetext _display_text;
