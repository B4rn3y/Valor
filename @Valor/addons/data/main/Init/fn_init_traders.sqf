


{
    if(_x getvariable["CAn_speak_to",false]) then {
        _x addaction["Speak to",{(_this select 0) setvariable["Speaking_to",player,true]; hint "BLAH"; sleep 5;(_this select 0) setvariable["Speaking_to",nil,true]; }];
    };

} foreach (allMissionObjects "Man");