private ["_display","_header","_listbox","_side"];
closeDialog 0;
if(!createDialog "SpawnMenu") exitWith {hint "Some Error creating Spawning Dialog"};
titleText["","BLACK"];
_display = findDisplay 3001;
_header = _display displayCtrl 1000;
_listbox = _display displayCtrl 1500;

_side = switch (playerside) do
{
	case civilian:
	{
		"civilian_spawnPoints"
	};

	case west:
	{
		"west_spawnPoints"
	};

	case independent:
	{
		"independent_spawnPoints"
	};
};


{
	_id = _listbox lbadd (_x select 0);
	_listbox lbSetPicture[_id,(_x select 1)];
} foreach (getarray(configFile >> "Valor_Settings" >> "Spawn_Points" >> _side));