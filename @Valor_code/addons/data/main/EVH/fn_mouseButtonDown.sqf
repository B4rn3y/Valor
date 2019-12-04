params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
if(_button isEqualTo 0)then{
   	_mag = getarray(configfile >> "cfgweapons" >> (currentWeapon player) >> "magazines")#0;
   	_ammo = getText(configfile >> "CfgMagazines" >> _mag >> "ammo");
   	if(_ammo isKindOf "Melee" && (player ammo (currentWeapon player) < 1))then{
   		player addItem _mag;
   		reload player;
   	};
};