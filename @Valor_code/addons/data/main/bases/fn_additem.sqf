
private ["_item_name","_amount","_added","_d"];

_item_name = param[0,"",[""]]; // "valor_Land_Cliff_stone_medium_F" "valor_Land_WoodenLog_F"
_amount = param[1,-1,[-1]];
if(_item_name isEqualTo "") exitWith {0};
if(_amount < 1) exitWith {0};

_added = 0;
for "_d" from 1 to _amount do {
	switch (true) do
	{
		case (player canAddItemToUniform _item_name):
		{
			player addItemToUniform _item_name;
			_added = _added + 1;
		};

		case (player canAddItemToVest _item_name):
		{
			player addItemToVest _item_name;
			_added = _added + 1;
		};

		case (player canAddItemToBackpack _item_name):
		{
			player addItemToBackpack _item_name;
			_added = _added + 1;
		};

	};
};

_added;