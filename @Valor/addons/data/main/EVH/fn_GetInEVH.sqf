

private ["_player","_vehicle","_var","_mode","_number"];

_player = _this select 0;
_vehicle = _this select 2;


if(playerSide in [opfor,independent,blufor]) exitWith {};
_var = (_vehicle) getvariable "group_restricted";
if(isnil "_var") exitWith {};

_mode = _var select 0;
_number = _var select 1;

switch (_mode) do
{
	case 1:
	{
		if(isnil "valor_group") exitWith {waituntil{!(player isEqualTo vehicle player)};while {!(vehicle player isEqualTo player)} do {player action ["Eject", vehicle player];player action ["getOut", vehicle player];sleep 1;};};
		if(valor_group isEqualTo []) exitWith {waituntil{!(player isEqualTo vehicle player)};while {!(vehicle player isEqualTo player)} do {player action ["Eject", vehicle player];player action ["getOut", vehicle player];sleep 1;};};

		if!(_number isEqualTo (valor_group select 0)) exitWith {waituntil{!(player isEqualTo vehicle player)};while {!(vehicle player isEqualTo player)} do {player action ["Eject", vehicle player];player action ["getOut", vehicle player];sleep 1;};};
	};

	case -2:
	{
		waituntil{!(player isEqualTo vehicle player)};
		while {!(vehicle player isEqualTo player)} do {
			player action ["Eject", vehicle player];
			player action ["getOut", vehicle player];
			sleep 1;
		};
	};

	default
	{
		if!(_number isEqualTo (call compile getplayeruid player)) exitWith {waituntil{!(player isEqualTo vehicle player)};while {!(vehicle player isEqualTo player)} do {player action ["Eject", vehicle player];player action ["getOut", vehicle player];sleep 1;};};
	};
};



