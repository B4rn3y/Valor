private ["_display","_pic_1","_pic_2","_check_pic","_accept_BTN","_accept_BTN2","_hint_BTN","_hint_BTN2","_story_structured","_aufgabe_an_sich"];

closeDialog 0;
if(!createDialog "accept_quest") exitWith {systemchat "Some Error creating Dialog"};

disableSerialization;
_display = findDisplay 3002;
_pic_1 = _display displayCtrl 1201;
_pic_2 = _display displayCtrl 1202;
_check_pic = _display displayctrl 1203;
_accept_BTN = _display displayctrl 1204;
_accept_BTN2 = _display displayCtrl 1904;
_hint_BTN = _display displayctrl 1205;
_hint_BTN2 = _display displayCtrl 1905;
_story_structured = _display displayCtrl 1100;
_aufgabe_an_sich = _display displayCtrl 1101;