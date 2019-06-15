
private ["_playerside","_getplayeruid","_requester","_resolution","_steamName","_productVersion","_new_inserted","_query","_tickTime","_queryResult","_group_var","_queryResult_group_info","_grp_name","_grp_id","_queryResult_group_members"];

_playerside = param[0,sideUnknown,[sideUnknown]];
_name = param[1,"",[""]];
_getplayeruid = param[2,"",[""]];
_requester = param[3,objNull,[objNull]];
_resolution = param[4,[],[[]]];
_steamName = param[5,"",[""]];
_productVersion = param[6,[],[[]]];
_new_inserted = param[7,false,[false]];
if(isnull _requester) exitWith {diag_log "Valor Server :: Objnull at data Request";};
if(_playerside isEqualTo sideUnknown || _name isEqualTo "" || _getplayeruid isEqualTo "") exitWith {
    diag_log format["Valor Error :: Data Request Error for Object %1",_requester];
    [1,true] remoteExecCall["valor_fnc_mainInit",[_requester]];
};








switch (_playerside) do
{
	case opfor:
	{
        _query = format["Select uid, cash, bankacc,humanity , gear_cop , stats_cop, adminlevel, donatorlevel,alive_cop,  position_cop, Map, playtime, coplevel from players where pid = '%1'",_getplayeruid];
    };

     case civilian:
    {
        _query = format["Select uid, cash, bankacc,humanity , gear, stats, adminlevel, donatorlevel, alive, position, Map, playtime, arrested from players where pid = '%1'",_getplayeruid];
    };


};



if(isnil "_query") exitWith {
    diag_log format["Valor Error :: ""_query"" isnil! for UID: %1 and Object %2 with side %3! ::>>:: Starting Init on Requester again!",_getplayeruid,_requester,_playerside];
    [1,true] remoteExecCall["valor_fnc_mainInit",_requester];
};




_tickTime = diag_tickTime;
_queryResult = [_query,2] call valor_fnc_db_sync;
[format["Update players set online = '1' where pid = '%1'",_getplayeruid],1] call valor_fnc_db_sync;
waitUntil {!isNil "_queryResult"};
diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";






if(typeName _queryResult isEqualTo "STRING" || count _queryResult isEqualTo 0) exitWith {
    [_name,_getplayeruid,_requester,_resolution,_steamName,_productVersion,_playerside] spawn valor_fnc_insert_player;
};


_group_var = [];

_query = format["Select name, id from groups where id in (Select group_id from group_members where pid = '%1')",_getplayeruid];
_queryResult_group_info = [_query,2] call valor_fnc_db_sync;

if!(_queryResult_group_info isEqualTo []) then {
    _grp_name = _queryResult_group_info select 0;
    _grp_id = _queryResult_group_info select 1;

    _query = format["Select pid, rank, name from group_members where group_id in (Select group_id from group_members where pid = '%1')",_getplayeruid];
    _queryResult_group_members = [_query,2,true] call valor_fnc_db_sync;
    _group_var = [_grp_id,_queryResult_group_members,_grp_name];
};

_queryResult pushBack _group_var;

[(if(_new_inserted) then {2} else {0}),_queryResult] remoteExecCall ["valor_fnc_mainInit",_requester];




















