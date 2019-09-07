
private ["_index","_requester","_pid","_grp_name","_query","_queryresult","_gang_id","_var","_group_id","_rank","_pid_new_leader","_pid_old_leader","_group_id_old","_group_id_new","_vehicles","_id_group_veh"];
_index = param[0,-1,[0]];

if(_index isEqualTo -1) exitWith {};


switch (_index) do
{
	case 0: // create Gang
	{
		_requester = param[1,objNull,[objNull]];
		if(isnull _requester) exitWith {};
		_pid = param[2,"",[""]];
		if(_pid isEqualTo "") exitWith {};
		_grp_name = param[3,"",[""]];
		if(_grp_name isEqualTo "") exitWith {};

		_query = format["Insert into groups (name,founder) VALUES ('%1','%2')",_grp_name,_pid];
		[_query,1] call valor_fnc_db_sync;
		sleep 3;
		_query = format["Select id from groups where founder = '%1'",_pid];
		_queryresult = [_query,2] call valor_fnc_db_sync;
		_gang_id = _queryresult select 0;
		_var = [_gang_id,[[_pid,3,name _requester]],_grp_name];

		_query = format["Insert into group_members (group_id,name,pid,rank) VALUES ('%1','%2','%3','%4')",_gang_id,name _requester,getplayeruid _requester,3];
		[_query,1] call valor_fnc_db_sync;

		[2,_gang_id,_var] remoteexec["valor_fnc_syncGroup",_requester];
		_requester setvariable["Valor_group_id",[_gang_id,_grp_name],true];



	};

	case 1: // promote/demote/kick player
	{
		_requester = param[1,objNull,[objNull]];
		if(isnull _requester) exitWith {};
		_group_id = param[2,-1,[0]];
		if(_group_id isEqualTo -1) exitWith {};
		_pid = param[3,"",[""]];
		if(_pid isEqualTo "") exitWith {};
		_rank = param[4,-1,[0]];
		if(_rank isEqualTo -1) exitWith {};

		if(_rank isEqualTo 0) then {
			_query = format["Delete from group_members where pid= '%1'",_pid];
			[_query,1] call valor_fnc_db_sync;
		} else {
			_query = format["Update group_members set rank = '%2' where pid= '%1'",_pid,_rank];
			[_query,1] call valor_fnc_db_sync;
		};
	};

	case 2: // set new leader
	{
		diag_log str _this;
		_requester = param[1,objNull,[objNull]];
		if(isnull _requester) exitWith {};
		diag_log str _this;
		_group_id = param[2,-1,[0]];
		if(_group_id isEqualTo -1) exitWith {};
		diag_log str _this;
		_pid_new_leader = param[3,"",[""]];
		if(_pid_new_leader isEqualTo "") exitWith {};
		diag_log str _this;
		_pid_old_leader = param[4,"",[""]];
		if(_pid_old_leader isEqualTo "") exitWith {};
		diag_log str _this;


		_query = format["Update group_members set rank = '%2' where pid= '%1'",_pid_old_leader,2];
		[_query,1] call valor_fnc_db_sync;

		sleep 2;

		_query = format["Update group_members set rank = '%2' where pid= '%1'",_pid_new_leader,3];
		[_query,1] call valor_fnc_db_sync;
	};

	case 3: // delete Gang
	{
		_requester = param[1,objNull,[objNull]];
		if(isnull _requester) exitWith {};
		_group_id = param[2,-1,[0]];
		if(_group_id isEqualTo -1) exitWith {};


		_query = format["Delete from group_members where group_id= '%1'",_group_id];
		[_query,1] call valor_fnc_db_sync;
		sleep 1;
		_query = format["Delete from groups where id= '%1'",_group_id];
		[_query,1] call valor_fnc_db_sync;
		sleep 1;
		_query = format["Delete from base_objects where base_id in (Select base_id from bases where group_id = '%1')",_group_id];
		[_query,1] call valor_fnc_db_sync;
		sleep 1;
		_query = format["Delete from bases where group_id = '%1'",_group_id];
		[_query,1] call valor_fnc_db_sync;

	};

	case 4: // add new player
	{
		_requester = param[1,objNull,[objNull]];
		if(isnull _requester) exitWith {};
		_group_id = param[2,-1,[0]];
		if(_group_id isEqualTo -1) exitWith {};
		_query = format["Insert into group_members (group_id,name,pid,rank) VALUES ('%1','%2','%3','%4')",_group_id,name _requester,getplayeruid _requester,1];
		[_query,1] call valor_fnc_db_sync;

		_vehicles = nearestObjects[(getmarkerpos "Survivor_city_1"),["landvehicle","Air","ship"],600];
		{
			_var = _x getVariable["group_restricted",[]];
			if!(_var isEqualTo []) then {
				_id_group_veh = _var select 1;
				if(_id_group_veh isEqualTo (call compile (getplayeruid _requester))) then {
					_x setvariable["group_restricted",[1,_group_id],true];
					_x setvariable["update_this",true,true];
				};
			};
		} foreach _vehicles;

	};


	case 5: // give Group properties
	{
		_requester = param[1,objNull,[objNull]];
		if(isnull _requester) exitWith {};
		_group_id_old = param[2,-1,[0]];
		if(_group_id_old isEqualTo -1) exitWith {};
		_group_id_new = param[3,-1,[0]];
		if(_group_id_new isEqualTo -1) exitWith {};

		_query = format["Update bases set group_id = '%1' where group_id= '%2'",_group_id_new,_group_id_old];
		[_query,1] call valor_fnc_db_sync;

		sleep 1;

		_query = format["Update base_objects set group_id = '%1' where group_id= '%2'",_group_id_new,_group_id_old];
		[_query,1] call valor_fnc_db_sync;

		sleep 1;
		_query = format["Update persistent_vehicles set group_id = '%1' where group_id= '%2'",_group_id_new,_group_id_old];
		[_query,1] call valor_fnc_db_sync;

		_vehicles = nearestObjects[(getmarkerpos "Survivor_city_1"),["landvehicle","Air","ship"],600];
		{
			_var = _x getVariable["group_restricted",[]];
			if!(_var isEqualTo []) then {
				_id_group_veh = _var select 1;
				if(_id_group_veh isEqualTo _group_id_old) then {
					_x setvariable["group_restricted",[1,_group_id_new],true];
					_x setvariable["update_this",true,true];
				};
			};
		} foreach _vehicles;
	};


};

