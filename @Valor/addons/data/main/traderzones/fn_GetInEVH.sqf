


_player = _this select 0;
_vehicle = _this select 2;

_pid = getplayeruid _player;

_var = (vehicle player) getvariable "allowed_players";
if(isnil "_var") exitWith {};

if!(_pid in _var) exitWith {while {!(vehicle player isEqualTo player)} do {_player action ["Eject", vehicle _player];sleep 1;};};

