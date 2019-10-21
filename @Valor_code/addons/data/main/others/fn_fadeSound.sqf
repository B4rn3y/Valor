/*
	File: fn_fadeSound.sqf
	Auhtor: Michael Francis

	Description:
	Fades out sound.
*/

private ["_possibleFade","_fadeTo"];

_possibleFade = [1,0.5,0.25,0.1,0.01]; //Werte in %

if(isnil "Valor_fadeSound") then {Valor_fadeSound = 0;};

Valor_fadeSound = (Valor_fadeSound + 1) % (count _possibleFade);


_fadeTo = (_possibleFade select Valor_fadeSound);

1 fadeSound _fadeTo;

if (_fadeTo < 1) then
{
	cutText [format["Game Sound lowered: %1%2 \n '0' for normal sound",_fadeTo*100,"%"], "PLAIN DOWN",0.5];
}
else
{
	cutText ["Sound is normal.", "PLAIN DOWN",0.5];
};