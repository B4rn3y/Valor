

private ["_databaseName","_timeStamp","_extDBNotLoaded","_result","_npc"];


systemchat "----------------------------------------------------------------------------------------------------";
systemchat "---------------------------------- Starting Valor HC Init -------------------------------------------";
systemchat "----------------------------------------------------------------------------------------------------";

waitUntil {sleep 1;time > 10};

systemchat "Valor :: Waiting for Mission to start";

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
        systemchat _exception;
        _extDBNotLoaded = [true, _exception];
    };
    if (_extDBNotLoaded isEqualType []) exitWith {};
    "extDB3" callExtension "9:LOCK";
    systemchat "extDB3: Connected to Database";
} else {
    valor_sql_id = uiNamespace getVariable "valor_sql_id";
    systemchat "extDB3: Still Connected to Database";
};


if (_extDBNotLoaded isEqualType []) exitWith {
    Valor_Server_loaded = false;
    publicVariable "Valor_Server_loaded";
};
HC_AVAILABLE = true;


systemchat "Valor :: setting Variables";
[] call valor_fnc_vars;
[] call valor_fnc_init_vars;
if(isnil "VALOR_SERVER_STARTING") then {
    systemchat "Valor :: HC is starting everything";
    [] call valor_fnc_init_loottable;
    systemchat "Valor :: Variables set";
    systemchat "Valor :: Starting sold items init";
    [] call valor_fnc_init_sold_items;
    systemchat "Valor :: sold items init finished";
    systemchat "Valor :: Starting Time Module";
    [] spawn valor_fnc_time_module;
    systemchat "Valor :: Starting Base Init";
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
    systemchat "Valor :: Base init finished";
    [] call valor_fnc_init_map;
    systemchat "Valor :: Init Vehicles";
    [] spawn valor_fnc_init_vehicles;
    waitUntil {!isnil "Valor_vehicles_init_finished"};
    Valor_vehicles_init_finished = nil;
    systemchat "Valor :: Vehicles loaded";
    systemchat "Valor :: Loading Bandit Camps";
    0 call valor_fnc_spawn_bandits;
    systemchat "Valor :: Bandit Camps loaded";
    0 spawn valor_fnc_init_loot_drops;
    //systemchat "Valor :: Starting Zombie Destroyer";
    //[] spawn valor_fnc_zombie_destroyer;
    ["Update players set online = '0' where online = '1'",1] call valor_fnc_db_sync;


    systemchat "Valor :: Searching for Fuelstations";
    [] call valor_fnc_init_fuelstations;
    systemchat "Valor :: Fuelstations found and published";

    {
        systemchat format["Valor :: Releasing server for players in %1 seconds",_x];
        sleep 1;
    } foreach [10,9,8,7,6,5,4,3,2,1];
    publicVariable "Valor_Server_loaded";
    VALOR_SERVER_STARTING = false;
    publicVariable "VALOR_SERVER_STARTING";

} else {

    systemchat "Valor :: HC is starting something";
    //systemchat "Valor :: Starting Zombie Destroyer";
    //[] spawn valor_fnc_zombie_destroyer;
   // systemchat "Valor :: Starting Time Module";
    //[] spawn valor_fnc_time_module;

    [] remoteExec["valor_fnc_get_vehicle_monitor_list",2];
    [] spawn valor_fnc_persistent_vehicle_monitoring;
};

publicVariable "HC_AVAILABLE";

systemchat "----------------------------------------------------------------------------------------------------";
systemchat format ["               End of Valor HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
systemchat "----------------------------------------------------------------------------------------------------";