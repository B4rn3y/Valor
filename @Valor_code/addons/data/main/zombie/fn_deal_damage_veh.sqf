_dino = _this select 0;

_car = _this select 1;

_open = ((gettext(configfile >> "CfgVehicles" >> typeof _car >> "attenuationEffectType")) == "OpenCarAttenuation");




_hpd = {

_hps = configfile >> "CfgVehicles" >> typeOf _car >> "Hitpoints";

_parts = [];


for "_i" from 0 to ((count _hps)-1) do
{

_base = inheritsFrom (configFile >> "CfgVehicles" >> str (_hps select _i));

_part = configname (_hps select _i);

if (_part != "HitFuel") then
{
_parts pushback _part;
};
};


_part = _parts select (floor(random count _parts));
_dam = _car getHitPointDamage _part;
_add = 0.5;


	//_car setHitpointDamage [_part, _dam+_add];
	[_car,[_part, _dam+_add]] remoteExec["setHitpointDamage",0];

};






if (_open) then
{

	_dist = 100;
	_min = 0;

	_crew = [];

	{
	if (!alive _x) then {} else
	{
	_V = _x modelToWorld (_x selectionPosition "Head");
	_R = _dino modelToWorld (_dino selectionPosition "jt_Head_C");

	_d = _V distance _R;

	_min = _dist min _d;

	_dist = _min;

	if (_d == _min) then
	{
	_crew set [0, _x];
	} else
	{
	_crew pushback _x;
	};
	};

	} foreach (crew _car);

	if (_min > 1.5) then
	{
	[] call _hpd;
	} else
	{
	_unit = _crew select 0;

	_Ddir = [_unit, _dino] call BIS_fnc_relativeDirTo;

	_rdam = 1;

	[_unit, _rdam, false, "", _Ddir, ""] call babe_am_fnc_deal_damage;
	};
} else
{
	[] call _hpd;
};