
private ["_display","_header","_listbox","_side","_sel","_markerPos"];
disableSerialization;
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
_sel = lbcursel _listbox;
_markerPos = getmarkerpos (((getarray(missionconfigFile >> "Valor_Settings" >> "Spawn_Points" >> _side)) select _sel)select 2);


[((findDisplay 3001) displayCtrl 1001),1,0.1,_markerPos] spawn valor_fnc_setmapPosition;