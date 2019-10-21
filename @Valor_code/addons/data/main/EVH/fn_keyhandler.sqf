_code = _this select 1;
_shift = _this select 2;
_strg = _this select 3;
_alt = _this select 4;

_handle = false;

switch (_code) do
{
	case 1: //ESC
	{
		[] spawn valor_fnc_escInterupt;
	};
};

switch (true) do
{
	case (_code in (actionKeys "compass")):
	{
		["compass",valor_fnc_3DCompass] call valor_fnc_stackOnEachFrame;
		_handle = true;
	};

	case (_code isEqualTo 19 && _shift): //RESTRAIN R + Shift
	{
		[] spawn valor_fnc_restrainAction;
	};

	case (_code isEqualTo 11): // 0 lower sound
	{
		call valor_fnc_fadeSound;
	};

	case (_code isEqualTo 21): // Z Menu
	{
		[] call valor_fnc_opengroupmenu;
	};
	case (_code isequalto 35): // shift + h
	{
		if(_shift && currentWeapon player != "") then {
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
	};


	case (_code isEqualTo 219): // WINDOWS LEFT
	{
		if(player getVariable ["valor_restrained",false]) exitWith{["You cant do anything while being restrained"] spawn valor_fn_exp_hint;_handle};
		_target = if (isnull cursorTarget) then {cursorObject} else {cursorTarget};
		[_target] call valor_fnc_openinteractionmenu;
	};

	case (_code isEqualTo 22):
	{
		_veh = cursorObject;
		if(!(vehicle player isEqualTo player) && !(isnil "VALOR_IN_TRADER")) then {_veh = vehicle player};

		if((typeof _veh isKindOf "Air") || (typeof _veh isKindOf "Landvehicle") || (typeof _veh isKindOf "Ship")) then {
			_lock = locked _veh;
			_var = _veh getvariable["owners",[]];
			if!((call valor_coplevel)>0) then {
				iF!((getplayeruid player) in _var) exitWith {};
				iF(_lock isEqualTo 2) then {
					[_veh,0] remoteExec["lock",0];
					systemchat "Valor :: The vehicle is now unlocked.";
				} else {
					[_veh,2] remoteExec["lock",0];
					systemchat "Valor :: The vehicle is now locked.";
				};
			} else {
				if(!(getplayeruid player in _var) && !("COP" in _var)) exitWith {};
				iF(_lock isEqualTo 2) then {
					[_veh,0] remoteExec["lock",0];
					systemchat "Valor :: The vehicle is now unlocked.";
				} else {
					[_veh,2] remoteExec["lock",0];
					systemchat "Valor :: The vehicle is now locked.";
				};
			};
		} else {
			[cursorObject] spawn valor_fnc_open_base;
		};

	};

	//Shift + L Key?
	case (_code isequalto 38 && _shift):
	{
		if(vehicle player != player) then {
			if(isnil "valor_sirenLight_active") then {

				[vehicle player] call valor_fnc_sirenLights;
				_handle = true;
			};

			[] spawn
			{
				valor_sirenLight_active = true;
				sleep 2;
				valor_sirenLight_active = nil;
			};
		};


	};


	case (_code isEqualTo 201): //Page UP
	{
		if!(isnil "Valor_base_place_Y") then {Valor_base_place_Y = Valor_base_place_Y + 0.1;};
		if!(isnil "Valor_siren_place_Z") then {Valor_siren_place_Z = Valor_siren_place_Z + 0.05; VALOR_SIREN attachto[VALOR_ATTACH_VEHICLE,[0,VALOR_SIREN_PLACE_Y,Valor_siren_place_Z]];};
	};

	case (_code isEqualTo 209): //Page DOWN
	{
		if!(isnil "Valor_base_place_Y") then {Valor_base_place_Y = Valor_base_place_Y - 0.1;};
		if!(isnil "Valor_siren_place_Z") then {Valor_siren_place_Z = Valor_siren_place_Z - 0.05; VALOR_SIREN attachto[VALOR_ATTACH_VEHICLE,[0,VALOR_SIREN_PLACE_Y,Valor_siren_place_Z]];};
	};

	case (_code isEqualTo 199): //POS 1
	{
		if!(isnil "VALOR_SIREN_PLACE_Y") then {VALOR_SIREN_PLACE_Y = VALOR_SIREN_PLACE_Y + 0.05; VALOR_SIREN attachto[VALOR_ATTACH_VEHICLE,[0,VALOR_SIREN_PLACE_Y,Valor_siren_place_Z]];};
	};

	case (_code isEqualTo 207): //END
	{
		if!(isnil "VALOR_SIREN_PLACE_Y") then {VALOR_SIREN_PLACE_Y = VALOR_SIREN_PLACE_Y - 0.05; VALOR_SIREN attachto[VALOR_ATTACH_VEHICLE,[0,VALOR_SIREN_PLACE_Y,Valor_siren_place_Z]];};
	};
};
_handle;