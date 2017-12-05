
private ["_number_of_zeds","_zombieArt","_multi","_number_of_medium","_number_of_crawlers","_number_of_fast","_number_of_slow","_number_of_spider","_number_of_walker","_achieved_nmbr","_arr","_arr_anders","_nmbr","_returned_array","_classnames","_D"];
_number_of_zeds = param[0,8,[1337]];
_zombieArt = param[1,"normal",[""]];
_multi =  0.6;
switch (true) do
{

	case (_number_of_zeds >= 11):
	{
		_multi = 0.2;
	};
	case (_number_of_zeds >= 5  && _number_of_zeds < 11):
	{
		_multi = 0.3;
	};

	case (_number_of_zeds > 0 && _number_of_zeds < 5):
	{
		_multi = 0.6;
	};

};

_number_of_medium = floor( 0.6 * _number_of_zeds);
_number_of_crawlers = floor(_multi * _number_of_zeds);
_number_of_fast = floor(_multi * _number_of_zeds);
_number_of_slow = floor(_multi * _number_of_zeds);
_number_of_spider = floor(_multi * _number_of_zeds);
_number_of_walker = floor(_multi * _number_of_zeds);

_achieved_nmbr = ceil (_number_of_medium);

_arr = [["medium",ceil (_number_of_medium)]];
_arr_anders = [["crawler","_number_of_crawlers"],["fast","_number_of_fast"],["slow","_number_of_slow"],["spider","_number_of_spider"],["walker","_number_of_walker"]];
_arr_anders = _arr_anders call BIS_fnc_arrayShuffle;

{
	if(_achieved_nmbr >= _number_of_zeds) exitWith {};
	_nmbr = ceil(call compile (_x select 1));
	_arr pushback [_x select 0,_nmbr];
	_achieved_nmbr = _achieved_nmbr + _nmbr;
} foreach _arr_anders;

_returned_array = [];
{
	_classnames = getarray(missionConfigFile >> "cfgZombie_classes" >> (_x select 0) >> _zombieArt);
	for "_D" from 1 to (_x select 1) do {
		_returned_array pushback (selectrandom _classnames);

	};


} foreach _arr;



_returned_array