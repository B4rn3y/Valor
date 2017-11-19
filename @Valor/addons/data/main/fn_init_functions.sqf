// Setup the Map Hidement
//0 spawn valor_fnc_setup_map_hidement; //sqf



// start FSM for discovering map
//[] spawn valor_fnc_mapContentManagement; // fsm

// Starting player monitoring for syncing player information to server/database
[] spawn valor_fnc_player_monitor;

// Starting player hunger/thirst system
[getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Hunger_multiplier"),getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Thirst_multiplier")] spawn valor_fnc_survival;


// if player is in the Survival Zone start the zombie management and the Loot spawning system

[] spawn valor_fnc_zombieMainMonitoring; // fsm

	// WIP


0 call valor_fnc_check_config;
0 spawn valor_fnc_loot_spawn_system;


// Now look what part of the map the player discovered and remove hidement for it;
//0 spawn valor_fnc_clear_map_hidement; // sqf


if(getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "fatigue_enabled") isEqualTo 0) then {player enableFatigue false;} else {player enableFatigue true;};





player addEventHandler["InventoryClosed", {_this call valor_fnc_inventory_closed}];
player removeAllMPEventHandlers "MPHit";
player removeAllMPEventHandlers "MPKilled";
player removeAllMPEventHandlers "MPRespawn";

removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Ended";

onEachFrame {};

addMissionEventHandler ["Ended",{  }];

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";

/* what i need to do
- loot spawn system
- implement my gang system
- write a market system
- make a z-menu
- make a car- ,weapon -, and clothing shop
- player monitoring system
- do some sort of chop chop
- locker system for gear saving
- crafting system
- wrtie a system to handle the persisten vehicles
- write a system for fuel statioins and refueling
- some things for player interaction e.g. restraining/hitting/jail/robbing
- spawn Menu
- make like a tazer
- garage for saving vehicles like altis life
- shop system for buying things
- atm menu
- a onplayerkelled function
- intro when 1st entering Server
- HUD




*/