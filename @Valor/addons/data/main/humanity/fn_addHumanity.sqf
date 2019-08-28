private ["_humanity","_description","_humanity_save_amount","_humanity_config","_humanity_border_B3","_humanity_border_B2","_humanity_border_B1","_humanity_border_SU","_humanity_border_H1","_humanity_border_H2","_humanity_border_H3","_current_role","_new_role","_str_text","_pic","_role","_text","_display","_TextField","_posText","_textHigh","_activeNotifications","_ctrlText"];


_humanity = param[0,0,[0]];
_description = param[1,"",[""]];

if!(isnil "Valor__humanity_multiplier") then {
	_humanity = _humanity * Valor__humanity_multiplier;
};


if(_description isEqualTo "" || _humanity isEqualTo 0) exitWith {};
_humanity = round _humanity;

_humanity_save_add = _humanity;
if(_humanity_save_add < 0) then {
	_humanity_save_add = _humanity_save_add * -1;
};
if(isnil "Valor_Humanity_save") then {
	Valor_Humanity_save = _humanity_save_add
} else {
	_humanity_save_amount = 200;
	Valor_Humanity_save = Valor_Humanity_save + _humanity_save_add;
	if(Valor_Humanity_save >= _humanity_save_amount) then {
		[13] call valor_fnc_step_update;
		Valor_Humanity_save = 0;
	};
};





_humanity_config = getArray(missionConfigFile >> "Valor_settings" >> "humanity" >> "humanity_config");

_humanity_border_B3 = _humanity_config select 0;
_humanity_border_B2 = _humanity_config select 1;
_humanity_border_B1 = _humanity_config select 2;
_humanity_border_SU = _humanity_config select 3;
_humanity_border_H1 = _humanity_config select 4;
_humanity_border_H2 = _humanity_config select 5;
_humanity_border_H3 = _humanity_config select 6;



_current_role = switch (true) do
{
	case (Valor_humanity <= _humanity_border_B3):
	{
		"bandit_3"
	};

	case (Valor_humanity <= _humanity_border_B2):
	{
		"bandit_2"
	};

	case (Valor_humanity <= _humanity_border_B1):
	{
		"bandit_1"
	};

	case (Valor_humanity < _humanity_border_H1):
	{
		"survivor"
	};

	case (Valor_humanity < _humanity_border_H2):
	{
		"hero_1"
	};

	case (Valor_humanity < _humanity_border_H3):
	{
		"hero_2"
	};

	case (Valor_humanity >= _humanity_border_H3):
	{
		"hero_3"
	};
};

Valor_humanity = Valor_humanity + (_humanity);

_new_role = switch (true) do
{
	case (Valor_humanity <= _humanity_border_B3):
	{
		"bandit_3"
	};

	case (Valor_humanity <= _humanity_border_B2):
	{
		"bandit_2"
	};

	case (Valor_humanity <= _humanity_border_B1):
	{
		"bandit_1"
	};

	case (Valor_humanity < _humanity_border_H1):
	{
		"survivor"
	};

	case (Valor_humanity < _humanity_border_H2):
	{
		"hero_1"
	};

	case (Valor_humanity < _humanity_border_H3):
	{
		"hero_2"
	};

	case (Valor_humanity >= _humanity_border_H3):
	{
		"hero_3"
	};
};

if!(_current_role isEqualTo _new_role) then {
	_new_role spawn {
		disableSerialization;
		_str_text = (findDisplay 46) ctrlCreate["RscStructuredText",-1];
		_pic = (findDisplay 46) ctrlCreate["RscPicture",-1];
		_pic ctrlSetText format["\UIs\textures\humanity\humanity_%1.paa",_this];
		_str_text ctrlSetStructuredText parseText "<t color='#000000' size='2.0' align='center'>Your new Status</t>";
		_pic ctrlsetfade 1;
		_str_text ctrlSetFade 1;
		_pic ctrlSetPosition [0.237543,-0.249133,0.528939,0.642997];
		_str_text ctrlSetPosition [0.260101,-0.367003,0.488889,0.118518];
		_pic ctrlCommit 0;
		_str_text ctrlCommit 0;
		playSound "achievement";

		_pic ctrlsetfade 0;
		_str_text ctrlSetFade 0;
		_pic ctrlCommit 3;
		_str_text ctrlCommit 3;

		sleep 10;
		ctrlDelete _str_text;
		ctrlDelete _pic;
	};

};


if(isnil "VALOR_XP_INFO") then {VALOR_XP_INFO = [];};


if(_humanity > 0) then {
	_text = parsetext format["<t align='left' color='#00FF00'>+%1hm</t><t align='left'> - %2</t>",_humanity,_description];
} else {
	_text = parsetext format["<t align='left' color='#CA0000'>%1hm</t><t align='left'> - %2</t>",_humanity,_description];
};


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