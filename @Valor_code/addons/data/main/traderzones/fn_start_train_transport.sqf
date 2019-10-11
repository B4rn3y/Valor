private ["_starttime","_vehicles_to_load","_train_objects","_train","_wagonObject1","_wagonObject2","_wagonObject3","_classname","_pos","_dir","_wagonObject","_foreachindex","_bounding_box_wagons","_mins","_maxs","_min_y","_max_y","_length_wagon","_vehicles_can_be_loaded","_height","_length_array","_vehicle","_bounding_box","_min_z","_max_z","_height_vehicle","_length_vehicle","_model_space_attach_object_front","_model_space_attach_object_back","_array_sorted_vehicles_load","_vehicles_passed","_searching_length","_length","_entries","_entries_delete","_wagon1","_wagon2","_wagon3","_length_next_car","_next_car","_length_next_next_car","_next_next_car","_length_next_next_next_car","_next_next_next_car","_length_before_added","_attach_pos"];

_starttime = param[0,-1,[-1]];
_vehicles_to_load = param[1,[],[[]]];

if(_starttime isEqualTo -1) exitWith {};

_train_objects =
[
	["Land_loco_742_blue",[5197.59,8306.18,1.22852],291.845],
	["Land_wagon_flat",[5211.39,8299.69,1.12427],119.268],
	["Land_wagon_flat",[5226.01,8290.05,1.02051],127.547],
	["Land_wagon_flat",[5238.41,8278.32,0.899963],139.443]
];

_train = objNull;
_wagonObject1 = objNull;
_wagonObject2 = objNull;
_wagonObject3 = objNull;

{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;


	if(_classname isEqualTo "Land_loco_742_blue") then {
		_train = _classname createVehicleLocal [0,0,0];
		_train setdir _dir;
		_train setposatl _pos;
		_train setdir _dir;
		_train setvariable["valor_base_ids",[0,0,0,0]];
	} else {
		call compile format["_wagonObject%1 = _classname createVehicleLocal [0,0,0];_wagonObject%1 setdir _dir; _wagonObject%1 setposatl _pos; _wagonObject%1 setdir _dir; _wagonObject%1 setvariable[""valor_base_ids"",[0,0,0,0]];",_foreachindex];
	};

} foreach _train_objects;

sleep 2;

_bounding_box_wagons = boundingBoxReal _wagonObject1;

_mins = _bounding_box_wagons select 0;
_maxs = _bounding_box_wagons select 1;

_min_y = _mins select 1;
_max_y = _maxs select 1;


_length_wagon = _max_y - _min_y;


_vehicles_can_be_loaded = [];
_height = 177;
_length_array = [];
{
	_classname = _x;
	_vehicle = _classname createVehicleLocal [0,0,_height];
	_vehicle enableSimulation false;
	_vehicle allowDamage false;
	_vehicle lock true;
	_bounding_box = boundingBoxReal _vehicle;

	_min_y = (_bounding_box select 0) select 1;
	_max_y = (_bounding_box select 1) select 1;

	_min_z = (_bounding_box select 0) select 2;
	_max_z = (_bounding_box select 1) select 2;
	_height_vehicle = _max_z - _min_z;
	_length_vehicle = _max_y - _min_y;
	if(_length_vehicle <= _length_wagon) then {
		[_vehicle] call valor_fnc_clear_vehicle;

		_model_space_attach_object_front = [0,(_bounding_box select 1) select 1,(_bounding_box select 0) select 2];
		_model_space_attach_object_back = [0,(_bounding_box select 0) select 1,(_bounding_box select 0) select 2];
		_vehicles_can_be_loaded pushback [_vehicle,_model_space_attach_object_front,_model_space_attach_object_back,_length_vehicle,_height_vehicle];
		_length_array pushBack _length_vehicle;
	} else {
		deleteVehicle _vehicle;
	};

	_height = _height + 20;
	sleep 0.5;
} foreach _vehicles_to_load;


_array_sorted_vehicles_load = [];
_length_array sort true;
_vehicles_passed = [];
{
	_searching_length = _x;
	{
		_length = _x select 3;
		if(_length isEqualTo _searching_length) then {
			if((_x select 0) in _vehicles_passed) exitWith {};
			_array_sorted_vehicles_load pushBackUnique _x;
			_vehicles_passed pushBackUnique (_x select 0);
		};
	} foreach _vehicles_can_be_loaded;
} foreach _length_array;

_vehicles_can_be_loaded = nil;
_length_array = nil;
_vehicles_passed = nil;



