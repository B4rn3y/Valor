
private ["_getplayeruid","_requester","_resolution","_steamName","_productVersion","_playerside","_query","_tickTime","_queryResult","_map_content"];
_name = param[0,"",[""]];
_getplayeruid = param[1,"",[""]];
_requester = param[2,objNull,[objNull]];
_resolution = param[3,[],[[],""]];
_steamName = param[4,"",[""]];
_productVersion = param[5,[],[[],""]];
_playerside = param[6,sideUnknown,[sideUnknown]];
_cash_behginning = 0;
_bank_beginning = 0;
//Error checks
if((_getplayeruid isEqualTo "") OR (_name isEqualTo "")) exitWith {diag_log "Valor ERROR :: Name or Uid is nil @ Insert";}; //Let the client be 'lost' in 'transaction'
if(isNull _requester) exitWith {diag_log "VALOR ERROR :: Requester is null!";}; //No one to send this to!

_query = format["SELECT pid, playtime FROM players WHERE pid='%1'",_getplayeruid];


_tickTime = diag_tickTime;
_queryResult = [_query,2] call valor_fnc_db_sync;

diag_log "------------- Insert Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

//Double check to make sure the client isn't in the database...
if(typeName _queryResult isEqualTo "STRING") exitWith {[1,true] remoteExecCall["valor_fnc_mainInit",_requester];}; //There was an entry!;
if(count _queryResult != 0) exitWith {[1,true] remoteExecCall["valor_fnc_mainInit",_requester];};

//Block New player
if (isNil "VALOR_SOFT_WHITELIST") then {
	VALOR_SOFT_WHITELIST = false;
};
if (VALOR_SOFT_WHITELIST) exitWith {
	diag_log format["DEBUG: New Player blocked: _this = %1",_this];
	[3] remoteExecCall["valor_fnc_mainInit",_requester];
};

//Clense and prepare some information.
_name = [_name] call valor_fnc_mresString;
_steamName = [_steamName] call valor_fnc_mresString;
_map_content = [(0 call valor_fnc_get_hidement_array)] call valor_fnc_map_hidement_smaller_array;

//Prepare the query statement..
_query = format["INSERT INTO players (pid, name, gear , Map, alive,cash, bankacc,stats,adminlevel,donatorlevel,position,playtime,online,gear_cop, stats_cop, position_cop) VALUES('%1', '%2','""[]""','%3','1','%4','%5','[100,100,0,12000]','0','0','[]','0','0','""[]""', '[100,100,0,12000]', '[]')",
	_getplayeruid,
	_name,
	_map_content,
	_cash_behginning,
	_bank_beginning
];


[_query,1] call valor_fnc_db_sync;


sleep 1,

_query = format["INSERT INTO player_satistics (pid, name, steamname, resolution,productversion) VALUES('%1', '%2','%3','%4','%5')",
	_getplayeruid,
	_name,
	_steamName,
	_resolution,
	_productVersion
];


[_query,1] call valor_fnc_db_sync;


sleep 5;

[_playerside,_name,_getplayeruid,_requester,_resolution,_steamName,_productVersion,true] call valor_fnc_player_data_request;