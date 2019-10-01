

private ["_originalTarget","_assigned","_item_info","_item_name","_item_amount","_item_text","_percentage_find","_time","_cP","_cpUp","_rnd"];
// this addaction["Mine", valor_fnc_harvestitem,["valor_Land_Cliff_stone_medium_F",2,"Mining Stone.."],1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"]
// this addaction["Collect", valor_fnc_harvestitem,["valor_Land_WoodenLog_F",2,"Collecting logs.."],1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"]
// this addaction["Collect", valor_fnc_collect_egg,["Valor_raptor_egg",2,"Searching.."],1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"]
_assigned = _this select 0;
_item_info = _this select 3; // "valor_Land_Cliff_stone_medium_F" "valor_Land_WoodenLog_F"
if(isnil "_item_info") exitWith {};
if(_item_info isEqualTo []) exitWith {};
if!(isnil "valor_is_processing") exitWith {};
_item_name = _item_info select 0;
_item_amount = _item_info select 1;
_item_text = _item_info select 2;
_percentage_find = 2 + (missionNamespace getvariable["Valor_skill_Paleontologist",0]);



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
if(player distance _assigned > 10) exitWith {["Valor :: You moved too far away!"] spawn valor_Fnc_exp_hint;valor_is_processing=nil;};
if((vehicle player) != player) exitWith {["Valor :: You cant do that in a vehicle!"] spawn valor_Fnc_exp_hint; valor_is_processing = nil;};

_rnd = random 100;
if!(_rnd <=_percentage_find ) then {
	["Valor :: You havent found anything T_T"] spawn valor_Fnc_exp_hint;
} else {
	["Valor :: YOU FOUND AN EGG!!"] spawn valor_Fnc_exp_hint;
	[_item_name,_item_amount] call valor_fnc_additem;
};

valor_is_processing = nil;