_entries = count _array_sorted_vehicles_load;
_entries_delete = [];
_wagon1 = [];
_wagon2 = [];
_wagon3 = [];

{
	if!(_entries_delete isEqualTo []) exitWith {};
	_vehicle = _x select 0;
	_model_space_attach_object_front = _x select 1;
	_model_space_attach_object_back = _x select 2;
	_length = _x select 3;
	if(_entries >= (_foreachindex +2)) then {
		_length_next_car = (_array_sorted_vehicles_load select (_foreachindex + 1)) select 3;
		_next_car = _array_sorted_vehicles_load select (_foreachindex + 1);
		if(_length_wagon >= (_length_next_car + _length)) then {
			if(_entries >= (_foreachindex +3)) then {
				_length_next_next_car = (_array_sorted_vehicles_load select (_foreachindex + 2)) select 3;
				_next_next_car = _array_sorted_vehicles_load select (_foreachindex + 2);
				if(_length_wagon >= (_length_next_next_car + _length_next_car + _length)) then {
					if(_entries >= (_foreachindex +4)) then {
						_length_next_next_next_car = (_array_sorted_vehicles_load select (_foreachindex + 3)) select 3;
						_next_next_next_car = _array_sorted_vehicles_load select (_foreachindex + 3);
						if(_length_wagon >= (_length_next_next_next_car + _length_next_next_car + _length_next_car + _length)) then {
							_wagon1 append [_x,_next_car,_next_next_car,_next_next_next_car];
							_entries_delete append [_x,_next_car,_next_next_car,_next_next_next_car];
						};
					} else {
						_wagon1 append [_x,_next_car,_next_next_car];
						_entries_delete append [_x,_next_car,_next_next_car];
					};
				} else {
					_wagon1 append [_x,_next_car];
					_entries_delete append [_x,_next_car];
				};
			} else {
				_wagon1 append [_x,_next_car];
				_entries_delete append [_x,_next_car];
			};
		}else {
			_wagon1 pushBack _x;
			_entries_delete pushBack _x;
		};
	} else {
		_wagon1 pushBack _x;
		_entries_delete pushBack _x;
	};


} foreach _array_sorted_vehicles_load;

_array_sorted_vehicles_load = _array_sorted_vehicles_load - _entries_delete;



_entries_delete = [];
_entries = count _array_sorted_vehicles_load;

{
		if!(_entries_delete isEqualTo []) exitWith {};
		_vehicle = _x select 0;
		_model_space_attach_object_front = _x select 1;
		_model_space_attach_object_back = _x select 2;
		_length = _x select 3;
		if(_entries >= (_foreachindex +2)) then {
			_length_next_car = (_array_sorted_vehicles_load select (_foreachindex + 1)) select 3;
			_next_car = _array_sorted_vehicles_load select (_foreachindex + 1);
			if(_length_wagon >= (_length_next_car + _length)) then {
				if(_entries >= (_foreachindex +3)) then {
					_length_next_next_car = (_array_sorted_vehicles_load select (_foreachindex + 2)) select 3;
					_next_next_car = _array_sorted_vehicles_load select (_foreachindex + 2);
					if(_length_wagon >= (_length_next_next_car + _length_next_car + _length)) then {
						if(_entries >= (_foreachindex +4)) then {
							_length_next_next_next_car = (_array_sorted_vehicles_load select (_foreachindex + 3)) select 3;
							_next_next_next_car = _array_sorted_vehicles_load select (_foreachindex + 3);
							if(_length_wagon >= (_length_next_next_next_car + _length_next_next_car + _length_next_car + _length)) then {
								_wagon2 append [_x,_next_car,_next_next_car,_next_next_next_car];
								_entries_delete append [_x,_next_car,_next_next_car,_next_next_next_car];
							};
						} else {
							_wagon2 append [_x,_next_car,_next_next_car];
							_entries_delete append [_x,_next_car,_next_next_car];
						};
					} else {
						_wagon2 append [_x,_next_car];
						_entries_delete append [_x,_next_car];
					};
				} else {
					_wagon2 append [_x,_next_car];
					_entries_delete append [_x,_next_car];
				};
			}else {
				_wagon2 pushBack _x;
				_entries_delete pushBack _x;
			};
		} else {
			_wagon2 pushBack _x;
			_entries_delete pushBack _x;
		};


} foreach _array_sorted_vehicles_load;

_array_sorted_vehicles_load = _array_sorted_vehicles_load - _entries_delete;


