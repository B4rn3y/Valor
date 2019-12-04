
private ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_vehicle","_time_passed_allowed","_pos","_time","_distance_change","_distance_hear","_distance_hear_silenced","_silenced"];
params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

_time_passed_allowed = 40;

_pos = (_unit getvariable["valor_shot_pos",[[0,0,0],0,0]]) select 0;
_time = (_unit getvariable["valor_shot_pos",[[0,0,0],0,0]]) select 2;

_distance_change = 10;
_distance_hear = 120;
_distance_hear_silenced = 0;


_silenced = false;
if(((_unit distance _pos) > _distance_change) || (serverTime > (_time + _time_passed_allowed))) then {
	if(isnull _vehicle) then {
		if(_weapon isEqualTo (primaryWeapon player)) then {
			_silenced = if(((primaryWeaponItems _unit) select 0) isEqualTo "") then {false} else {true};
		};
		if(_silenced) then {
			if(_distance_hear_silenced > 0) then {
				player setVariable["valor_shot_pos",[getposatl player,_distance_hear_silenced,serverTime],true];
			};
		} else {
			player setVariable["valor_shot_pos",[getposatl player,_distance_hear,serverTime],true];
		};

	} else {
		player setVariable["valor_shot_pos",[getposatl player,_distance_hear,serverTime],true];
	};
};

if (_ammo isKindOf "Melee")then{
	_meleeCfg = (configFile >> "CfgAmmo" >> _ammo >> "Melee");
    _anim = getText (_meleeCfg >> "anim");
    _unit playActionNow _anim;
    _sounds = getArray (_meleeCfg >> "sounds");
    _sound = selectRandom _sounds;
    playSound3D [(_sound select 0),_unit, false, getPosASL _unit, (_sound select 1), (_sound select 2), (_sound select 3)];

    _bodyPos = getposasl player vectoradd [0,0,1];
    _searchDistance = 1.3;
    _interObjs = lineIntersectsWith  [_bodyPos,_bodyPos vectoradd ((eyeDirection player) vectorMultiply _searchDistance), player, objNull, true];
    if(_interObjs isEqualTo [])then{
    	if !(isnull cursorObject)then{
    		_toCursor = vectornormalized (_bodyPos  vectorFromTo (getposasl cursorObject));
    		_interObjs = lineIntersectsWith  [eyePos player,_bodyPos vectoradd (_toCursor vectorMultiply _searchDistance), player, objNull, true];
    	};
    };
    if(_interObjs isEqualTo [])exitWith{};
    _obj = _interObjs # ((count _interObjs) - 1);	//closest obj
    if(_weapon isEqualTo "MeleeHatchet" || (configname(inheritsFrom (configFile >> "CfgWeapons" >> _weapon))) isEqualTo "MeleeHatchet")then{
    	_trees = (nearestTerrainObjects [player, ["Tree","SMALL TREE"], 20] select {_x isEqualto _obj});
    	if !(_trees isEqualTo  [])then{
    		_oldDamage = damage _obj;
    		if(_oldDamage >= 1)exitWith{};
    		_treeHeight = (boundingBoxReal _obj)#1#2;
    		_newDamage = _oldDamage + 1 / _treeHeight * getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "tree_damage_mult");
    		if(_newDamage >= 1)then{
    			_item = "valor_woodenlog";
				_item_amount = round (_treeHeight * getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "tree_wood_spawn_mult"));
				_near_holder = nearestObjects[player,["groundweaponholder"],1];
				if!(_near_holder isEqualTo []) then {
				    _holder = _near_holder select 0;
				    _holder addItemCargoGlobal [_item, _item_amount];
				} else {
				    _holder =  createVehicle ["groundweaponholder",(getposatl player), [], 0, "can_Collide"];
				    _holder addItemCargoGlobal [_item, _item_amount];
				};
    		};
    		_obj setdamage _newDamage;
    	};
    };

    if(_weapon isEqualTo "MeleePickaxe" || (configname(inheritsFrom (configFile >> "CfgWeapons" >> _weapon))) isEqualTo "MeleePickaxe")then{
		if(getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "rock_only_in_query") > 0 && player distance (markerPos "marker_10") > 50) exitWith{};
		_model = (getModelInfo _obj)#0;
		if("rock" in _model || "boulder" in _model || "zula" in _model || "stone" in _model)then{
			_oldDamage = damage _obj;
	    	_newDamage = _oldDamage + getNumber(missionConfigFile >> "Valor_settings" >> "settings" >> "rock_damage");
	    	_obj setdamage _newDamage;
	    	playSound3D ["breakingpoint_jsrs\sounds\Generic1.wav", player];
	    	if(_newDamage >= 1)then{
	    		_obj setDamage 0;
	    		_item = "valor_cliff_stone_medium";
				_item_amount = 1;
				_near_holder = nearestObjects[player,["groundweaponholder"],1];
				if!(_near_holder isEqualTo []) then {
				    _holder = _near_holder select 0;
				    _holder addItemCargoGlobal [_item, _item_amount];
				} else {
				    _holder =  createVehicle ["groundweaponholder",(getposatl player), [], 0, "can_Collide"];
				    _holder addItemCargoGlobal [_item, _item_amount];
				};
	    	};
		};
	};
};
}];

