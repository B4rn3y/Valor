/*
	File: fn_sirenLights.sqf
	Author: Blackd0g

	Description:
	checks and enables vehicle lights
*/


_vehicle = param [0,ObjNull,[ObjNull]];


if(isNull _vehicle) exitWith {}; //Bad entry!

_classname = typeof _vehicle;
if!(_classname isKindOf "Landvehicle" || _classname isKindOf "Air" || _classname isKindOf "Ship") exitWith {};

_classname_attach_object = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "classname_siren");
if(_classname_attach_object isEqualTo "") exitWith {};

_siren_on = false;
_siren = ObjNull;
{
	if((typeof _x) isEqualTo _classname_attach_object) exitWith {_siren_on = true;_siren = _x;};
} foreach (attachedObjects _vehicle);

if(!_siren_on) exitWith {};

_lightpos = [getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "siren_attach_pos_left"),getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "siren_attach_pos_right")];
_lightposleft = _lightpos select 0;
_lightposright = _lightpos select 1;
_lightcolor = [getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "siren_color_left"),getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "siren_color_right")];
_lightcolorleft = _lightcolor select 0;
_lightcolorright = _lightcolor select 1;




if(_vehicle getVariable["lights",false]) then {
	_vehicle setVariable["lights",nil,true];
	titleText ["Warninglight off","PLAIN DOWN"];
} else {
	_vehicle setVariable["lights",true,true];
	titleText ["Warninglight on","PLAIN DOWN"];
	[_vehicle,_lightpos,_lightcolor,_siren] remoteExec["valor_Fnc_sirenLightsEx",-2];
};