
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

		_query = format["Insert into groups (name,founder) VALUES ('%1','%2')",_grp_name];
		[_query,1] call valor_fnc_db_sync;
		sleep 3;
		_query = format["Select id from groups where founder = '%1'",_pid];
		_queryresult = [_query,2] call valor_fnc_db_sync;
		_gang_id = _queryresult select 0;
		_var = [_gang_id,[[_pid,3,name _requester]],_grp_name];

		[2,_gang_id,_var] remoteexec["valor_fnc_syncGroup",_requester];
		_requester setvariable["Valor_group_id",_gang_id,true];
	};

	case 1: // promote/demote/kick player
	{
		_requester = param[1,objNull,[objNull]];
		if(isnull _requester) exitWith {};
		_group_id = param[2,-1,[0]];
		if(_group_id isEqualTo -1) exitWith {};
		_pid = param[3,"",[""]];
		if(_pid isEqualTo "") exitWith {};
		_rank = param[2,-1,[0]];
		if(_rank isEqualTo -1) exitWith {};

		if(_rank isEqualTo 0) then {
			_query = format["Delete from group_members where pid= '%1'",_pid];
			[_query,1] call valor_fnc_db_sync;
		} else {
			_query = format["Update group_members set rank = '%2' where pid= '%1'",_pid,_rank];
			[_query,1] call valor_fnc_db_sync;
		};
	};


};

