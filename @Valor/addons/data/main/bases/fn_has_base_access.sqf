
private ["_base_id","_nets_close","_ret","_pid","_var","_entry_list","_entry"];
_base_id = param[0,-1,[0]];
if(_base_id isEqualTo -1) exitWith {false};

_nets_close = nearestObjects[player,["B_CargoNet_01_ammo_F"],150];
_ret = false;
_group = -2;
_pid = getPlayerUID player;

if!(isnil "Valor_group") then {
	if!(Valor_group isEqualTo []) then {
		_group = Valor_group select 0;
	};
};

{
	_var = _x getVariable["valor_base_ids",[-1,-1,-1]];
	if((_var select 0) isEqualTo _base_id) exitWith {
		if((count _var) isEqualTo 3) then {
			_ret = true;
		} else {
			_entry_list = _var select 3;
			_entry = [];
			{
				_entry pushBack (_x select 0);
			} foreach _entry_list;
			if(_pid in _entry || _group in _entry) then {
				_ret = true;
			};
		};
	};


} foreach _nets_close;


_ret