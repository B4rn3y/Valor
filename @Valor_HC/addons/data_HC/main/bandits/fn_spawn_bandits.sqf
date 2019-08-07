
private ["_markertext","_bandit_gear","_positions","_watch_position","_markerpos","_marker","_pos","_dir","_soldier"];


_markertext = "Bandit Camp";
_bandit_gear = ["CUP_U_O_TK_Green","","CUP_arifle_AK47_Early",["","","",""],["CUP_30Rnd_762x39_AK47_M"],"",["","","",""],[],"",["","","",""],[],["CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M"],"V_PlateCarrier1_wdl",["CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_762x39_AK47_M"],"H_Booniehat_khk_hs","",["ItemMap","ItemCompass"],[]];



////// novy sobor

_positions = [[[7072.35,7691.81,3.05475],156.997],[[7064.94,7689.46,3.05579],158.646],[[7060.48,7690.99,3.05475],248.2],[[7057.97,7698.43,3.05579],247.413],[[7069.72,7709.87,0.127045],161.45],[[7076.73,7712.49,0.146271],164.775],[[7089.87,7697.2,3.05475],161.811],[[7082.47,7694.88,3.05579],162.265],[[7073.1,7722.59,0.102142],161.032],[[7067.45,7720.65,0.102173],161.032],[[7063.91,7733.01,0.127197],154.086],[[7068.39,7734.84,0.143463],162.988],[[7056.43,7742.02,0.00143433],1.86059]];
_watch_position = [7080.2,7684.68,0.00143433];
_markerpos = [7073.58,7711.83,0.00134277];

_marker = createMarker ["marker_novy_bandits", _markerpos];
_marker setMarkerType "o_art";
_marker setMarkerBrush "Solid";
_marker setMarkerText _markertext;

{
	_pos = _x select 0;
	_dir = _x select 1;
	_soldier = (createGroup independent) createUnit["I_Soldier_AR_F",_pos,[],0,"CAN_COLLIDE"];
	_soldier setposatl _pos;
	_soldier setdir _dir;
	[_bandit_gear,_soldier] call valor_fnc_var_to_gear_object;
	_soldier doWatch _watch_position;
} foreach _positions;







////// little island up north

_positions = [[[14506.7,13117.9,17.6263],283.155],[[14532,13129.8,19.6852],13.3453],[[14540.4,13114.9,21.5093],22.5787],[[14543.4,13090.9,23.7029],149.764],[[14518.1,13084.9,24.741],259.431],[[14526.7,13104.2,22.6584],258.849],[[14525.3,13107.2,22.4639],233.509],[[14535.5,13103,41.044],246.773],[[14514,13100,22.2855],251.978],[[14503.3,13100.8,18.9186],252.485]];
_watch_position = [14340,12992.7,0.00170994];
_markerpos = [14532.2,13100.6,0.00143814];

_marker = createMarker ["marker_island_north_bandits", _markerpos];
_marker setMarkerType "o_art";
_marker setMarkerBrush "Solid";
_marker setMarkerText _markertext;

{
	_pos = _x select 0;
	_dir = _x select 1;
	_soldier = (createGroup independent) createUnit["I_Soldier_AR_F",_pos,[],0,"CAN_COLLIDE"];
	_soldier setposatl _pos;
	_soldier setdir _dir;
	[_bandit_gear,_soldier] call valor_fnc_var_to_gear_object;
	_soldier doWatch _watch_position;
} foreach _positions;