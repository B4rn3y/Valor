private ["_assigned","_item_info","_item_name","_item_amount","_item_text","_time","_cP","_cpUp"];

// this addaction["Mine", valor_fnc_harvestitem,["valor_Land_Cliff_stone_medium_F",2,"Mining Stone"],1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"]
// this addaction["Collect", valor_fnc_harvestitem,["valor_woodenlog",2,"Sawing logs","valor_woodenboard"],1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"]


_assigned = _this select 0;
_item_info = _this select 3; // "valor_Land_Cliff_stone_medium_F" "valor_Land_WoodenLog_F"

(_this select 3) params [
	["_item_name", "", [""]],
	["_item_amount", 1, [0]],
	["_item_text", "Harvesting...",[""]],
	["_process_from", "", [""]]
];

if(isnil "_item_info") exitWith {};
if(_item_info isEqualTo []) exitWith {};
if!(isnil "valor_is_processing") exitWith {};

if(_process_from != "" && !(_process_from in ((uniformitems player)+(vestItems player)+(backpackItems player)))) exitWith {["Missing "+(getText >> "CfgWeapons" >> _process_from >> "displayName")+"!"]call valor_fnc_exp_hint;};

_item_amount = _item_amount + (missionNamespace getvariable["Valor_skill_Miner",0]);
player action ["SwitchWeapon", player, player, 100];

valor_is_processing = true;
[_assigned,_item_text] spawn valor_fnc_processevh;
_time = 0.2;
_cP = 0.01;
_cpUp = 0.01;
_id = player addaction["Cancel",{Valor_interrupt = true;}];
while{true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			sleep 0.35;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep _time;
	_cP = _cP + _cpUp;
	_assigned setvariable["percent",_cP * 100];

	if(_cP >= 1) exitWith {};
	if(player distance _assigned > 10) exitWith {};
	if((vehicle player) != player) exitWith {};
	if!(alive player) exitWith {};
	if(!isnil "Valor_interrupt") exitWith {};
};
player removeAction _id;
player switchmove "";
if(!isnil "Valor_interrupt") exitWith {valor_is_processing=nil;Valor_interrupt = niL;};
Valor_interrupt = niL;
if!(alive player) exitWith {valor_is_processing=nil;};
if(player distance _assigned > 10) exitWith { systemchat "Valor :: You moved too far away!";valor_is_processing=nil;};
if((vehicle player) != player) exitWith {systemchat "Valor :: You cant do that in a vehicle!"; valor_is_processing = nil;};

player removeItem _process_from;
[_item_name,_item_amount] call valor_fnc_additem;
valor_is_processing = nil;