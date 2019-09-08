
private ["_display","_listbox","_edit","_cop","_my_vehicles","_cities","_markerpos","_max_distance","_distance","_var","_X"];

createDialog "key_menu";

_display = findDisplay 3015;
if(isnull _display) exitWith {};

_listbox = _display displayCtrl 1500;
_edit = _display displayCtrl 1400;
_cop = if((call valor_coplevel) > 0) then {true} else {false};
_my_vehicles = [];
_cities = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "cities");
{
	_markerpos = getmarkerpos (_x select 0);
	_max_distance = _x select 1;
	{
		_distance = _x distance _markerpos;
		_var = _x getVariable["owners",[]];
		if(!(_var isEqualTo []) && _distance > _max_distance) then {
			_x lock 0;
			_x setvariable["owners",nil,true];
			_x setVariable["update_this",true,true];
		} else {

			if((getPlayerUID player) in _var) then {
				_my_vehicles pushBackUnique _x;
			};
			if(_cop) then {
				if("COP" in _var) then {
					_my_vehicles pushBackUnique _x;
				};
			};

		};
	} foreach (allMissionObjects "LandVehicle" + allMissionObjects "Air" + allMissionObjects "Ship");
} foreach _cities;


{
	_id = _listbox lbadd format["%1(%2m)",getText(configFile >> "CfgVehicles" >> (typeof _X) >> "displayname"),(player distance _x)];
	_listbox lbSetData[_id,netid _x];
	_listbox lbSetPicture[_id,getText(configFile >> "CfgVehicles" >> (typeof _X) >> "picture")];
} foreach _my_vehicles;


{
	_id = _edit lbadd format["%1",name _x];
	_edit lbSetData[_id,getplayeruid _x];
} foreach (((nearestObjects[player,["Man"],20]) select {isplayer _x})-[player]);