{
	deleteVehicle (_x select 0);
} foreach _array_sorted_vehicles_load;



_entries_delete = [];
_entries = count _array_sorted_vehicles_load;

{
	if!(_entries_delete isEqualTo []) exitWith {};
	_vehicle = _x select 0;
	_model_space_attach_object_front = _x select 1;
	_model_space_attach_object_back = _x select 2;
	_length = _x select 3;
	if(_entries >= (_foreachindex +2)) then {
		_length_next_car = (_array_sorted_vehicles_load select (_foreachindex + 1)) select 3;
		_next_car = _array_sorted_vehicles_load select (_foreachindex + 1);
		if(_length_wagon >= (_length_next_car + _length)) then {
			if(_entries >= (_foreachindex +3)) then {
				_length_next_next_car = (_array_sorted_vehicles_load select (_foreachindex + 2)) select 3;
				_next_next_car = _array_sorted_vehicles_load select (_foreachindex + 2);
				if(_length_wagon >= (_length_next_next_car + _length_next_car + _length)) then {
					if(_entries >= (_foreachindex +4)) then {
						_length_next_next_next_car = (_array_sorted_vehicles_load select (_foreachindex + 3)) select 3;
						_next_next_next_car = _array_sorted_vehicles_load select (_foreachindex + 3);
						if(_length_wagon >= (_length_next_next_next_car + _length_next_next_car + _length_next_car + _length)) then {
							_wagon3 append [_x,_next_car,_next_next_car,_next_next_next_car];
							_entries_delete append [_x,_next_car,_next_next_car,_next_next_next_car];
						};
					} else {
						_wagon3 append [_x,_next_car,_next_next_car];
						_entries_delete append [_x,_next_car,_next_next_car];
					};
				} else {
					_wagon3 append [_x,_next_car];
					_entries_delete append [_x,_next_car];
				};
			} else {
				_wagon3 append [_x,_next_car];
				_entries_delete append [_x,_next_car];
			};
		}else {
			_wagon3 pushBack _x;
			_entries_delete pushBack _x;
		};
	} else {
		_wagon3 pushBack _x;
		_entries_delete pushBack _x;
	};


} foreach _array_sorted_vehicles_load;





_length_before_added = 0;
{
	_vehicle = _x select 0;
	_model_space_attach_object_front = _x select 1;
	_model_space_attach_object_back = _x select 2;
	_length = _x select 3;
	_height = _x select 4;


	_attach_pos = [0,(_length_wagon / 2) - (_length / 2) - _length_before_added,(_height/2)+0.28003];
	_length_before_added = _length_before_added + _length;

	_vehicle attachto[_wagonObject1,_attach_pos];


} foreach _wagon1;


_length_before_added = 0;
{
	_vehicle = _x select 0;
	_model_space_attach_object_front = _x select 1;
	_model_space_attach_object_back = _x select 2;
	_length = _x select 3;
	_height = _x select 4;


	_attach_pos = [0,(_length_wagon / 2) - (_length / 2) - _length_before_added,(_height/2)+0.28003];
	_length_before_added = _length_before_added + _length;

	_vehicle attachto[_wagonObject2,_attach_pos];


} foreach _wagon2;

_length_before_added = 0;
{
	_vehicle = _x select 0;
	_model_space_attach_object_front = _x select 1;
	_model_space_attach_object_back = _x select 2;
	_length = _x select 3;
	_height = _x select 4;


	_attach_pos = [0,(_length_wagon / 2) - (_length / 2) - _length_before_added,(_height/2)+0.28003];
	_length_before_added = _length_before_added + _length;

	_vehicle attachto[_wagonObject3,_attach_pos];


} foreach _wagon3;




waitUntil {servertime >= _starttime};

_train disableCollisionWith _wagonObject1;
_train disableCollisionWith _wagonObject2;
_train disableCollisionWith _wagonObject3;

_wagonObject1 disableCollisionWith _train;
_wagonObject1 disableCollisionWith _wagonObject2;
_wagonObject1 disableCollisionWith _wagonObject3;

_wagonObject2 disableCollisionWith _train;
_wagonObject2 disableCollisionWith _wagonObject1;
_wagonObject2 disableCollisionWith _wagonObject3;

_wagonObject3 disableCollisionWith _train;
_wagonObject3 disableCollisionWith _wagonObject1;
_wagonObject3 disableCollisionWith _wagonObject2;
start = servertime;




