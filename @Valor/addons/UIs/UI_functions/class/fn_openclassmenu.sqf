private ["_display","_BTN_Unlock_class_1","_BTN_Unlock_class_2","_BTN_Unlock_class_3","_header_main_slots_class","_header_class_1","_header_class_2","_header_class_3","_current_classes_active_str_text","_container_main","_counter_controls","_classes","_find_class","_id_class","_ret","_btns_unlock_classes","_active_classes","_active","_foreachindex","_class_id","_class_name","_needed_level","_description_short","_description_long","_background","_container","_text_name_of_class","_text_class_short","_text_class_long","_btn","_text_level_needed","_class_1","_class_2","_class_3"];



createDialog "class_dialog";
disableSerialization;
_display = findDisplay 3010;
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


{
	_class_id = _x select 0;
	_class_name = _x select 1;
	_needed_level = _x select 2;
	_description_short = _x select 3;
	_description_long = _x select 4;

	_background = _display ctrlCreate ["valor_rsctext", _counter_controls, _container_main];
	_background ctrlSetPosition[0,((0.26835 * _foreachindex) + (0.0025 * _foreachindex)),0.785606,0.26835];
	_background ctrlSetBackgroundColor [0,0,0,0.7];
	_background ctrlCommit 0;
	_counter_controls = _counter_controls + 1;

	_container = _display ctrlCreate ["valor_RscControlsGroup", _counter_controls, _container_main];
	_container ctrlSetPosition[0,((0.26835 * _foreachindex) + (0.0025 * _foreachindex)),0.785606,0.26835];
	//_container ctrlSetBackgroundColor [0,0,0,0.7];
	//_container ctrlSetBackgroundColor [1,0,1,1];
	_container ctrlCommit 0;
	_counter_controls = _counter_controls + 1;

	_text_name_of_class = _display ctrlCreate["valor_RscStructuredText",_counter_controls,_container];
	_text_name_of_class ctrlSetStructuredText parsetext _class_name;
	_text_name_of_class ctrlSetPosition[0,0,0.165657,0.0646464];
	//_text_name_of_class ctrlSetBackgroundColor [1,0,1,1];
	_text_name_of_class ctrlCommit 0;
	_counter_controls = _counter_controls + 1;

	_text_class_short = _display ctrlCreate["valor_RscStructuredText",_counter_controls,_container];
	_text_class_short ctrlSetStructuredText parsetext _description_short;
	_text_class_short ctrlSetPosition[0.284808,0,0.490151,0.0646464];
	//_text_class_short ctrlSetBackgroundColor [1,0,1,1];
	_text_class_short ctrlCommit 0;
	_counter_controls = _counter_controls + 1;

	_text_class_long = _display ctrlCreate["valor_RscStructuredText",_counter_controls,_container];
	_text_class_long ctrlSetStructuredText parsetext _description_long;
	_text_class_long ctrlSetPosition[0,0.0686464,0.774242,0.190909];
	//_text_class_long ctrlSetBackgroundColor [1,0,1,1];
	_text_class_long ctrlCommit 0;
	_counter_controls = _counter_controls + 1;

	_btn = _display ctrlCreate["valor_RscButtonMenu",_counter_controls,_container];
	_btn ctrlSetPosition[0.167657,0,0.115151,0.0646464];
	//_btn ctrlSetBackgroundColor [1,0,1,1];
	_btn ctrlCommit 0;
	_counter_controls = _counter_controls + 1;


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

			_text_level_needed = _display ctrlCreate["valor_RscStructuredText",_counter_controls,_container_main];
			_text_level_needed ctrlSetStructuredText parsetext format["<br/><br/><t font='PuristaMedium' align='center'>LEVEL %1 REQUIRED!</t>",_needed_level];
			_text_level_needed ctrlSetBackgroundColor[0,0,0,0.7];
			_text_level_needed ctrlSetPosition[0,((0.26835 * _foreachindex) + (0.0025 * _foreachindex)),0.785606,0.26835];
			_text_level_needed ctrlCommit 0;
			_counter_controls = _counter_controls + 1;
		};

		default
		{
			_btn ctrlSetText "LEARN";
			_btn buttonSetAction format["[%1,false] call valor_fnc_selectClass;",_class_id];
		};
	};

} foreach _classes;



_header_main_slots_class ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Available Class Slots:</t> "];

_header_class_1 ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Class Slot 1:</t> "];
_header_class_2 ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Class Slot 2:</t> "];
_header_class_3 ctrlSetStructuredText parseText format[" <t align='center' size='0.7' >Class Slot 3:</t> "];

_class_1 = if((Valor_classes_unlock select 0) select 0) then {if(((Valor_classes_unlock select 0) select 1) isEqualTo -1) then {"Empty"} else {([((Valor_classes_unlock select 0) select 1)] call _find_class) select 1};} else {"Not Learned"};
_class_2 = if((Valor_classes_unlock select 1) select 0) then {if(((Valor_classes_unlock select 1) select 1) isEqualTo -1) then {"Empty"} else {([((Valor_classes_unlock select 1) select 1)] call _find_class) select 1};} else {"Not Learned"};
_class_3 = if((Valor_classes_unlock select 2) select 0) then {if(((Valor_classes_unlock select 2) select 1) isEqualTo -1) then {"Empty"} else {([((Valor_classes_unlock select 2) select 1)] call _find_class) select 1};} else {"Not Learned"};

_current_classes_active_str_text ctrlSetStructuredText parsetext format["<t align='center' size='0.7' >INFO:</t><br/><t align='left' size='0.7' >Slot 1:</t><t align='right' size='0.7' >%1</t><br/><t align='left' size='0.7' >Slot 2:</t><t align='right' size='0.7' >%2</t><br/><t align='left' size='0.7' >Slot 3:</t><t align='right' size='0.7' >%3</t><br/>",_class_1,_class_2,_class_3];
