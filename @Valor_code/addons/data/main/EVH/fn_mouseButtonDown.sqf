params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
if(_button isEqualTo 0)then{
	private _weapon = currentWeapon player;
   	private _mag = getarray(configfile >> "cfgweapons" >> (currentWeapon player) >> "magazines")# 0;
   	private _ammo = getText(configfile >> "CfgMagazines" >> _mag >> "ammo");
   	if(_ammo isKindOf "Melee" && (player ammo (currentWeapon player) < 1))then{
   		player addItem _mag;
   		reload player;
   	};
   	if(_weapon isEqualTo "valor_carrot")then{
   		player playactionnow "gestureup";
   		private _availableAnimals = getArray(missionConfigFile >> "Valor_settings" >> "animals" >> "availableAnimals");
   		private _animals = entities  [_availableAnimals,[]];
   		_animals select {_x distance player < 30;} apply {_x setDestination [position player,"LEADER Direct", true];};
   	};
};