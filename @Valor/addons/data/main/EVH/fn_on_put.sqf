
private ["_player","_container","_object","_var","_base_id","_gang_id","_config_id","_base_config","_stuff","_cargo","_arr_count_item","_classname","_amount_needed","_index","_txt","_all_items","_amount"];

_player = _this select 0;
_container = _this select 1;
_object = _this select 2;




_var = _container getvariable "valor_base_ids";

if(isnil "_var") exitWith {};

_base_id = _var select 0;
_gang_id = _var select 1;
_config_id = _var select 2;
_object_id = -1;
if (_base_id isequalto -1) exitWith {diag_log "Valor :: Var _base_id of a crate is nil"};

if(count _var > 3) then {
	_object_id = _var select 3;
};
if!(_object_id isEqualTo -1) exitWith {};

_base_config = [_config_id] call valor_fnc_base_config;




_stuff = _base_config select 2;

_cargo = getItemCargo _container;

_arr_count_item = [];


{
	_classname = _x select 0;
	_amount_needed = _x select 1;
	_index = (_cargo select 0) find _classname;
	if!(_index isEqualTo -1) then {
		_arr_count_item pushBackUnique [_classname,(_cargo select 1) select _index,_amount_needed];
	} else {
		_arr_count_item pushBackUnique [_classname,0,_amount_needed];
	};


} foreach _stuff;


_txt = "<t size='1.3' align='center' >Items:</t><br/>";
_all_items = true;;
{
	_classname = _x select 0;
	_amount = _x select 1;
	_amount_needed = _x select 2;
	if(_amount >= _amount_needed) then {
		_txt = _txt + format[" <t size='1.2' align='center' color='#1BB500'>%1 / %2 </t><img size='1.2' image='%3'/><t size='1.2' align='center' color='#1BB500'> %4</t><br/> ",_amount,_amount_needed,(getText (configFile >> 'CfgWeapons' >> _classname >> 'picture')),(getText (configFile >> 'CfgWeapons' >> _classname >> 'displayname'))];
	} else {
		_txt = _txt + format[" <t size='1.2' align='center' color='#A40303'>%1 / %2 </t><img size='1.2' image='%3'/><t size='1.2' align='center' color='#A40303'> %4</t><br/> ",_amount,_amount_needed,(getText (configFile >> 'CfgWeapons' >> _classname >> 'picture')),(getText (configFile >> 'CfgWeapons' >> _classname >> 'displayname'))];
		_all_items = false;
	};
} foreach _arr_count_item;

if(_all_items) then {
	[_container,_base_id,_config_id,_gang_id,player] remoteexec["valor_fnc_build_base",2];
	systemchat "Valor :: All items are available, sending build request to server";
};

hint parseText _txt;