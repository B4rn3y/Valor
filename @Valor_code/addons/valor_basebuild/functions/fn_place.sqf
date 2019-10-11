a = createSimpleObject ["P:\valor_basebuild\models\barricade_small2.p3d",getposasl player];

onEachFrame{
	_line = (lineIntersectsSurfaces [eyePos player, eyePos player vectoradd ((getCameraViewDirection player)vectorMultiply 5), player, a, true, 1,"VIEW","FIRE"]);
	hintSilent str _line;
	if (_line isEqualTo [])then{
		a setposatl (player modelToWorld [0,2,1]);
		_dir = vectorDir player;
		a setVectorDirAndUp[_dir,[0,0,1]];
	}else{
		_line = _line select 0;
		a setposasl (_line select 0);
		_dir = _line select 1;
		a setVectorDirAndUp[_dir,[0,0,1]];
	};
};

getSelections = {
_obj = param [0, objNull, [objNull]];
_selections = [];
_id = 0;
while {true} do
{
	_pos = _obj selectionPosition ["a"+str _id, "Memory"];
	if (_pos isEqualTo [0,0,0])exitWith{};
	_selections pushBack _pos;
	_id = _id+1;
};
_selections;
};

toWall = 0;

onEachFrame{

	_selections = (a call getSelections);
	_castData = [];
	//start,end,isWall,rangeToStart
	_eyepos = eyepos player;
	_closestIndex = -1;
	_closestDis = 1e6;
	{

		_sideVec = ((getCameraViewDirection player) vectorCrossProduct[0,0,1]);
		_startPos = _eyepos vectorAdd (_sideVec vectorMultiply (_x select 0)) vectorAdd ((_sideVec vectorCrossProduct (getCameraViewDirection player))vectorMultiply (_x select 2));

		//drawLine3D[ASLtoAGL _eyepos, ASLtoAGL _startPos,[0,0,0,1]];0
		_endPos = _startPos vectoradd ((getCameraViewDirection player)vectorMultiply 3.5);
		_line = lineIntersectsSurfaces [_startPos,_endPos,player,a,true,1,"FIRE","VIEW"];

		if (_line isEqualTo [])then{
			_castData pushBack [_startPos,_endPos,false];
		}else{
			_castData pushBack [_startPos,(_line select 0 select 0),true];
			_dis = (_line select 0 select 0)vectorDistance _startPos;
			if (_dis < _closestDis)then{_closestDis = _dis; _closestIndex = (count _castData)-1};
		};
	} forEach _selections;

	if !(_closestIndex isEqualTo -1)then{
		_startPos = (_castData select _closestIndex)select 0;
		_endPos = ((_castData select _closestIndex)select 1);
		_endPos = _endPos vectoradd ((_endPos vectorDiff _startPos)vectorMultiply toWall);
		drawLine3D[ASLtoAGL _startPos, ASLtoAGL _endPos,[0,0,0,1]];
		_sel = (_selections select _closestIndex);

		_main = vectorNormalized(_endPos vectorDiff _startPos);
		_side = (_main vectorCrossProduct [0,0,1]);
		_pos = _endpos vectoradd (_side vectorMultiply -(_sel select 0)) vectoradd ((_side vectorCrossProduct _main) vectorMultiply -(_sel select 2));
		a setposasl _pos;
		a setVectorDirAndUp[(_main vectorCrossProduct [0,0,1]) vectorCrossProduct [0,0,1],[0,0,1]];
	}else{
		a setposasl [0,0,0];
	};
};

player addEventHandler ["fired",{a = createSimpleObject ["P:\valor_basebuild\models\barricade_small2.p3d",getposasl player];player disableCollisionWith a}];