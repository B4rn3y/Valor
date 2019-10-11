




private ["_found"];
playsound "refuel";
_found = [];
{
	if(_x isEqualTo "valor_canisterfuel_empty") then {
		_found pushBack "uniform";
		player removeitem "valor_canisterfuel_empty";
	};

} foreach (uniformitems player);

{
	if(_x isEqualTo "valor_canisterfuel_empty") then {
		_found pushBack "vest";
		player removeitem "valor_canisterfuel_empty";
	};

} foreach (vestItems player);

{
	if(_x isEqualTo "valor_canisterfuel_empty") then {
		_found pushBack "backpack";
		player removeitem "valor_canisterfuel_empty";
	};

} foreach (backpackitems player);


{
	switch (_x) do
	{
		case "uniform":
		{
			player addItemToUniform "valor_canisterfuel";
		};
		case "vest":
		{
			player addItemToVest "valor_canisterfuel";
		};
		case "backpack":
		{
			player addItemToBackpack "valor_canisterfuel";
		};
	};

} foreach _found;





