private ["_classnames_and_prices","_id_classnames","_display","_header","_listbox","_classnames","_prices","_final_arr","_working","_vehiclename","_index"];

if(isnull(finddisplay 3003)) exitWith {};
_classnames_and_prices = param[0,[],[[]]];
_id_classnames = param[1,[],[[]]];
_seller = param[2,[],[[]]];

disableSerialization;
_display = findDisplay 3003;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;




_listbox lbSetColor[4,[0.016,0.706,0.016,1]];

_listbox lbSetColor[5,[1,0.502,0,1]];

if(_id_classnames isEqualTo []) exitWith {
	lbclear _listbox;
	_listbox lbAdd "There are no vehicles in stock...";
};

_classnames = [];
_prices = [];

{
	_classnames pushback ([_x select 0] call valor_fnc_mtoarray);
	_prices pushback (_x select 1);

} foreach _classnames_and_prices;


_final_arr = [];

{
	_working = [];
	_working pushback (_x select 0);
	_vehiclename = [_x select 1] call valor_fnc_mtoarray;
	_working pushback _vehiclename;
	_index = _classnames find _vehiclename;
	if!(_index isEqualTo -1) then {
		_working pushback (_prices select _index);
		_final_arr pushback _working;
	};

} foreach _id_classnames;

_listbox lbSetColor[5,[0.016,0.706,0.016,1]];
_listbox lbSetColor[6,[1,0.502,0,1]];

lbclear _listbox;

if(_final_arr isEqualTo []) exitWith {
	lbclear _listbox;
	_listbox lbAdd "There are no vehicles in stock...";
};

{
	_id = _listbox lbadd format["%1 - %2",([(_x select 2)] call valor_fnc_numbertext),getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")];
	_listbox lbSetValue[_id,_x select 0];
								// classname, price, pos, dir
	_listbox lbSetData[_id,str([_x select 1,_x select 2,_seller select 1,_seller select 2])];
} foreach _final_arr;

lbSort _listbox;

//_listbox ctrlAddEventHandler["LBSelChanged",valor_fnc_onLBChange];
_listbox lbsetcursel 0;
