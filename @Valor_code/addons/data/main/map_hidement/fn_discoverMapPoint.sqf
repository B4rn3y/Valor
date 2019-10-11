
private ["_markerPOS","_markername","_count","_xp_add"];

_markerPOS = param[0,[],[[],""]];
_markername = param[1,"",[""]];
_count = param[2,0,[-1]];
if(_markerPOS isEqualTo []) exitWith {};
if(_markername isEqualTo "") exitWith {};




_markername setMarkerAlphaLocal 0;
if!(isnil "Valor_debug") then {
	Systemchat format["Neuen Bereich erforscht - Marker: %1",_markername];
};

_xp_add = getNumber(missionConfigFile >> "Valor_settings" >> "level_system" >> "map_point");
_xp_add = _xp_add * (missionNamespace getvariable["Valor_skill_Explorer",1]);
[_xp_add,"Map point discovered"] call valor_fnc_addexp;

deleteMarkerLocal _markername;

if(_count >= 3) then {
	[9] call valor_fnc_step_update;
};