params ["_dino", "_victim", "_mu"];





_mauled = _victim getvariable "mauled";
_mauling = _dino getvariable "mauling";

	
if (!isNil "_mauled" or !isNil "_mauling") exitwith
{

};

[[_dino, "AI_Attack_JumpAttack"],
	{
		(_this select 0) switchmove (_this select 1);
	}
] remoteExec ["call", 0, false];

if (_victim distance (_dino modelToWorld [0,1.5,0]) < 1.5) exitwith 
{
	0 = _dino spawn 
	{
		sleep 5;
		_this setVariable ["mauling", nil];
	};
};

_dino setvariable ["mauling", true];
_victim setvariable ["mauled", true, true];


[[_victim, "RaptorMenschUmfall"],
	{
		(_this select 0) switchmove (_this select 1);
	}
] remoteExec ["call", 0, false];

_victim attachTo [_dino,[0,0.5,0]];

_victim setDir 180;	

_time = time;
_time2 = time;

while {alive _victim && alive _dino} do
{
	if (time - _time2 >= 1.5 && alive _victim && alive _dino) then
	{
		_time2 = time;
		[[_victim, "RaptorMenschZappeln"],
			{
				(_this select 0) switchmove (_this select 1);
			}
		] remoteExec ["call", 0, false];
		[[_dino, "AI_Attack_JumpAttackEat"],
			{
				(_this select 0) switchmove (_this select 1);
			}
		] remoteExec ["call", 0, false];
		

		[_victim, 0.05, false, "", random 360, "", _mu] call babe_am_fnc_deal_damage;
	};

};

detach _victim;

if (!alive _victim && alive _dino) then
{
	[[_victim, "RaptorMenschKill"],
		{
			(_this select 0) switchmove (_this select 1);
		}
	] remoteExec ["call", 0, false];


	[[_dino, "AI_Attack_JumpAttackEatKILL"],
		{
			(_this select 0) switchmove (_this select 1);
		}
	] remoteExec ["call", 0, false];
	
	_dino setvariable ["busy", nil];
	_dino setvariable ["mauling", nil];
};
if (alive _victim && !alive _dino) then
{
	_victim setvariable ["mauled", nil, true];
	[[_victim, "RaptorMenschAufstehen"],
		{
			(_this select 0) switchmove (_this select 1);
		}
	] remoteExec ["call", 0, false];


	[[_dino, "AI_Attack_JumpAttackEatDEATH"],
		{
			(_this select 0) switchmove (_this select 1);
		}
	] remoteExec ["call", 0, false];
};
if (!alive _victim && !alive _dino) then
{
	[[_victim, "RaptorMenschKill"],
		{
			(_this select 0) switchmove (_this select 1);
		}
	] remoteExec ["call", 0, false];


	[[_dino, "AI_Attack_JumpAttackEatDEATH"],
		{
			(_this select 0) switchmove (_this select 1);
		}
	] remoteExec ["call", 0, false];
};