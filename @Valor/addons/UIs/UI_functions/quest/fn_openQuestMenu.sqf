
private ["_NPC","_quest_queue_NPC","_current_quest","_highest_quest_done","_quest_not_done","_Quest_Queue","_Quest_ID","_done","_quest_done","_highest_quest_exists","_display","_pic_1","_pic_2","_check_pic","_accept_BTN","_accept_BTN2","_hint_BTN","_hint_BTN2","_story_structured","_aufgabe_an_sich"];
_NPC = param[0,Objnull,[objNull]];
_quest_queue_NPC = _NPC getvariable["Quest_Queue",-1];
if(_quest_queue_NPC isEqualTo -1) exitWith {hint "ERROR: No Quest Queue ID"};
closeDialog 0;
_current_quest = [];
_highest_quest_done = -1;
_quest_not_done = -1;
{
	if!(_quest_not_done isEqualTo -1) exitWith {};
	_Quest_Queue = _x select 0;
	_Quest_ID = _x select 1;
	_done = _x select 2;
	if(_Quest_Queue isEqualTo _quest_queue_NPC) then {
		if!(_done) then {_quest_not_done = _Quest_ID;};
		if(_Quest_ID > _highest_quest_done && _done) then {
			_highest_quest_done = _Quest_ID;
		};
	};

} foreach Valor_completed_quests;

_quest_done = false;

if!(_quest_not_done isEqualTo -1) then {
	{
		iF((_x select 0) isEqualTo _quest_queue_NPC && (_x select 1) isEqualTo _quest_not_done) exitWith {
			if(call compile (_x select 5)) then {
				_quest_done = true;
				call compile (_x select 6);
				systemchat (_x select 9);
				_where = Valor_completed_quests find [_quest_queue_NPC,_quest_not_done,false];
				Valor_completed_quests set [_where,[_quest_queue_NPC,_quest_not_done,true]];
				[10] call valor_fnc_step_update;

			};
		};

	} foreach (getarray (configfile >> "Quest_config" >> "Quests" >> "The_quests"));



};

if(_quest_done) exitWith {};











_highest_quest_exists = -1;
{
	_Quest_Queue = _x select 0;
	_Quest_ID = _x select 1;
	if(_Quest_Queue isEqualTo _quest_queue_NPC) then {
		if(_Quest_ID > _highest_quest_exists) then {
			_highest_quest_exists = _Quest_ID;
		};
		if(_Quest_ID isEqualTo (_highest_quest_done + 1)) then {
			_current_quest = _x;
		};
	};

} foreach (getarray (configfile >> "Quest_config" >> "Quests" >> "The_quests"));

if(_highest_quest_exists <= _highest_quest_done) exitWith {Systemchat "You have done all Quests i got for you";};


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


_story_structured ctrlSetStructuredText parsetext format["<t size='1.2' color = '#000000' align='center'>%1</t><br/><t color='#000000'>%2</t>",(_current_quest select 2),(_current_quest select 3)];

_aufgabe_an_sich ctrlSetStructuredText parsetext format["<t color='#000000'>%1</t>",(_current_quest select 4)];

_pic_1 ctrlsettext (_current_quest select 7);
_pic_2 ctrlsettext (_current_quest select 8);

if(_quest_not_done isEqualTo -1) then {
	_accept_BTN2 buttonSetAction format["[%1,%2] call valor_fnc_acceptQuest",(_current_quest select 0),(_current_quest select 1)];
} else {
	_accept_BTN2 buttonSetAction "systemchat ""You already accepted this quest!""";
};

_hint_BTN2 ctrlenable false;
_hint_BTN2 ctrlshow false;
_hint_BTN ctrlshow false;





