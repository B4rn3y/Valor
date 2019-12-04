


private ["_pos"];

_units = nearestObjects[(visiblePosition player),["Man"],10];

_units = _units - [player];



{
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && isPlayer _x && ((vehicle _x) isEqualTo _x)) then {

		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Box_NATO_Wps_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			case "Land_InfoStand_V1_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Noticeboard_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.6]};
		};

		drawIcon3D ["", [1,1,1,1], _pos, 0, 0, 0, name _x, 1, 0.035, "PuristaMedium"];
	};
} foreach _units;