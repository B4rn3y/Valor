disableSerialization;
_progress = param [0,0,[0]];
_contorl = (findDisplay 46) displayCtrl 4646;
if(isNull _contorl)then{
	_contorl = (findDisplay 46) ctrlCreate ["RscPictureKeepAspect", 4646];
};
if(_progress < 0 || _progress > 1)exitWith{
	_contorl ctrlSetFade 1;
	_contorl ctrlCommit 0;
};
_contorl ctrlSetFade 0;
_contorl ctrlSetText format["a3\ui_f\data\igui\cfg\holdactions\progress\progress_%1_ca.paa",round (_progress*24)];
_s = 0.1;
_contorl ctrlSetPosition [0.5-_s/2,0.5-_s/2,_s,_s];
_contorl ctrlCommit 0;
_contorl ctrlSetFade 1;
_contorl ctrlCommit 1.5;