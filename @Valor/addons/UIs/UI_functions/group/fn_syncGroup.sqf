
private ["_index","_group_id","_data"];
_index = param[0,-1,[0]];
_group_id = param[1,-1,[0]];
_data = param[2,[],[[]]];
if(_index isEqualTo -1 || _group_id isEqualTo -1) exitWith {};


switch (_index) do
{
	case 0:
	{
		Valor_group set[1,_data];
	};

	case 1:
	{
		Valor_group = [];
	};

	case 2:
	{
		Valor_group = _data;
	};
};

if!(isnull (finddisplay 3004)) then {[true] call valor_fnc_opengroupmenu;};
