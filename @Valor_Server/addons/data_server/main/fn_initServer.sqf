

private ["_databaseName","_timeStamp","_extDBNotLoaded","_result","_npc"];


diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Valor Server Init ---------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

waitUntil {sleep 1;time > 7};

diag_log "Valor :: Waiting for Mission to start";

_databaseName = "valor";
Valor_Server_loaded = true;
_timeStamp = diag_tickTime;
_extDBNotLoaded = 1;
if (isNil {uiNamespace getVariable "valor_sql_id"}) then {
    valor_sql_id = round(random(9999));
    valor_sql_id = compileFinal str valor_sql_id;
    uiNamespace setVariable ["valor_sql_id",valor_sql_id];
        try {
        _result = "extDB3" callExtension format ["9:ADD_DATABASE:%1",_databaseName];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = "extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",call (valor_sql_id),_databaseName];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDBNotLoaded = [true, _exception];
    };
    if (_extDBNotLoaded isEqualType []) exitWith {};
    "extDB3" callExtension "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    valor_sql_id = uiNamespace getVariable "valor_sql_id";
    diag_log "extDB3: Still Connected to Database";
};


if (_extDBNotLoaded isEqualType []) exitWith {
    Valor_Server_loaded = false;
    publicVariable "Valor_Server_loaded";
};


{
    if (!isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;

diag_log "Valor :: setting Variables";
[] call valor_fnc_vars;
diag_log "Valor :: Variables set";
diag_log "Valor :: Starting Time Module";
[] spawn valor_fnc_time_module;
diag_log "Valor :: Init Vehicles";
//[] spawn valor_fnc_init_vehicles;
diag_log "Valor :: Vehicles loaded";
[] call valor_fnc_init_map;
diag_log "Valor :: Starting Zombie Destroyer";
[] spawn valor_fnc_zombie_destroyer;
["Update players set online = '0' where online = '1'",1] call valor_fnc_db_sync;
/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call valor_fnc_clientDisconnect; false;}];
publicVariable "Valor_Server_loaded";

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Valor Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";