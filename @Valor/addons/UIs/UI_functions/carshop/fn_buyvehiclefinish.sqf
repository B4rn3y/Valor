private ["_vehicle_ID","_price","_vehicle","_classname","_got_money_and_paid"];
_vehicle_ID = param[0,-1,[1337]];
_price = param[1,0,[1337]];
_vehicle = param[2,objNull,[objNull]];
_classname = param[3,"",[""]];

if(_vehicle_ID isEqualTo -1 || isnull _vehicle || _classname isEqualTo "" || _price isEqualTo 0) exitWith {};


// Some sort of checking money and substacting it
_got_money_and_paid = true;

iF(_got_money_and_paid) then {
	systemchat format["Valor :: You bought a %1",getText(configFile >> "CfgVehicles" >> _classname >> "displayName")];
} else {
	systemchat format["Valor :: You do not have enough money to pay for the %1. Deleting Vehicle...",getText(configFile >> "CfgVehicles" >> _classname >> "displayName")];
	[_vehicle_ID,_vehicle,_classname] remoteExec["valor_fnc_shopvehiclereset",2];
};