rail_loko = nearestTerrainObjects[_train,["RAILWAY"],20] + nearestObjects[_train,["CUP_Railway_rails_25","CUP_Winter_railsN_curve_R30_20","CUP_Winter_railsN_curve_L30_20","CUP_Railway_rails_bridge_rail","CUP_Winter_obj_rails_25","CUP_Railway_rails_v_LB_RE","CUP_Railway_railsN_turnout_L","CUP_Railway_railsN_curve_R30_20","CUP_Winter_rails_up_25","CUP_Winter_rails_passing_25","CUP_Railway_railsN_curve_L30_20","CUP_Railway_rails_passing_10","CUP_Winter_railsN_25","CUP_Railway_railsN_curve_R25_5","CUP_Railway_rails_v_LE_RB","CUP_Railway_railsN_turnout_R","CUP_Railway_rails_v1_LB_RE","CUP_Railway_railsN_curve_R25_10","CUP_Railway_rails_v1_LE_RB","CUP_Railway_railsN_curve_L25_5","CUP_Winter_rails_down_25","CUP_Railway_railsN_curve_L25_10","CUP_Railway_rails_turnout_L","CUP_Railway_rails_passing_25","CUP_Railway_rails_turnout_R","CUP_Railway_rails_up_25","CUP_Railway_railsN_25","CUP_Railway_rails_curve_L25_10","CUP_Winter_railsN_40","CUP_Railway_rails_v_SP","CUP_Railway_railsN_40","CUP_Railway_rails_up_40","CUP_Winter_rails_bridge_40","CUP_Railway_rails_down_25","CUP_Railway_rails_curve_R25_10","CUP_Railway_rails_down_40"],25];
rail_loko = rail_loko select 0;
loko = _train;
backwards_loko = false;
driven_loko = rail_loko;

dir_loko = true;
driven_distance_loko = 0;
Count_rounds_loko = 0;
addMissionEventHandler ["EachFrame","
	_s_have = 10;
	_s = _s_have/diag_fps;
	_object = loko;
	if(Count_rounds_loko >= 600) then {
		Count_rounds_loko = 0;
		_time = servertime - start;
		_needs_driven = _s_have * _time;
		if(_needs_driven > driven_distance_loko) then {
			_s = _needs_driven - driven_distance_loko;
		} else {
			_s = (driven_distance_loko - _needs_driven) * -1;
		};
	};

	_pos_bounding = boundingBoxReal rail_loko;
	_pos_front = _pos_bounding select 0;
	_pos_back = _pos_bounding select 1;
	_y2 = (_pos_bounding select 1) select 1;
	_y1 = (_pos_bounding select 0) select 1;
	_length = _y2 - _y1;
	_half_length = _length / 2;
	_y = (rail_loko worldToModel (getposatl _object)) select 1;


	if(((_y - 4.5) >=_half_length && !(backwards_loko)) || ((_y + 4.5) <=_half_length && backwards_loko))then {

		_pos_search = _object modelToWorld[0,6.5,0];
		if!(dir_loko) then {
			_pos_search = _object modelToWorld[0,-6.5,0];

		};
		_objs = nearestTerrainObjects[_pos_search,[""RAILWAY""],25] + nearestObjects[_pos_search,[""CUP_Railway_rails_25"",""CUP_Winter_railsN_curve_R30_20"",""CUP_Winter_railsN_curve_L30_20"",""CUP_Railway_rails_bridge_rail"",""CUP_Winter_obj_rails_25"",""CUP_Railway_rails_v_LB_RE"",""CUP_Railway_railsN_turnout_L"",""CUP_Railway_railsN_curve_R30_20"",""CUP_Winter_rails_up_25"",""CUP_Winter_rails_passing_25"",""CUP_Railway_railsN_curve_L30_20"",""CUP_Railway_rails_passing_10"",""CUP_Winter_railsN_25"",""CUP_Railway_railsN_curve_R25_5"",""CUP_Railway_rails_v_LE_RB"",""CUP_Railway_railsN_turnout_R"",""CUP_Railway_rails_v1_LB_RE"",""CUP_Railway_railsN_curve_R25_10"",""CUP_Railway_rails_v1_LE_RB"",""CUP_Railway_railsN_curve_L25_5"",""CUP_Winter_rails_down_25"",""CUP_Railway_railsN_curve_L25_10"",""CUP_Railway_rails_turnout_L"",""CUP_Railway_rails_passing_25"",""CUP_Railway_rails_turnout_R"",""CUP_Railway_rails_up_25"",""CUP_Railway_railsN_25"",""CUP_Railway_rails_curve_L25_10"",""CUP_Winter_railsN_40"",""CUP_Railway_rails_v_SP"",""CUP_Railway_railsN_40"",""CUP_Railway_rails_up_40"",""CUP_Winter_rails_bridge_40"",""CUP_Railway_rails_down_25"",""CUP_Railway_rails_curve_R25_10"",""CUP_Railway_rails_down_40""],25];
		_objs = (_objs - [driven_loko] - [rail_loko]);
		_real_objects = [];
		{

			_distance_front = (_object modelToWorld[0,5,0]) distance _x;
			_distance_back = _object modelToWorld[0,-5,0] distance _x;
			if(dir_loko) then {
				if!(_distance_back < _distance_front) then {
					iF!(isObjectHidden _x) then {
						_real_objects pushback _x;
					};
				};
			} else {
				if(_distance_back < _distance_front) then {
					iF!(isObjectHidden _x) then {
						_real_objects pushback _x;
					};
				};
			};
		} foreach _objs;
		_minimum_distance = 500;
		_new_rail = objNull;
		{
			_front_point = (boundingBoxReal _x) select 0;
			_front_point set[0,0];
			_back_point = (boundingBoxReal _x) select 1;
			_back_point set[0,0];
			if((_front_point distance _pos_front) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _front_point distance _pos_front;
			};
			if((_front_point distance _pos_back) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _front_point distance _pos_back;
			};
			if((_back_point distance _pos_back) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _back_point distance _pos_back;
			};
			if((_back_point distance _pos_front) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _back_point distance _pos_front;
			};
		} foreach _real_objects;

		iF(isnull _new_rail) exitWith {};
		rail_loko = _new_rail;
		if(((getdir rail_loko-getdir _object) > 90) || ((getdir rail_loko-getdir _object) < -90)) then {

			backwards_loko = true;
		} else {

			backwards_loko = false;
		};



	};
	_y = (rail_loko worldToModel (getposatl _object)) select 1;
	if(backwards_loko) then {
		if(dir_loko) then {
			_y = _y - _s;
		} else {
			_y = _y + _s;
		};
	} else {
		if(dir_loko) then {
			_y = _y + _s;
		} else {
			_y = _y - _s;
		};
	};
	driven_distance_loko = driven_distance_loko + _s;
	_pos = rail_loko modelToWorld [0,_y,0.5];
	if(backwards_loko) then {
		_object setVectorDir((vectorDir rail_loko) vectorMultiply -1);
	} else {
		_object setVectorDir(vectorDir rail_loko);
	};
	_object setvectorup(vectorUp rail_loko);
	_object setposatl _pos;
	Count_rounds_loko = Count_rounds_loko + 1;"

];








