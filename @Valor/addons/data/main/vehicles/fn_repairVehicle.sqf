


private ["_vehicle","_ADD_ID","_part","_item"];
_vehicle = param[0,objNull,[objNull]];
_ADD_ID = param[2,-1,[-1]];
_part = param[3,[],[[]]];
if(_part isEqualTo []) exitWith {};
if(isnull _vehicle) exitWith {};

_item = gettext(configFile >> "Vehicle_repair_config" >> "Repair_parts" >> (_part select 0));

if([_item,1,true] call valor_fnc_itemInInventory) then {
	_vehicle removeAction _ADD_ID;
	_vehicle setHitPointDamage [(_part select 1), 0];

} else {
	systemchat format["You need a %1 to repair this!",(gettext(configfile >> "cfgweapons" >> _item >> "displayname"))];
};




