private ["_config_id","_layout_id","_container","_conf","_mat_names","_mat_amount","_text","_show_text","_weapons","_magazines","_backpacks","_items","_allNames","_allAmounts","_item_show","_index","_foreachindex","_classname","_actual_amount","_amount_needed"];

_base_id = param[0,-1,[0]];
_config_id = param[1,-1,[0]];
_layout_id = param[2,-1,[0]];
_container = param[3,objNull,[objNull]];

if(_config_id isEqualTo -1) exitWith {};
if(_layout_id isEqualTo -1) exitWith {};
if(_base_id isEqualTo -1) exitWith {};
if(isnull _container) exitWith {};


_conf = [_config_id,(_layout_id + 1)] call valor_fnc_base_config;

if(_conf isEqualTo []) exitWith {};


_mat_names = [];
_mat_amount = [];


{
	_mat_names pushBack (_x select 0);
	_mat_amount pushBack (_x select 1);
} foreach (_conf select 1);



_text = (findDisplay 46) ctrlCreate ["RscStructuredText", -1];
_text ctrlSetPosition [0.683614 * safezoneW + safezoneX,0.47668 * safezoneH + safezoneY,0.225859 * safezoneW,0.477222 * safezoneH];
_text ctrlCommit 0;
_show_text = "";
_send = false;
while {dialog} do
{
	if(isnull _container) exitWith {};
	_show_text = "";
	_all = true;
	_weapons = getWeaponCargo _container;
	_magazines = getMagazineCargo _container;
	_backpacks = getBackpackCargo _container;
	_items = getItemCargo _container;
	if(isnull _container) exitWith {};
	_allNames = [];
	_allAmounts = [];

	_allNames append (_weapons select 0);
	_allNames append (_magazines select 0);
	_allNames append (_backpacks select 0);
	_allNames append (_items select 0);

	_allAmounts append (_weapons select 1);
	_allAmounts append (_magazines select 1);
	_allAmounts append (_backpacks select 1);
	_allAmounts append (_items select 1);

	_item_show = [];
	{
		_index = _allNames find _x;
		if!(_index isEqualTo -1) then {
			_item_show pushBack [_x,_allAmounts select _index,_mat_amount select _foreachindex];
		} else {
			_item_show pushBack [_x,0,_mat_amount select _foreachindex];
		};
	} foreach _mat_names;
	{
		_classname = _x select 0;
		_actual_amount = _x select 1;
		_amount_needed = _x select 2;
		if(_actual_amount >= _amount_needed) then {
			_show_text = _show_text + format["<t size='1' color='#36FF00'>[%1,%2] - %3</t><br/>",_amount_needed,_actual_amount,gettext(configfile >> ([_classname] call valor_fnc_getconfig) >> _classname >> "displayname")];
		} else {
			_all = false;
			_show_text = _show_text + format["<t size='1' color='#FF0000'>[%1,%2] - %3</t><br/>",_amount_needed,_actual_amount,gettext(configfile >> ([_classname] call valor_fnc_getconfig) >> _classname >> "displayname")];
		};
	} foreach _item_show;

	_text ctrlSetStructuredText parseText _show_text;

	if(!_send && _all) then {
		_send = true;
		[[_base_id,_config_id,_layout_id,_container],"valor_fnc_upgrade_base",2] call valor_fnc_remoteexec;
	};


	sleep 1;
};


ctrlDelete _text;