rail_wagon1 = nearestTerrainObjects[_wagonObject1,["RAILWAY"],20] + nearestObjects[_wagonObject1,["CUP_Railway_rails_25","CUP_Winter_railsN_curve_R30_20","CUP_Winter_railsN_curve_L30_20","CUP_Railway_rails_bridge_rail","CUP_Winter_obj_rails_25","CUP_Railway_rails_v_LB_RE","CUP_Railway_railsN_turnout_L","CUP_Railway_railsN_curve_R30_20","CUP_Winter_rails_up_25","CUP_Winter_rails_passing_25","CUP_Railway_railsN_curve_L30_20","CUP_Railway_rails_passing_10","CUP_Winter_railsN_25","CUP_Railway_railsN_curve_R25_5","CUP_Railway_rails_v_LE_RB","CUP_Railway_railsN_turnout_R","CUP_Railway_rails_v1_LB_RE","CUP_Railway_railsN_curve_R25_10","CUP_Railway_rails_v1_LE_RB","CUP_Railway_railsN_curve_L25_5","CUP_Winter_rails_down_25","CUP_Railway_railsN_curve_L25_10","CUP_Railway_rails_turnout_L","CUP_Railway_rails_passing_25","CUP_Railway_rails_turnout_R","CUP_Railway_rails_up_25","CUP_Railway_railsN_25","CUP_Railway_rails_curve_L25_10","CUP_Winter_railsN_40","CUP_Railway_rails_v_SP","CUP_Railway_railsN_40","CUP_Railway_rails_up_40","CUP_Winter_rails_bridge_40","CUP_Railway_rails_down_25","CUP_Railway_rails_curve_R25_10","CUP_Railway_rails_down_40"],25];
rail_wagon1 = rail_wagon1 select 0;
loko_wagon1 = _wagonObject1;
backwards_wagon1 = false;
driven_wagon1 = rail_wagon1;

