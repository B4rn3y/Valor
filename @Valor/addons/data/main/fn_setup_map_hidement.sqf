
private ["_type","_color","_markerBrush","_size","_first_pos_unten_links","_last_pos_oben_rechts","_first_x_pos","_first_y_pos","_last_x_pos","_last_y_pos","_rowcounter","_counter","_done","_1st_Marker","_pos_y","_pos_x","_pos_y_plus","_mk"];

_type = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_TYPE");
_color = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_COLOR");
_markerBrush = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_BRUSH");
_size = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_SIZE");
_first_pos_unten_links  =  getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_bottom_left");
_last_pos_oben_rechts = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_top_right");

_first_x_pos = _first_pos_unten_links select 0;
_first_y_pos = _first_pos_unten_links select 1;


_last_x_pos = _last_pos_oben_rechts select 0;
_last_y_pos = _last_pos_oben_rechts select 1;

_rowcounter = 0;
_counter = 0;
_done = false;

_1st_Marker = createMarkerLocal[format["MapHideMarker%1",_counter],[_first_x_pos,_first_y_pos]];
_1st_Marker  setMarkerShapeLocal _type;
_1st_Marker setMarkerColorLocal _color;
_1st_Marker setMarkersizeLocal _size;
_1st_Marker setMarkerBrushLocal _markerBrush;

profileNamespace setvariable[format["%1%2",((mapGridPosition ([_first_x_pos,_first_y_pos])) select [0,2]),(((mapGridPosition ([_first_x_pos,_first_y_pos])) select [3,5]) select[0,2])],_1st_Marker];

while {true} do
{
	_counter = _counter + 1;
	_pos_y = (getmarkerpos (format["MapHideMarker%1",(_counter - 1)]) select 1);
	_pos_x = (getmarkerpos (format["MapHideMarker%1",(_counter - 1)]) select 0);
	_pos_y_plus = (getmarkerpos (format["MapHideMarker%1",(_counter - 1)]) select 1) + 1000;

	if(_last_y_pos < _pos_y_plus) then {
		_rowcounter = _rowcounter + 1;
		_pos_y_plus = _first_y_pos;
		_pos_x = _first_x_pos + (_rowcounter * 1000);
		if(_pos_x > _last_x_pos) then {_done = true;};
	};
	if(_done) exitWith {if!(isnil "Valor_debug") then {systemchat format["Alle marker erstellt - %1 Marker",_counter + 1]};};

	_mk = createMarkerLocal[format["MapHideMarker%1",_counter],[_pos_x,_pos_y_plus]];
	_mk setMarkerShapeLocal _type;
	_mk setMarkerColorLocal _color;
	_mk setMarkersizeLocal _size;
	_mk setMarkerBrushLocal _markerBrush;

	profileNamespace setvariable[format["%1%2",((mapGridPosition ([_pos_x,_pos_y_plus])) select [0,2]),(((mapGridPosition ([_pos_x,_pos_y_plus])) select [3,5]) select[0,2])],_mk];

};