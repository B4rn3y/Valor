_display_text = param[0,"",[""]];
disableSerialization;

_ui = uiNameSpace getVariable "Loading__Screen";
if(isnil "_ui") exitWith {};
_strTEXT = _ui displayCtrl 1110;
_strTEXT ctrlSetStructuredText parsetext _display_text;
