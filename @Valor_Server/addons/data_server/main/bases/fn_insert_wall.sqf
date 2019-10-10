


private ["_requester","_objects","_group_id","_blueprint_itembox","_classname","_pos","_dir","_vec","_query","_obj","_h","_doors"];

_requester = param[0,objNull,[objNull]];
_objects = param[1,[],[[]]];
_group_id = param[2,-1,[0]];



if(isnull _requester) exitWith {diag_log "Valor Error :: _requester unknown"};
if(_group_id isEqualTo -1) exitWith {diag_log "Valor Error :: _group_id unknown"};
if(_objects isEqualTo []) exitWith {diag_log "Valor Error :: _blueprint_itembox unknown"};




{
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_vec = _x select 3;
	_query = format["INSERT INTO base_objects (classname, pos, dir, vector,inventory, group_id, wall, base_id,layout_id) VALUES('%1', '%2','%3','%4','[]','%5','1','-1','[]')",(str _classname),_pos,_dir,_vec,_group_id];
	[_query,1] call valor_fnc_db_sync;

} foreach _objects;


_h = 23;
{
	_obj = nil;
	_h = _h + 10;
	_classname = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_vec = _x select 3;
	_obj = _classname createVehicle [0,0,_h];
	waitUntil {!isnil "_obj"};
	waitUntil {!isnull _obj};
	_obj allowDamage false;
	_doors = switch (typeof _object) do
	{
		case "Land_Garaz_long_open":
		{
			6
		};

		case "Land_Gate_IndVar2_5":
		{
			2
		};

		default
		{
			getNumber(configFile >> "CfgVehicles" >> (typeOf _object) >> "numberOfDoors");
		};
	};
	if(_doors isEqualTo 0) then {
		_obj enableSimulation false;
	};
	_obj setdir _dir;
	_obj setVectorUp _vec;
	_obj setposatl _pos;
	_obj setvariable["valor_wall_ids",[-1,_group_id],true];

} foreach _objects;





//[format["The Base got inserted into the database, now put the required items into the crate and build the base"]]remoteExec["valor_fnc_exp_hint",_requester];

