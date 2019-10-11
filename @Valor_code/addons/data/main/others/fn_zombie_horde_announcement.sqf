private ["_outpost_name","_time","_minutes"];
_outpost_name = param[0,"",[""]];
_time = param[1,0,[0]];
_id = param[2,0,[0]];
iF(_time isEqualTo 0) exitWith {};

_minutes = round (_time / 60);
switch (_id) do
{
	case 0:
	{

		[format["<t color='#ff0000' size = '.8'>Warning!<br />A zombie horde is approaching the %1 Outpost! ETA: %2 Minutes</t>",_outpost_name,_minutes],-1,1,15,1,0,789] spawn BIS_fnc_dynamicText;
		playsound "horde_sound";
	};

	case 1:
	{
		[format["<t color='#ff0000' size = '.8'>Attention!<br />The zombie horde is leaving the %1 Outpost!</t>",_outpost_name,_minutes],-1,1,15,1,0,789] spawn BIS_fnc_dynamicText;
	};

	case 2:
	{
		[format["<t color='#ff0000' size = '.8'>Attention!<br />The %1 Outpost was lost to the horde!</t>",_outpost_name,_minutes],-1,1,15,1,0,789] spawn BIS_fnc_dynamicText;
	};
};


