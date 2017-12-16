class CfgPatches
{
	class valor_items
	{
		requiredVersion=0.1;
		requiredAddons[]={
			"CUP_AirVehicles_Core"
		};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};

class CfgWeapons
{
    class ItemCore;
    class InventoryItem_Base_F;
    class valor_item: ItemCore
    {
    	scope = 2;
    	displayName = "placeholder";
    	picture = "\valor_items\ui\item_placeholder.paa";
    	model = "valor_items\models\rotor.p3d";
    	descriptionShort = "nothing here";
    	simulation= "ItemMineDetector";
        class ItemInfo
        {
            mass=1;
        };
    };
    class valor_rotor: valor_item
    {
        author = "Bloodwyn";
        displayName = "aircraft rotor";
        picture = "\valor_items\ui\rotor_icon.paa";
        model = "valor_items\models\rotor.p3d";
        descriptionShort = "Used to repair aircraft";
        class ItemInfo
        {
            mass=270;
        };
    };
};
/*

simulation= "ItemMineDetector"
class CfgWeapons
{
	class ItemCore;
	class InventoryItem_Base_F;
	class valor_item: ItemCore
	{
		scope=2;
		displayName="WIP valor Item";
		picture="valor_items\ui\item_placeholder.paa";
		descriptionShort="nothing here";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
		};
	};
	class valor_rotor: ItemCore
	{
		scope=2;
		displayName="aircraft rotor";
		picture="valor_items\ui\item_placeholder.paa";
		model = "valor_items\models\rotor.p3d";
		descriptionShort="Used to repair aircraft";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=100;
		};
	};
};




*/