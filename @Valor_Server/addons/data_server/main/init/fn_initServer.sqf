

private ["_databaseName","_timeStamp","_extDBNotLoaded","_result","_npc"];


diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Valor Server Init ---------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

waitUntil {sleep 1;time > 10};

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
HC_AVAILABLE = false;
_max = 10;
for "_d" from 0 to _max do {
    diag_log format["Waiting to start %1",_max - _d];
    sleep 1;
};


diag_log "Valor :: setting Variables";
[] call valor_fnc_vars;
[] call valor_fnc_init_vars;

if!(isnil "HC1") then {
    if!(isnull HC1) then {
        HC_AVAILABLE = true;
    };
};

if!(HC_AVAILABLE) then {
    diag_log "Valor :: STARTING WITHOUT HC ONLINE";
    VALOR_SERVER_STARTING = true;
    publicVariable "VALOR_SERVER_STARTING";
    [] call valor_fnc_init_loottable;
    diag_log "Valor :: Variables set";
    systemchat "Valor :: Starting sold items init";
    [] call valor_fnc_init_sold_items;
    systemchat "Valor :: sold items init finished";

    diag_log "Valor :: Starting Time Module";
    [true] spawn valor_fnc_time_module;
    diag_log "Valor :: Starting Base Init";
    [] spawn valor_fnc_init_bases;
    waitUntil {!isnil "Valor_base_init_finished"};
    Valor_base_init_finished = nil;
    diag_log "Valor :: Starting Walls Init";
    [] spawn valor_fnc_init_walls;
    waitUntil {!isnil "Valor_wall_init_finished"};
    Valor_wall_init_finished = nil;
    [] spawn valor_fnc_init_outposts;
    waitUntil {!isnil "Valor_outpost_init_finished"};
    Valor_outpost_init_finished = nil;
    diag_log "Valor :: Base init finished";
    [] call valor_fnc_init_map;
    diag_log "Valor :: Init Vehicles";
    [] spawn valor_fnc_init_vehicles;
    waitUntil {!isnil "Valor_vehicles_init_finished"};
    Valor_vehicles_init_finished = nil;
    diag_log "Valor :: Vehicles loaded";
    diag_log "Valor :: Starting Zombie Destroyer";
    [] spawn valor_fnc_zombie_destroyer;
    0 spawn valor_fnc_init_loot_drops;
    ["Update players set online = '0' where online = '1'",1] call valor_fnc_db_sync;

    systemchat "Valor :: Searching for Fuelstations";
    [] call valor_fnc_init_fuelstations;
    systemchat "Valor :: Fuelstations found and published";


    /* Event handler for disconnecting players */
    addMissionEventHandler ["HandleDisconnect",{_this call valor_fnc_clientDisconnect; false;}];

    {
        diag_log format["Valor :: Releasing server for players in %1 seconds",_x];
        sleep 1;
    } foreach [5,4,3,2,1];
    VALOR_SERVER_STARTING = false;
    publicVariable "Valor_Server_loaded";
    publicVariable "VALOR_SERVER_STARTING";
} else {
    diag_log "Valor :: STARTING WITH HC ONLINE";
    diag_log "Valor :: Starting Time Module";
    [] spawn valor_fnc_time_module;
    diag_log "Valor :: Starting Zombie Destroyer";
    [] spawn valor_fnc_zombie_destroyer;

    [] spawn valor_fnc_persistent_vehicle_monitoring;

    addMissionEventHandler ["HandleDisconnect",{_this call valor_fnc_clientDisconnect; false;}];

    0 spawn {sleep 60;0 call valor_fnc_init_bases_client;};
};

civilian setfriend[opfor,1];
opfor setfriend[civilian,1];

civilian setFriend[independent,0];
independent setFriend[civilian,0];

opfor setFriend[independent,0];
independent setFriend[opfor,0];

[] spawn valor_fnc_HC_check;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Valor Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";