dir_wagon1 = true;
driven_distance_wagon1 = 0;
Count_rounds_wagon1 = 0;
addMissionEventHandler ["EachFrame","
	_s_have = 10;
	_s = _s_have/diag_fps;
	_object = loko_wagon1;
	if(Count_rounds_wagon1 >= 600) then {
		Count_rounds_wagon1 = 0;
		_time = servertime - start;
		_needs_driven = _s_have * _time;
		if(_needs_driven > driven_distance_wagon1) then {
			_s = _needs_driven - driven_distance_wagon1;
		} else {
			_s = (driven_distance_wagon1 - _needs_driven) * -1;
		};
	};

	_pos_bounding = boundingBoxReal rail_wagon1;
	_pos_front = _pos_bounding select 0;
	_pos_back = _pos_bounding select 1;
	_y2 = (_pos_bounding select 1) select 1;
	_y1 = (_pos_bounding select 0) select 1;
	_length = _y2 - _y1;
	_half_length = _length / 2;
	_y = (rail_wagon1 worldToModel (getposatl _object)) select 1;


	if(((_y - 4.5) >=_half_length && !(backwards_wagon1)) || ((_y + 4.5) <=_half_length && backwards_wagon1))then {

		_pos_search = _object modelToWorld[0,6.5,0];
		if!(dir_wagon1) then {
			_pos_search = _object modelToWorld[0,-6.5,0];

		};
		_objs = nearestTerrainObjects[_pos_search,[""RAILWAY""],25] + nearestObjects[_pos_search,[""CUP_Railway_rails_25"",""CUP_Winter_railsN_curve_R30_20"",""CUP_Winter_railsN_curve_L30_20"",""CUP_Railway_rails_bridge_rail"",""CUP_Winter_obj_rails_25"",""CUP_Railway_rails_v_LB_RE"",""CUP_Railway_railsN_turnout_L"",""CUP_Railway_railsN_curve_R30_20"",""CUP_Winter_rails_up_25"",""CUP_Winter_rails_passing_25"",""CUP_Railway_railsN_curve_L30_20"",""CUP_Railway_rails_passing_10"",""CUP_Winter_railsN_25"",""CUP_Railway_railsN_curve_R25_5"",""CUP_Railway_rails_v_LE_RB"",""CUP_Railway_railsN_turnout_R"",""CUP_Railway_rails_v1_LB_RE"",""CUP_Railway_railsN_curve_R25_10"",""CUP_Railway_rails_v1_LE_RB"",""CUP_Railway_railsN_curve_L25_5"",""CUP_Winter_rails_down_25"",""CUP_Railway_railsN_curve_L25_10"",""CUP_Railway_rails_turnout_L"",""CUP_Railway_rails_passing_25"",""CUP_Railway_rails_turnout_R"",""CUP_Railway_rails_up_25"",""CUP_Railway_railsN_25"",""CUP_Railway_rails_curve_L25_10"",""CUP_Winter_railsN_40"",""CUP_Railway_rails_v_SP"",""CUP_Railway_railsN_40"",""CUP_Railway_rails_up_40"",""CUP_Winter_rails_bridge_40"",""CUP_Railway_rails_down_25"",""CUP_Railway_rails_curve_R25_10"",""CUP_Railway_rails_down_40""],25];
		_objs = (_objs - [driven_wagon1] - [rail_wagon1]);
		_real_objects = [];
		{

			_distance_front = (_object modelToWorld[0,5,0]) distance _x;
			_distance_back = _object modelToWorld[0,-5,0] distance _x;
			if(dir_wagon1) then {
				if!(_distance_back < _distance_front) then {
					iF!(isObjectHidden _x) then {
						_real_objects pushback _x;
					};
				};
			} else {
				if(_distance_back < _distance_front) then {
					iF!(isObjectHidden _x) then {
						_real_objects pushback _x;
					};
				};
			};
		} foreach _objs;
		_minimum_distance = 500;
		_new_rail = objNull;
		{
			_front_point = (boundingBoxReal _x) select 0;
			_front_point set[0,0];
			_back_point = (boundingBoxReal _x) select 1;
			_back_point set[0,0];
			if((_front_point distance _pos_front) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _front_point distance _pos_front;
			};
			if((_front_point distance _pos_back) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _front_point distance _pos_back;
			};
			if((_back_point distance _pos_back) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _back_point distance _pos_back;
			};
			if((_back_point distance _pos_front) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _back_point distance _pos_front;
			};
		} foreach _real_objects;

		iF(isnull _new_rail) exitWith {};
		rail_wagon1 = _new_rail;
		if(((getdir rail_wagon1-getdir _object) > 90) || ((getdir rail_wagon1-getdir _object) < -90)) then {

			backwards_wagon1 = true;
		} else {

			backwards_wagon1 = false;
		};



	};
	_y = (rail_wagon1 worldToModel (getposatl _object)) select 1;
	if(backwards_wagon1) then {
		if(dir_wagon1) then {
			_y = _y - _s;
		} else {
			_y = _y + _s;
		};
	} else {
		if(dir_wagon1) then {
			_y = _y + _s;
		} else {
			_y = _y - _s;
		};
	};
	driven_distance_wagon1 = driven_distance_wagon1 + _s;
	_pos = rail_wagon1 modelToWorld [0,_y,0.5];
	if(backwards_wagon1) then {
		_object setVectorDir((vectorDir rail_wagon1) vectorMultiply -1);
	} else {
		_object setVectorDir(vectorDir rail_wagon1);
	};
	_object setvectorup(vectorUp rail_wagon1);
	_object setposatl _pos;
	Count_rounds_wagon1 = Count_rounds_wagon1 + 1;"

];













