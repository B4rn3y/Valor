


private ["_text","_silent","_time","_length_mult","_display","_TextField","_pic","_Header","_posText","_posPic","_textHigh","_activeNotifications","_ctrlPic","_ctrlText"];
_text = _this;
_silent = true;
_time = -1;
if!((typeName _this) isEqualTo "STRING") then {
	_text = param[0,"",[""]];
	_silent = param[1,true,[true]];
	_time = param[2,-1,[0]];
};
if(_text isEqualTo "") exitWith {};


_length_mult = 0.136;
if(isnil "valor_open_notifications") then {valor_open_notifications = []};



if!(_silent) then {
	playSound "HintExpand";
};


if(_time isEqualTo -1) then {
	_time = (count _text) * 0.136;
};

if (_text isEqualType "") then {
 _text = parseText _text;
};

disableSerialization;
_display = finddisplay 46;
_pic = _display ctrlCreate ["RscPicture", -1];
_TextField = _display ctrlCreate ["RscStructuredText", -1];
_TextField ctrlSetStructuredText parsetext format["<t color='#000000'>%1</t>",_text];
_TextField ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.321 * safezoneH + safezoneY,0.13 * safezoneW, 0.5];
_TextField ctrlCommit 0;
_TextField ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.321 * safezoneH + safezoneY,0.13 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_TextField ctrlSetBackgroundColor [0,0,0,0];
_TextField ctrlSetFade 1;
_TextField ctrlCommit 0;
_TextField ctrlSetFade 0;
_TextField ctrlCommit 0.4;


_pic ctrlSetText "UIs\textures\other\paper.jpg";
_pic ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.321 * safezoneH + safezoneY,0.13 * safezoneW, 0.5];
_pic ctrlCommit 0;
_pic ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.321 * safezoneH + safezoneY,0.13 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_pic ctrlSetBackgroundColor [0,0,0,0];
_pic ctrlSetFade 1;
_pic ctrlCommit 0;
_pic ctrlSetFade 0;
_pic ctrlCommit 0.4;


[_TextField,_pic,_time] spawn {
 disableSerialization;
 if((_this select 2) < 7) then {uisleep 7;} else {uisleep (_this select 2);};
 _TextField = _this select 0;
 _pic = _this select 1;
 _TextField ctrlSetFade 1;
 _TextField ctrlCommit 0.3;
 _pic ctrlSetFade 1;
 _pic ctrlCommit 0.3;
 uiSleep 0.3;
 ctrlDelete _pic;
 ctrlDelete _TextField;
};

_posText = (ctrlPosition (_TextField)) select 1;
_posPic = (ctrlPosition (_pic)) select 1;
_textHigh = (ctrlPosition (_TextField)) select 3;

if (count valor_open_notifications > 0) then {
	 _activeNotifications = 0;
	 {
		 _ctrlPic = _x select 0;
		 _ctrlText = _x select 1;
		 if (!isNull _ctrlPic && !isNull _ctrlText) then {
			 _ctrlPic ctrlSetPosition [0.005 * safezoneW + safezoneX, (_posPic + _textHigh + 1.5*(0.011 * safezoneH))];
			 _ctrlText ctrlSetPosition [0.005 * safezoneW + safezoneX, (_posText + _textHigh + 1.5*(0.011 * safezoneH))];
			 _ctrlPic ctrlCommit 0.25;
			 _ctrlText ctrlCommit 0.25;
			 _posText = (_posText + _textHigh + 1.5*(0.011 * safezoneH));
			 _posPic = (_posPic + _textHigh + 1.5*(0.011 * safezoneH));
			 _textHigh = (ctrlPosition (_ctrlText)) select 3;
			 if (_activeNotifications > 3) then {
				 _ctrlText ctrlSetFade 1;
				 _ctrlPic ctrlSetFade 1;
				 _ctrlText ctrlCommit 0.2;
				 _ctrlPic ctrlCommit 0.2;
			 };
			 _activeNotifications = _activeNotifications + 1;
		 };
	 } forEach valor_open_notifications;
};
valor_open_notifications = ([[_pic,_TextField]] + valor_open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};






