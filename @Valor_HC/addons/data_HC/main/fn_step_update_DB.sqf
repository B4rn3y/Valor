
private ["_mode","_side","_query","_gear","_cash","_bankacc","_money","_stats","_alive","_pos","_arrested","_playtime","_xp_info","_class_info","_stat_info"];
_mode = param[0,-1,[1]];
_uid = param[1,"",[""]];
_side = param[2,sideUnknown,[west]];

if(_mode isEqualTo -1 || _uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {diag_log "Valor :: Error @ step_update"};

_query = "";
switch (_mode) do
{
	case 0:
	{
		_gear = param[3,"",["",[]]];
		switch (_side) do
		{
			case opfor:
			{
				_query = format["Update players set gear_cop = '%1' where pid = '%2'",_gear,_uid];
			};

			case civilian:
			{
				_query = format["Update players set gear = '%1' where pid = '%2'",_gear,_uid];
			};
		};


	};

	case 1:
	{
		_cash = param[3,0,[0]];
		_query = format["Update players set cash = '%1' where pid = '%2'",_cash,_uid];

	};

	case 2:
	{
		_bankacc = param[3,0,[0]];
		_query = format["Update players set bankacc = '%1' where pid = '%2'",_bankacc,_uid];

	};

	case 3:
	{
		_money = param[3,[0,5000],[[]]];
		_query = format["Update players set cash = '%1', bankacc = '%2' where pid = '%3'",(_money select 0),(_money select 1),_uid];

	};

	case 4:
	{
		_stats = param[3,"""[100,100,12000]""",["",[]]];

		switch (_side) do
		{
			case opfor:
			{
				_query = format["Update players set stats_cop = '%1' where pid = '%2'",_stats,_uid];
			};

			case civilian:
			{
				_query = format["Update players set stats = '%1' where pid = '%2'",_stats,_uid];
			};
		};


	};

	case 5:
	{
		_alive = param[3,1,[1]];

		switch (_side) do
		{
			case opfor:
			{
				_query = format["Update players set alive_cop = '%1' where pid = '%2'",_alive,_uid];
			};

			case civilian:
			{
				_query = format["Update players set alive = '%1' where pid = '%2'",_alive,_uid];
			};
		};

	};

	case 6:
	{
		_pos = param[3,"""[]""",[1,"",[]]];

		switch (_side) do
		{
			case opfor:
			{
				_query = format["Update players set position_cop = '%1' where pid = '%2'",_pos,_uid];
			};

			case civilian:
			{
				_query = format["Update players set position = '%1' where pid = '%2'",_pos,_uid];
			};
		};


	};

	case 7:
	{
		_arrested = param[3,0,[0]];
		_query = format["Update players set arrested = '%1' where pid = '%2'",_arrested,_uid];

	};

	case 8:
	{
		_playtime = param[3,0,[0]];
		_query = format["Update players set playtime = '%1' where pid = '%2'",_playtime,_uid];

	};

	case 9:
	{
		_playtime = param[3,"""[]""",["",[]]];
		_query = format["Update players set Map = '%1' where pid = '%2'",_playtime,_uid];

	};

	case 11:
	{
		_xp_info = param[3,[],["",[]]];
		if(_xp_info isEqualTo []) exitWith {};
		_query = format["Update players set xp = '%1', level = '%3' where pid = '%2'",(_xp_info select 0),_uid,(_xp_info select 1)];

	};

	case 12:
	{
		_class_info = param[3,[],["",[]]];
		if(_class_info isEqualTo []) exitWith {};
		_query = format["Update players set classes = '%1' where pid = '%2'",_class_info,_uid];

	};

	case 13:
	{
		_stat_info = param[3,[],["",[]]];
		if(_stat_info isEqualTo []) exitWith {};
		_query = format["Update players set humanity = '%1', stats_killed = '%3' where pid = '%2'",(_stat_info select 0),_uid,(_stat_info select 1)];

	};
};


if!(_query isEqualTo "") then {
	[_query,1] call valor_fnc_db_sync;
};