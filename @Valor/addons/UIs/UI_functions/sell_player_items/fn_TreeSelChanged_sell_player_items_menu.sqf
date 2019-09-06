private ["_control","_selectionPath","_display","_str_text","_tv","_sell_btn","_classname","_price","_item_name","_item_pic"];


params ["_control", "_selectionPath"];

_display = findDisplay 3013;
if(isnull _display) exitWith {};
disableSerialization;

_str_text = _display displayCtrl 1100;
_tv = _display displayCtrl 1111;
_sell_btn = _display displayCtrl 2400;

_classname = _tv tvData _selectionPath;

if(91 in(toArray _classname)) then {

	_compiled_arr = call compile _classname;
	_classname = _compiled_arr select 0;
	_type = _compiled_arr select 1;

	if( (count _compiled_arr) > 2) then {
		_classname = "";
	};
};


if(_classname isEqualTo "") exitWith {};
_price = _tv tvValue _selectionPath;

_item_name = gettext(configfile >> ([_classname] call valor_fnc_getConfig) >> _classname >> "displayname");
_item_pic = gettext(configfile >> ([_classname] call valor_fnc_getConfig) >> _classname >> "picture");

if(_price isEqualTo -1) then {
	_sell_btn ctrlEnable false;
	_str_text ctrlSetStructuredText parseText format["<br/> <t align='center'><img size='5' image='%1'/></t><br/><t size='1.4' color='#FF8000' align='center'>Item:</t><br/><br/><t align='center'>%2</t><br/><br/><t size='1.4' color='#FF8000' align='center'>Sell Price:</t><br/><br/><t align='center'>%3</t>",_item_pic,_item_name,"Not sellable"];
} else {
	_sell_btn ctrlEnable true;
	_str_text ctrlSetStructuredText parseText format["<br/> <t align='center'><img size='5' image='%1'/></t><br/><t size='1.4' color='#FF8000' align='center'>Item:</t><br/><br/><t align='center'>%2</t><br/><br/><t size='1.4' color='#FF8000' align='center'>Sell Price:</t><br/><br/><t align='center'>$%3</t>",_item_pic,_item_name,_price];
};