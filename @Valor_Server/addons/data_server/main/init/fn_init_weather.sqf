

private ["_query","_res","_weather_arr"];


_query = "Select * from weather;";

_res = [_query,2,true] call valor_fnc_db_sync;


_weather_arr = [];
{
	_weather_arr pushback [_x select 1,parsenumber(_x select 2), call compile(_x select 3)];
} foreach _res;


[_weather_arr] spawn valor_fnc_weather_module;

// [["Heavy_Rain",3,[900,1050,1200]],["Light_Rain",7,[1200,1500,1800]],["Sunny",20,[3000,3600,4200]],["Light_fog",8,[1800,2100,2400]],["Heavy_fog",3,[600,720,900]],["Cloudy",15,[2700,3120,3600]],["Thunderstorm",1,[900,1050,1200]]]
// [[12,"Heavy_Rain","3","[900,1050,1200]"],[13,"Light_Rain","7","[1200,1500,1800]"],[14,"Sunny","20","[3000,3600,4200]"],[15,"Light_fog","8","[1800,2100,2400]"],[16,"Heavy_fog","3","[600,720,900]"],[17,"Cloudy","15","[2700,3120,3600]"],[18,"Thunderstorm","1","[900,1050,1200]"]]