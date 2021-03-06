// Setup the Map Hidement
//0 spawn valor_fnc_setup_map_hidement; //sqf



// start FSM for discovering map

0 spawn valor_fnc_setup_map_hidement;
waitUntil {!isnil "VALOR_MAP_HIDEMENT_DONE"};

// Starting player monitoring for syncing player information to server/database
[] spawn valor_fnc_player_monitor;

0 spawn valor_fnc_init_traders;

0 spawn valor_fnc_init_radiation_zones;

0 spawn valor_fnc_init_bloodsucker_zones;

0 call valor_fnc_initcorpses;

// Starting player hunger/thirst system

[getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Hunger_multiplier"),getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Thirst_multiplier")] spawn valor_fnc_survival;


// if player is in the Survival Zone start the zombie management and the Loot spawning system

[] spawn valor_fnc_zombieMainMonitoring; // fsm

	// WIP




(All_loot_tables select 0) addPublicVariableEventHandler {0 call valor_fnc_check_config;};


0 call valor_fnc_check_config;
0 spawn valor_fnc_loot_spawn_system;




// Now look what part of the map the player discovered and remove hidement for it;
//0 spawn valor_fnc_clear_map_hidement; // sqf

0 spawn valor_fnc_mapContentManagement; // fsm

0 spawn valor_fnc_initVehicles; // setup the Vehicle Repair actions

0 spawn valor_fnc_init_animals; // load actions for horses

0 spawn valor_fnc_init_outposts_client; // setup the outposts

0 spawn valor_fnc_init_bases_client;  // hide trees near bases

0 spawn valor_fnc_init_skills;  // init the skills

0 call valor_fnc_setupHUD;

if(getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "fatigue_enabled") isEqualTo 0) then {player enableFatigue false;} else {player enableFatigue true;};



//player addEventHandler["GetInMan",{_this spawn valor_fnc_GetInEVH}];
player addEventHandler["Killed", {_this spawn valor_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{}];
player addEventHandler["Respawn", {}];
player addEventHandler["InventoryClosed", {_this call valor_fnc_inventory_closed}];
player addEventHandler["InventoryOpened", {_this spawn valor_fnc_inventory_opened}];
player addEventHandler["Put", {_this call valor_fnc_on_put}];
player addEventHandler["Take", {_this call valor_fnc_on_take}];
player addEventHandler["GetOutMan",{_this call valor_fnc_GetOutMan}];
player addEventHandler["FiredMan",{_this call valor_fnc_FiredMan}];
player removeAllMPEventHandlers "MPHit";
player removeAllMPEventHandlers "MPKilled";
player removeAllMPEventHandlers "MPRespawn";

removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Ended";

onEachFrame {};

addMissionEventHandler ["EachFrame",valor_fnc_onEachFrameHandler];

addMissionEventHandler ["Ended",{}];

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";

0 spawn{(findDisplay 46) displayAddEventHandler ["KeyDown",valor_fnc_keyhandler];};
0 spawn{(findDisplay 46) displayAddEventHandler ["KeyUp",valor_fnc_keyUp];};
0 spawn{(findDisplay 46) displayAddEventHandler ["MouseButtonDown",valor_fnc_mouseButtonDown];};

[player] joinSilent (createGroup opfor);

0 spawn {
	Valor_functions_started = true;
	sleep 10;
	Valor_functions_started = nil;
};

0 spawn {
	waitUntil {player getVariable ["AUR_Actions_Loaded",false]};
	player removeAction ((actionids player select {(player actionParams _x)#0 isEqualTo "Rappel Self"})#0);
	player addAction ["Rappel Self", {
		[player, vehicle player] call AUR_Rappel_Action;
	}, nil, 0, false, true, "", "[player] call AUR_Rappel_Action_Check && ""valor_hook"" in items player"];
};

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