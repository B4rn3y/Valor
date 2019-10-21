
private ["_query","_res","_varname","_varvalue","_public"];


_query = "Select varname, varvalue, public from valor_settings";

_res = [_query,2,true] call valor_fnc_db_sync;

{
	_varname = _x select 0;
	_varvalue = _x select 1;
	_public = _x select 2;

	switch (_varname) do
	{
		case "COP_BANK":
		{
			if(isnil "save_object") exitWith {};
			save_object setvariable["cop_bank",_varvalue,true];
		};


		case "weather":
		{
			[_varvalue] spawn valor_fnc_weather_module;
		};


		default
		{
			call compile format["%1=%2;",_varname,_varvalue];
			if(_public) then {
				publicVariable _varname;
			};
		};
	};


} foreach _res;


