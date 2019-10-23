



private ["_zombie","_dir","_attackSound","_scream","_vel","_strength"];
_zombie = param[0,objNull,[objNull]];
_target = param[1,objNull,[objNull]];
if(isnull _zombie) exitWith {false};
if(isnull _target) exitWith {false};
_zombie setvariable["ATTACKING",true];
_agentdamage = 0.5;
_dir = _zombie getDir _target;
_zombie setdir _dir;
_soundprobhunting = 0.6;
_scratchmu = random 1;
_specialattackprob = 0.6;
if(_target iskindof "LandVehicle" || _target iskindof "Air") then {


	_anim = selectRandom ["RaptorBiteGesture1", "RaptorBiteGesture2", "RaptorBiteGesture3"];

	_dir = [_zombie, _target] call BIS_Fnc_dirTo;

	_zombie setDir _dir;

	_zombie playactionnow _anim;

	_rdam = _agentdamage;


	//_sound = selectRandom ["rap_hit_car1", "rap_hit_car2", "rap_hit_car3"];
	_sound = "rap_" + (str (1 + (round random (18))));

	[[_target, _sound],
		{
			(_this select 0) say3d (_this select 1);
		}
	] remoteExec ["call", 0, false];


	_zombie playactionnow _anim;
	[_zombie, _target] call valor_fnc_deal_damage_veh;

	_open = ((gettext(configfile >> "CfgVehicles" >> typeof _target >> "attenuationEffectType")) == "OpenCarAttenuation");




	_hpd = {

	_hps = configfile >> "CfgVehicles" >> typeOf _target >> "Hitpoints";

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
	_dam = _target getHitPointDamage _part;
	_add = 0.5;


	_target setHitpointDamage [_part, _dam+_add];

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
	         _R = _target modelToWorld (_target selectionPosition "jt_Head_C");

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

	   } foreach (crew _target);

	   if (_min > 1.5) then
	   {
	      [] call _hpd;
	   } else
	   {
	      _unit = _crew select 0;

	      _Ddir = [_unit, _target] call BIS_fnc_relativeDirTo;

	      _rdam = 1;

	      [_unit, _rdam, false, "", _Ddir, ""] call babe_am_fnc_deal_damage;
	   };
	} else
	{
	   [] call _hpd;
	};

	if (random 1 < _soundprobhunting) then
	{
		_sound = "rap_" + (str (1 + (round random (18))));

		[[_target, _sound],
			{
				(_this select 0) say3d (_this select 1);
			}
		] remoteExec ["call", playableUnits, false];
	};

} else {

	_zombie allowSprint false;
	if (_zombie distance _target < 3 && alive _target) then
	{

		if (random 1 < _specialattackprob) then
		{
			[_zombie, _target, _scratchmu] spawn valor_fnc_jumpattack;
		} else
		{
			_mauled = _target getvariable "mauled";
			_mauling = _zombie getvariable "mauling";

			if (isNil "_mauled" && isNil "_mauling") then
			{
				_anim = selectRandom ["RaptorBiteGesture1", "RaptorBiteGesture2", "RaptorBiteGesture3"];

				_dir = [_zombie,_target] call BIS_Fnc_dirTo;

				_zombie setDir _dir;

				_zombie playactionnow _anim;

				_rdam = _agentdamage;

				//_sound = "rap_" + (str (1 + (round random (18))));

				[_target, _rdam, false, "", _dir, "", _scratchmu] call babe_am_fnc_deal_damage;

				_sound = "rap_" + (str (1 + (round random (18))));

				[[_target, _sound],
					{
						(_this select 0) say3d (_this select 1);
					}
				] remoteExec ["call", playableUnits, false];
			};
		};
	};
};

sleep 0.5;
_zombie setvariable["ATTACKING",nil];
