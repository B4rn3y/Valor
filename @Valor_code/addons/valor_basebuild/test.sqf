{deleteVehicle _x}foreach objs;

cs = {
	_pos = param [0, getposASL player, [[]]];
	_vecDir = vectornormalized param [1, [0,1,0], [[]]];


	objs = [];
	base = createSimpleObject["valor_basebuild\models\stronghold_base.p3d",_pos vectoradd [0,0,-10]];
	base setVectorDir _vecDir;
	objs pushBack base;
	_xDir = vectornormalized(_vecDir vectorCrossProduct [0,0,1]);


	{
		_obj = createSimpleObject[
			_x select 0,
			_pos vectoradd ( _xDir vectorMultiply (_x select 1 select 0))vectoradd (_vecDir vectorMultiply (_x select 1 select 1))vectoradd [0,0,_x select 1 select 2]
		];
		_obj setVectorDir ([_vecDir,_x select 2]call BIS_fnc_rotateVector2D);
		objs pushBack _obj;
	}foreach
	[
		["ca\structures\castle\A_Castle_Bergfrit.p3d",[15.5,16,4],90],
		["ca\structures\castle\A_Castle_Bergfrit.p3d",[-15.5,16,4],90],
		["ca\structures\castle\a_castle_gate.p3d",[0,16,5],0],
		["ca\structures\castle\a_castle_donjon.p3d",[15,-16,8],0],
		["ca\structures\castle\a_castle_donjon.p3d",[-15,-16,8],0],
		["ca\structures\castle\A_Castle_Wall1_20.p3d",[-0.1,-19,5],180],
		["ca\structures\castle\A_Castle_Wall1_20.p3d",[19,1,5],-90],
		["ca\structures\castle\A_Castle_Wall1_20.p3d",[-19,1,5],90]
	];
};

[getposasl player vectoradd [0,0,0.5],vectordir player]call cs;