rail_wagon2 = nearestTerrainObjects[_wagonObject2,["RAILWAY"],20] + nearestObjects[_wagonObject2,["CUP_Railway_rails_25","CUP_Winter_railsN_curve_R30_20","CUP_Winter_railsN_curve_L30_20","CUP_Railway_rails_bridge_rail","CUP_Winter_obj_rails_25","CUP_Railway_rails_v_LB_RE","CUP_Railway_railsN_turnout_L","CUP_Railway_railsN_curve_R30_20","CUP_Winter_rails_up_25","CUP_Winter_rails_passing_25","CUP_Railway_railsN_curve_L30_20","CUP_Railway_rails_passing_10","CUP_Winter_railsN_25","CUP_Railway_railsN_curve_R25_5","CUP_Railway_rails_v_LE_RB","CUP_Railway_railsN_turnout_R","CUP_Railway_rails_v1_LB_RE","CUP_Railway_railsN_curve_R25_10","CUP_Railway_rails_v1_LE_RB","CUP_Railway_railsN_curve_L25_5","CUP_Winter_rails_down_25","CUP_Railway_railsN_curve_L25_10","CUP_Railway_rails_turnout_L","CUP_Railway_rails_passing_25","CUP_Railway_rails_turnout_R","CUP_Railway_rails_up_25","CUP_Railway_railsN_25","CUP_Railway_rails_curve_L25_10","CUP_Winter_railsN_40","CUP_Railway_rails_v_SP","CUP_Railway_railsN_40","CUP_Railway_rails_up_40","CUP_Winter_rails_bridge_40","CUP_Railway_rails_down_25","CUP_Railway_rails_curve_R25_10","CUP_Railway_rails_down_40"],25];
rail_wagon2 = rail_wagon2 select 0;
loko_wagon2 = _wagonObject2;
backwards_wagon2 = false;
driven_wagon2 = rail_wagon2;

