
_the_player = _this select 0;
_object_taken_from = _This select 1;
_item_taken = _this select 2;


_pid = getplayeruid _the_player;

_var = (_object_taken_from) getvariable "allowed_players";
if(isnil "_var") exitWith {};

if!(_pid in _var) exitWith {
	//_object_taken_from addItemCargoGlobal [_item_taken, 1];
	//_the_player removeItem _item_taken;


};