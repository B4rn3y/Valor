/*
private ["_accepted","_control"];

_accepted = param[0,false,[false]];



if(_accepted) then {
	_control = (findDisplay 46) ctrlCreate ["RscPicture", 1337];
	_control ctrlSetPosition [(0.559709 * safezoneW + safezoneX), (0.37944 * safezoneH + safezoneY), (0.236834 * safezoneW), (0.623042 * safezoneH)];
	_control ctrlSetText "UIs\textures\applications\accept.jpg";
	_control ctrlCommit 0;
	player addaction["I read the message",{
		//[0,getplayeruid player,0,false,true] remoteExec["valor_fnc_update_coplevel",2];
		[[0,getplayeruid player,0,false,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
		ctrlDelete ((findDisplay 46) displayCtrl 1337);player removeAction (_this select 2);

		}];
} else {
	_control = (findDisplay 46) ctrlCreate ["RscPicture", 1337];
	_control ctrlSetPosition [(0.559709 * safezoneW + safezoneX), (0.37944 * safezoneH + safezoneY), (0.236834 * safezoneW), (0.623042 * safezoneH)];
	_control ctrlSetText "UIs\textures\applications\decline.jpg";
	_control ctrlCommit 0;
	player addaction["I read the message",{
		//[0,getplayeruid player,0,false,true] remoteExec["valor_fnc_update_coplevel",2];
		[[0,getplayeruid player,0,false,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
		ctrlDelete ((findDisplay 46) displayCtrl 1337);player removeAction (_this select 2);
		}];
};


*/




private ["_accepted","_control"];

_accepted = param[0,false,[false]];


_accepted= true;
if(_accepted) then {
	_control = (findDisplay 46) ctrlCreate ["RscStructuredText", 1337];
	_control ctrlSetPosition [(0.480432 * safezoneW + safezoneX), (0.59064 * safezoneH + safezoneY), (0.298907 * safezoneW), (0.413334 * safezoneH)];
	_control ctrlSetStructuredText parsetext format["<t size='1.5'>Russian Military</t><br/><br/><t size='1.2'>You have been accepted as a member of the military.<br/>Please contact a superior of the military.<br/>The introduction will begin as soon as possible.<br/></t>"];
	_control ctrlCommit 0;
	player addaction["I read the message",{
		//[0,getplayeruid player,0,false,true] remoteExec["valor_fnc_update_coplevel",2];
		[[0,getplayeruid player,0,false,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
		ctrlDelete ((findDisplay 46) displayCtrl 1337);player removeAction (_this select 2);

		}];
} else {
	_control = (findDisplay 46) ctrlCreate ["RscStructuredText", 1337];
	_control ctrlSetPosition [(0.480432 * safezoneW + safezoneX), (0.59064 * safezoneH + safezoneY), (0.298907 * safezoneW), (0.413334 * safezoneH)];
	_control ctrlSetStructuredText parsetext format["<t size='1.5'>Russian Military</t><br/><br/><t size='1.2'>You have been rejected as a member of the military.<br/>Thank you for your interest.</t>"];
	_control ctrlCommit 0;
	player addaction["I read the message",{
		//[0,getplayeruid player,0,false,true] remoteExec["valor_fnc_update_coplevel",2];
		[[0,getplayeruid player,0,false,true],"valor_fnc_update_coplevel",2] call valor_fnc_remoteexec;
		ctrlDelete ((findDisplay 46) displayCtrl 1337);player removeAction (_this select 2);
		}];
};




