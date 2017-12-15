



private ["_first_pos_unten_links","_last_pos_oben_rechts","_arr","_last_pos","_new_pos"];
_first_pos_unten_links  =  getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_bottom_left");
_last_pos_oben_rechts = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "map_hidement_top_right");
//_first_pos_unten_links =  [500,-140];
//_last_pos_oben_rechts = [15500,14860];
_arr = [];

_arr pushBack _first_pos_unten_links;

_last_pos = _first_pos_unten_links;
_done = false;
while {true} do
{
	if!(((_last_pos select 1) + 1000 )> (_last_pos_oben_rechts select 1)) then {
		_new_pos = [(_last_pos select 0), ((_last_pos select 1) + 1000)];
	} else {
		if!(((_last_pos select 0) + 1000 )> (_last_pos_oben_rechts select 0)) then {
			_new_pos = [((_last_pos select 0)+ 1000), (_first_pos_unten_links select 1)];
		} else {_done = true;};
	};
	if(_done) exitWith {};

	_arr pushback _new_pos;

	_last_pos = _new_pos;



};

_arr



