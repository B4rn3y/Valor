_gen = _this select 0;
_caller = _this select 1;
_id = _this select 2;
if!(alive _gen) exitWith {};

if !(attachedObjects _gen isEqualTo []) exitWith {["Horse in use!"] spawn valor_fnc_exp_hint;};
//remove the action once it is activated
_gen removeAction _id;
_gen setobjecttexture [1,"\dbo\dbo_horses\data\tack_co.paa"];
_gen setobjecttexture [0,""];
//_caller switchmove "getinhorse";
//sleep 1.5;
//_cid = format["-%1",clientOwner];
//old[player,"Horse_Rider"] remoteExec ["switchMove",(parseNumber _cid),true];
[player,"Horse_Rider"] remoteExec ["switchMove",-2,true];
_caller switchmove "Horse_Rider";
_nul = [_caller,_gen] call dbo_fnc_dbohorserider;
_caller attachto [_gen,[0,0.05,0.25],"Pelvis_l"];
["Horse mounted, do not release UAV Controls"] spawn valor_fnc_exp_hint;
_gen setdamage 0;
_HossDiss  = _gen addaction ["GetOff",valor_fnc_horse_dismount,nil,1.5,false,true,"","true",4,false,""];