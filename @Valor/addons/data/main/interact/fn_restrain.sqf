

private["_cop","_player"];
_cop = param [0,Objnull,[Objnull]];
_player = player;
if(isNull _cop) exitWith {};



[] spawn
{
	_players_close = {
		_ret = false;
		{
			if(isplayer _x) exitWith {_ret = true;};
		} foreach (nearestObjects[player,["Man"],30] - [player]);
		_ret
	};


	private["_time"];
	while {player getVariable ["valor_restrained",false]} do
	{
		_time = serverTime;
		waitUntil {(serverTime - _time) > (5 * 60)};

		if( !(call _players_close) && (player getVariable["valor_restrained",FALSE]) && vehicle player isEqualTo player) exitWith {
			player setVariable["valor_restrained",nil,TRUE];
			detach player;
			systemchat "Valor :: You are unrestrained because nobody was close to watch you, good luck."
		};
	};
};

titleText["PLAIN","You were restrained"];

while {player getVariable ["valor_restrained",false]} do
{
	if(vehicle player isEqualTo player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable["valor_restrained",false]) || vehicle player != _state};

	if(!alive player) exitWith
	{
		player setVariable ["valor_restrained",nil,true];
		detach _player;

	};


	if(vehicle player != player) then
	{

		if(driver (vehicle player) == player) then {player action["eject",vehicle player];player action ["getOut", vehicle player];};
	};
};


if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	detach player;
};