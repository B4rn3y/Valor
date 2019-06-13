private ["_item"];
_item = param[0,"",[""]];
if(_item isEqualTo "") exitWith {""};

switch true do
{
    case(isClass(configFile >> "CfgMagazines" >> _item)): {"CfgMagazines"};
    case(isClass(configFile >> "CfgWeapons" >> _item)): {"CfgWeapons"};
    case(isClass(configFile >> "CfgVehicles" >> _item)): {"CfgVehicles"};
    case(isClass(configFile >> "CfgGlasses" >> _item)): {"CfgGlasses"};
};