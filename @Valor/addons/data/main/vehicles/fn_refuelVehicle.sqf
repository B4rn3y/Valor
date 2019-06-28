



private ["_vehicle","_MaxfuelAmount","_Actual_fuel","_fuel_in_Jerrycan"];
_vehicle = param[0,objNull,[objNull]];

if(isnull _vehicle) exitWith {};




if(["valor_canisterfuel",1,true] call valor_fnc_itemInInventory) then {
	_MaxfuelAmount = getnumber(configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapacity");
	_Actual_fuel = (fuel _vehicle) * _MaxfuelAmount;
	_fuel_in_Jerrycan = getnumber(missionConfigFile >> "Valor_settings" >> "settings" >> "Fuelcan_amount");
	_Actual_fuel = _Actual_fuel + _fuel_in_Jerrycan;
	_vehicle setfuel (_Actual_fuel / _MaxfuelAmount); // "valor_canisterfuel_empty"
	playsound "refuel";

	switch (true) do
	{
		case (player canAddItemToBackpack "valor_canisterfuel_empty"):
		{
			player addItemToBackpack "valor_canisterfuel_empty";
		};

		case (player canAddItemToVest "valor_canisterfuel_empty"):
		{
			player addItemToVest "valor_canisterfuel_empty";
		};

		case (player canAddItemToUniform "valor_canisterfuel_empty"):
		{
			player addItemToUniform "valor_canisterfuel_empty";
		};
	};

	if!(_vehicle getvariable["Update_this",false]) then {
		_vehicle setvariable["Update_this",true,true];
	};

	titleText[format["You filled %1l in the vehicle",_fuel_in_Jerrycan],"PLAIN DOWN",2];

} else {
	systemchat format["Valor :: You need a full Canister to do that :X"];
};




