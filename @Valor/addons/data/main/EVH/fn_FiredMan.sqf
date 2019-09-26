private ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_vehicle","_pos","_distance_change","_distance_hear","_distance_hear_silenced","_silenced"];
params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

_pos = (_unit getvariable["valor_shot_pos",[[0,0,0],0]]) select 0;

_distance_change = 10;
_distance_hear = 75;
_distance_hear_silenced = 0;


_silenced = false;
if((_unit distance _pos) > _distance_change) then {
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