_yesOrNo = param[0,false,[false]];
disableSerialization;

5 cutText ["","PLAIN",6];

if(_yesOrNo) then {
	if(getplayeruid player in ["76561198018512569"]) then {Valor_debug = true;};
	Valor_Init_done = true;
};