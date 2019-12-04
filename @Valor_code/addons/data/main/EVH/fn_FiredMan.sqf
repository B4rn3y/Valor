
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
    if(_weapon isEqualTo "MeleeHatchet" || (configname(inheritsFrom (configFile >> "CfgWeapons" >> _weapon))) isEqualTo "MeleeHatchet")then{
    	_trees = (nearestTerrainObjects [player, ["Tree"], 20] select {_x isEqualto cursorObject});
    	if !(_trees isEqualTo  [])then{
    		_oldDamage = damage cursorObject;
    		_treeHeight = (boundingBoxReal cursorObject)#1#2;
    		_newDamage = _oldDamage + _treeHeight / 100 * .5;
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
    		cursorObject setdamage _newDamage;
    	};
    };
};