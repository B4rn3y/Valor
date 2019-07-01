

private ["_MANS","_originalTarget"];

_MANS = allMissionObjects "MAN";

{
	if!(alive _x) then {
		_x addaction[format["Revive %1",(_x getvariable["realname","unknown"])], valor_fnc_revive,(_x getvariable["PID",""]),1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"];
		_x addaction[format["Search %1",(_x getvariable["realname","unknown"])], valor_fnc_corpse_money_grabber,(_x getvariable["PID",""]),1.5,true,true,"","(_originalTarget distance player) < 5 && alive player"];
	};
} foreach _MANS;
