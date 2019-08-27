
private ["_XP","_description","_xp_info","_xp_save_amount","_text","_display","_TextField","_posText","_textHigh","_activeNotifications","_ctrlText"];

_XP = param[0,0,[0]];
_description = param[1,"",[""]];

if!(isnil "Valor_XP_multiplier") then {
	_XP = _XP * Valor_XP_multiplier;
};


if(_description isEqualTo "" || _XP isEqualTo 0) exitWith {};
_XP = _XP * (missionNamespace getvariable["Valor_skill_II",1]);
_XP = round _XP;

if(_XP >= Valor_xp_next_level) then {
	Valor_XP = Valor_XP + _XP;
	_xp_info = [Valor_XP] call valor_fnc_init_level;
	Valor_level = _xp_info select 0;
	Valor_level_xp = _xp_info select 1;
	Valor_xp_next_level = _xp_info select 2;
	Valor_xp_needed_level = _xp_info select 3;
	playSound "achievement";
	[11] call valor_fnc_step_update;
	0 spawn valor_fnc_init_skills;  // update the skills
} else {
	Valor_XP = Valor_XP + _XP;
	Valor_level_xp = Valor_level_xp + _XP;
	Valor_xp_next_level = Valor_xp_next_level - _XP;
	if(isnil "Valor_xp_save") then {
		Valor_xp_save = _XP
	} else {
		_xp_save_amount = 300;
		Valor_xp_save = Valor_xp_save + _XP;
		if(Valor_xp_save >= _xp_save_amount) then {
			[11] call valor_fnc_step_update;
			Valor_xp_save = 0;
		};
	};
};





if(isnil "VALOR_XP_INFO") then {VALOR_XP_INFO = [];};



_text = parsetext format["<t align='left' color='#00FF00'>+%1xp</t><t align='left'> - %2</t>",_XP,_description];


disableSerialization;
_display = finddisplay 46;
private _TextField = _display ctrlCreate ["RscStructuredText", -1];
_TextField ctrlSetStructuredText _text;
_TextField ctrlSetPosition [0.821338 * safezoneW + safezoneX,0.65554 * safezoneH + safezoneY,0.171875 * safezoneW,0.0244444 * safezoneH];
_TextField ctrlCommit 0;
_TextField ctrlSetPosition [0.821338 * safezoneW + safezoneX,0.65554 * safezoneH + safezoneY,0.171875 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_TextField ctrlCommit 0;
[_TextField] spawn {
	disableSerialization;
	uisleep 3;
	(_this select 0) ctrlsetfade 1;
	(_this select 0) ctrlCommit 1;
	uisleep 1;
	ctrlDelete (_this select 0);


};
private _posText = (ctrlPosition (_TextField)) select 1;
private _textHigh = (ctrlPosition (_TextField)) select 3;

if (count VALOR_XP_INFO > 0) then {
 private _activeNotifications = 0;
 {

	 private _ctrlText = _x select 0;
	 if (!isNull _ctrlText) then {
		 _ctrlText ctrlSetPosition [0.821338 * safezoneW + safezoneX, (_posText + _textHigh - 0.25*(0.011 * safezoneH))];
		 _ctrlText ctrlCommit 0.25;
		 _posText = (_posText + _textHigh - 0.25*(0.011 * safezoneH));
		 _textHigh = (ctrlPosition (_ctrlText)) select 3;
	 if (_activeNotifications > 8) then {
		 _ctrlText ctrlSetFade 1;
		 _ctrlText ctrlCommit 0.2;
	 };
	 	_activeNotifications = _activeNotifications + 1;
	 };
 } forEach VALOR_XP_INFO;
};
VALOR_XP_INFO = ([[_TextField]] + VALOR_XP_INFO) select {!isNull (_x select 0)};