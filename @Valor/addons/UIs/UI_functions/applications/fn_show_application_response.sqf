
private ["_accepted","_control"];

_accepted = param[0,false,[false]];



if(_accepted) then {
	_control = (findDisplay 46) ctrlCreate ["RscPicture", 1337];
	_control ctrlSetPosition [(0.559709 * safezoneW + safezoneX), (0.37944 * safezoneH + safezoneY), (0.236834 * safezoneW), (0.623042 * safezoneH)];
	_control ctrlSetText "UIs\textures\applications\accept.jpg";
	_control ctrlCommit 0;
	player addaction["I read the message",{
		ctrlDelete ((findDisplay 46) displayCtrl 1337);player removeAction (_this select 2);
		[0,getplayeruid player,0,false,true] remoteExec["valor_fnc_update_coplevel",2];
		}];
} else {
	_control = (findDisplay 46) ctrlCreate ["RscPicture", 1337];
	_control ctrlSetPosition [(0.559709 * safezoneW + safezoneX), (0.37944 * safezoneH + safezoneY), (0.236834 * safezoneW), (0.623042 * safezoneH)];
	_control ctrlSetText "UIs\textures\applications\decline.jpg";
	_control ctrlCommit 0;
	player addaction["I read the message",{
		ctrlDelete ((findDisplay 46) displayCtrl 1337);player removeAction (_this select 2);
		[0,getplayeruid player,0,false,true] remoteExec["valor_fnc_update_coplevel",2];
		}];
};



