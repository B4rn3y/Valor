
private ["_display","_BTN_Unlock_class_1","_BTN_Unlock_class_2","_BTN_Unlock_class_3","_header_main_slots_class","_header_class_1","_header_class_2","_header_class_3","_current_classes_active_str_text","_container_main","_counter_controls","_classes","_find_class","_id_class","_ret","_find_class_to_name","_name_class","_btns_unlock_classes","_active_classes","_active","_foreachindex","_allcontrols","_btn","_classname","_class_name","_class_data","_class_id","_needed_level"];
_display = findDisplay 3010;
if(isnull _display) exitWith {};
disableSerialization;
_BTN_Unlock_class_1 = _display displayCtrl 2400;
_BTN_Unlock_class_2 = _display displayCtrl 2401;
_BTN_Unlock_class_3 = _display displayCtrl 2402;

_header_main_slots_class = _display displayCtrl 1100;
_header_class_1 = _display displayCtrl 1101;
_header_class_2 = _display displayCtrl 1102;
_header_class_3 = _display displayCtrl 1103;

_current_classes_active_str_text = _display displayCtrl 1104;

_container_main = _display displayCtrl 1499;

_counter_controls = 0;

_classes = getArray(missionConfigFile >> "Valor_settings" >> "classes" >> "classes_available");
if(_classes isEqualTo []) exitWith {closeDialog 0;};

_find_class =
{
	_id_class = param[0,-1,[0]];
	_ret = [];
	{
		if((_x select 0)isEqualTo _id_class) exitWith {_ret = _x;};
	} foreach _classes;
	_ret
};

_find_class_to_name =
{
	_name_class = param[0,"",[""]];
	_ret = [];
	{
		_name = _x select 1;
		if(_name isEqualTo _name_class) exitWith {_ret = _x;};
	} foreach _classes;
	_ret
};

_btns_unlock_classes = [_BTN_Unlock_class_1,_BTN_Unlock_class_2,_BTN_Unlock_class_3];
_active_classes = [];
{
	_active = _x select 0;
	_id = _x select 1;
	if(_active) then {
		if!(_id isEqualTo -1) then {
			_active_classes pushBackUnique _id;
			(_btns_unlock_classes select _foreachindex) ctrlSetText (([_id] call _find_class) select 1);
			(_btns_unlock_classes select _foreachindex) buttonSetAction "";
		} else {
			(_btns_unlock_classes select _foreachindex) ctrlSetText "EMPTY";
			(_btns_unlock_classes select _foreachindex) buttonSetAction "";
		};
	} else {
		(_btns_unlock_classes select _foreachindex) ctrlSetText "UNLOCK";
		(_btns_unlock_classes select _foreachindex) buttonSetAction format["[%1] call valor_fnc_unlockClassSlot;",_foreachindex];
	};
} foreach Valor_classes_unlock;



_allcontrols = allControls _display - _btns_unlock_classes;

{
	_btn = _x;
	_classname = ctrlClassName _btn;
	if(_classname isEqualTo "valor_RscButtonMenu" && (ctrlText _btn) in ["REMOVE","LEARN"]) then {
		_class_name = ctrltext(_display displayCtrl ((ctrlidc _btn)-3));
		_class_data = [_class_name] call _find_class_to_name;
		_class_id = _class_data select 0;
		_needed_level = _class_data select 2;

		switch (true) do
		{
			case (_class_id in _active_classes):
			{
				_btn ctrlSetText "Remove";
				_btn buttonSetAction format["[%1,true] call valor_fnc_selectClass;",_class_id];
			};

			case (_needed_level > Valor_level):
			{
				_btn ctrlSetText "LEARN";
				_btn ctrlEnable false;
			};

			default
			{
				_btn ctrlSetText "LEARN";
				_btn buttonSetAction format["[%1,false] call valor_fnc_selectClass;",_class_id];
			};
		};

	};
} foreach _allcontrols;

_header_main_slots_class ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Available Class Slots:</t> "];

_header_class_1 ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Class Slot 1:</t> "];
_header_class_2 ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Class Slot 2:</t> "];
_header_class_3 ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Class Slot 3:</t> "];

_class_1 = if((Valor_classes_unlock select 0) select 0) then {if(((Valor_classes_unlock select 0) select 1) isEqualTo -1) then {"Empty"} else {([((Valor_classes_unlock select 0) select 1)] call _find_class) select 1};} else {"Not Learned"};
_class_2 = if((Valor_classes_unlock select 1) select 0) then {if(((Valor_classes_unlock select 1) select 1) isEqualTo -1) then {"Empty"} else {([((Valor_classes_unlock select 1) select 1)] call _find_class) select 1};} else {"Not Learned"};
_class_3 = if((Valor_classes_unlock select 2) select 0) then {if(((Valor_classes_unlock select 2) select 1) isEqualTo -1) then {"Empty"} else {([((Valor_classes_unlock select 2) select 1)] call _find_class) select 1};} else {"Not Learned"};

_current_classes_active_str_text ctrlSetStructuredText parsetext format["<t align='center' size='0.7' >INFO:</t><br/><t align='left' size='0.7' >Slot 1:</t><t align='right' size='0.7' >%1</t><br/><t align='left' size='0.7' >Slot 2:</t><t align='right' size='0.7' >%2</t><br/><t align='left' size='0.7' >Slot 3:</t><t align='right' size='0.7' >%3</t><br/><br/><t size='0.7' >Classes can only be changed/unlocked in a city!</t>",_class_1,_class_2,_class_3];


