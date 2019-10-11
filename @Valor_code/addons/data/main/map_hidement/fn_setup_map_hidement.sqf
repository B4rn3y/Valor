0 spawn {
	private ["_type","_color","_markerBrush","_size","_first_pos_unten_links","_last_pos_oben_rechts","_count","_last","_Marker","_foreachindex"];

	_type = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_TYPE");
	_color = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_COLOR");
	_markerBrush = gettext(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_BRUSH");
	_size = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_MARKER_SIZE");
	_first_pos_unten_links  =  getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_bottom_left");
	_last_pos_oben_rechts = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_top_right");

	//_first_pos_unten_links =  [500,-140];
	//_last_pos_oben_rechts = [15500,14860];


	_count = count Valor_map;
	_last = false;
	{

		_Marker = createMarkerLocal[format["%1Hide%2",(mapGridPosition _x select[0,2]),(((mapGridPosition _x) select[3,4]) select[0,2]),_foreachindex],[(_x select 0),(_x select 1)]];
		waitUntil {sleep 0.02;!isnil "_Marker"};
		if((_foreachindex + 1) isEqualTo _count) then {_last = true;};
		[_Marker,_type,_color,_markerBrush,_size,_last] spawn {	sleep 1;
						(_this select 0)  setMarkerShapeLocal (_this select 1);
						(_this select 0) setMarkerColorLocal (_this select 2);
						(_this select 0) setMarkersizeLocal (_this select 4);
						(_this select 0) setMarkerBrushLocal (_this select 3);
						(_this select 0) setMarkerAlphaLocal 1;
						if(_this select 5) then {
							VALOR_MAP_HIDEMENT_DONE = true;
							sleep 20;
							VALOR_MAP_HIDEMENT_DONE = nil;
						};
					};

		_Marker = nil;



	} foreach Valor_map;

	if(Valor_map isEqualTo []) then {
		VALOR_MAP_HIDEMENT_DONE = true;
		sleep 20;
		VALOR_MAP_HIDEMENT_DONE = nil;
	};

};

