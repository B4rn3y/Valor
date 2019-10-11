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

closeDialog 0;
_pos = [_markerPos,0,100,4,0] call BIS_fnc_findSafePos;

player setpos _pos;


0 call valor_fnc_closeLoadingScreen;