dir_wagon2 = true;
driven_distance_wagon2 = 0;
Count_rounds_wagon2 = 0;
addMissionEventHandler ["EachFrame","
	_s_have = 10;
	_s = _s_have/diag_fps;
	_object = loko_wagon2;
	if(Count_rounds_wagon2 >= 600) then {
		Count_rounds_wagon2 = 0;
		_time = servertime - start;
		_needs_driven = _s_have * _time;
		if(_needs_driven > driven_distance_wagon2) then {
			_s = _needs_driven - driven_distance_wagon2;
		} else {
			_s = (driven_distance_wagon2 - _needs_driven) * -1;
		};
	};

	_pos_bounding = boundingBoxReal rail_wagon2;
	_pos_front = _pos_bounding select 0;
	_pos_back = _pos_bounding select 1;
	_y2 = (_pos_bounding select 1) select 1;
	_y1 = (_pos_bounding select 0) select 1;
	_length = _y2 - _y1;
	_half_length = _length / 2;
	_y = (rail_wagon2 worldToModel (getposatl _object)) select 1;


	if(((_y - 4.5) >=_half_length && !(backwards_wagon2)) || ((_y + 4.5) <=_half_length && backwards_wagon2))then {

		_pos_search = _object modelToWorld[0,6.5,0];
		if!(dir_wagon2) then {
			_pos_search = _object modelToWorld[0,-6.5,0];

		};
		_objs = nearestTerrainObjects[_pos_search,[""RAILWAY""],25] + nearestObjects[_pos_search,[""CUP_Railway_rails_25"",""CUP_Winter_railsN_curve_R30_20"",""CUP_Winter_railsN_curve_L30_20"",""CUP_Railway_rails_bridge_rail"",""CUP_Winter_obj_rails_25"",""CUP_Railway_rails_v_LB_RE"",""CUP_Railway_railsN_turnout_L"",""CUP_Railway_railsN_curve_R30_20"",""CUP_Winter_rails_up_25"",""CUP_Winter_rails_passing_25"",""CUP_Railway_railsN_curve_L30_20"",""CUP_Railway_rails_passing_10"",""CUP_Winter_railsN_25"",""CUP_Railway_railsN_curve_R25_5"",""CUP_Railway_rails_v_LE_RB"",""CUP_Railway_railsN_turnout_R"",""CUP_Railway_rails_v1_LB_RE"",""CUP_Railway_railsN_curve_R25_10"",""CUP_Railway_rails_v1_LE_RB"",""CUP_Railway_railsN_curve_L25_5"",""CUP_Winter_rails_down_25"",""CUP_Railway_railsN_curve_L25_10"",""CUP_Railway_rails_turnout_L"",""CUP_Railway_rails_passing_25"",""CUP_Railway_rails_turnout_R"",""CUP_Railway_rails_up_25"",""CUP_Railway_railsN_25"",""CUP_Railway_rails_curve_L25_10"",""CUP_Winter_railsN_40"",""CUP_Railway_rails_v_SP"",""CUP_Railway_railsN_40"",""CUP_Railway_rails_up_40"",""CUP_Winter_rails_bridge_40"",""CUP_Railway_rails_down_25"",""CUP_Railway_rails_curve_R25_10"",""CUP_Railway_rails_down_40""],25];
		_objs = (_objs - [driven_wagon2] - [rail_wagon2]);
		_real_objects = [];
		{

			_distance_front = (_object modelToWorld[0,5,0]) distance _x;
			_distance_back = _object modelToWorld[0,-5,0] distance _x;
			if(dir_wagon2) then {
				if!(_distance_back < _distance_front) then {
					iF!(isObjectHidden _x) then {
						_real_objects pushback _x;
					};
				};
			} else {
				if(_distance_back < _distance_front) then {
					iF!(isObjectHidden _x) then {
						_real_objects pushback _x;
					};
				};
			};
		} foreach _objs;
		_minimum_distance = 500;
		_new_rail = objNull;
		{
			_front_point = (boundingBoxReal _x) select 0;
			_front_point set[0,0];
			_back_point = (boundingBoxReal _x) select 1;
			_back_point set[0,0];
			if((_front_point distance _pos_front) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _front_point distance _pos_front;
			};
			if((_front_point distance _pos_back) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _front_point distance _pos_back;
			};
			if((_back_point distance _pos_back) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _back_point distance _pos_back;
			};
			if((_back_point distance _pos_front) < _minimum_distance) then {
				_new_rail = _x;
				_minimum_distance = _back_point distance _pos_front;
			};
		} foreach _real_objects;

		iF(isnull _new_rail) exitWith {};
		rail_wagon2 = _new_rail;
		if(((getdir rail_wagon2-getdir _object) > 90) || ((getdir rail_wagon2-getdir _object) < -90)) then {

			backwards_wagon2 = true;
		} else {

			backwards_wagon2 = false;
		};



	};
	_y = (rail_wagon2 worldToModel (getposatl _object)) select 1;
	if(backwards_wagon2) then {
		if(dir_wagon2) then {
			_y = _y - _s;
		} else {
			_y = _y + _s;
		};
	} else {
		if(dir_wagon2) then {
			_y = _y + _s;
		} else {
			_y = _y - _s;
		};
	};
	driven_distance_wagon2 = driven_distance_wagon2 + _s;
	_pos = rail_wagon2 modelToWorld [0,_y,0.5];
	if(backwards_wagon2) then {
		_object setVectorDir((vectorDir rail_wagon2) vectorMultiply -1);
	} else {
		_object setVectorDir(vectorDir rail_wagon2);
	};
	_object setvectorup(vectorUp rail_wagon2);
	_object setposatl _pos;
	Count_rounds_wagon2 = Count_rounds_wagon2 + 1;"

];