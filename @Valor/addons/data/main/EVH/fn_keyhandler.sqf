_code = _this select 1;
_shift = _this select 2;
_strg = _this select 3;
_alt = _this select 4;

_handle = false;

switch (_code) do
{
	case 1: //ESC
	{
		[] spawn valor_fnc_escInterupt;
	};
};

switch (true) do
{
	case (_code in (actionKeys "compass")):
	{
		["compass",valor_fnc_3DCompass] call valor_fnc_stackOnEachFrame;
		_handle = true;
	};

	case (_code isEqualTo 19 && _shift): //RESTRAIN R + Shift
	{
		[] spawn valor_fnc_restrainAction;
	};
};
_handle;