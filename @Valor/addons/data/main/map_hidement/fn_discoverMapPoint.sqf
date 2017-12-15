private ["_markerPOS","_markername"];

_markerPOS = param[0,[],[[],""]];
_markername = param[1,"",[""]];
if(_markerPOS isEqualTo []) exitWith {};
if(_markername isEqualTo "") exitWith {};



_markername setMarkerAlphaLocal 0;
if!(isnil "Valor_debug") then {
	Systemchat format["Neuen Bereich erforscht - Marker: %1",_markername];
};

deleteMarkerLocal _markername;

[9] call valor_fnc_step_update;