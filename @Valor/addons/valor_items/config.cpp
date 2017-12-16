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
    class valor_item_base: ItemCore
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
    class valor_rotor: valor_item_base
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
    class valor_food_base: valor_item_base
    {
        author = "Bloodwyn";
        displayName = "Basic Food";
        picture = "\valor_items\ui\rotor_icon.paa";
        model = "valor_items\models\rotor.p3d";
        descriptionShort = "eatable?";
        food = 1;
        class ItemInfo
        {
            mass=5;
        };
    };

    //automaticly generated

    class valor_Land_Hammer_F: valor_item_base
    {
    	displayName = "Hammer";
    	model = "a3\structures_f\items\tools\hammer_f.p3d";
    };
    class valor_Land_GasCooker_F: valor_item_base
    {
    	displayName = "Gas cooker";
    	model = "a3\structures_f_epa\items\tools\gascooker_f.p3d";
    };
    class valor_Land_CanisterFuel_F: valor_item_base
    {
    	displayName = "Canister (Fuel)";
    	model = "a3\structures_f\items\vessels\canisterfuel_f.p3d";
    };
    class valor_Land_Saw_F: valor_item_base
    {
    	displayName = "Saw";
    	model = "a3\structures_f\items\tools\saw_f.p3d";
    };
    class valor_Land_CanisterFuel_Blue_F: valor_item_base
    {
    	displayName = "Canister (Fuel, Blue)";
    	model = "a3\structures_f\items\vessels\canisterfuel_f.p3d";
    };
    class valor_Land_CanisterFuel_Red_F: valor_item_base
    {
    	displayName = "Canister (Fuel, Red)";
    	model = "a3\structures_f\items\vessels\canisterfuel_f.p3d";
    };
    class valor_Land_Shovel_F: valor_item_base
    {
    	displayName = "Shovel";
    	model = "a3\structures_f_epa\items\tools\shovel_f.p3d";
    };
    class valor_Land_CanOpener_F: valor_item_base
    {
    	displayName = "Can opener";
    	model = "a3\structures_f_epa\items\tools\canopener_f.p3d";
    };
    class valor_Land_CanisterFuel_White_F: valor_item_base
    {
    	displayName = "Canister (Fuel, White)";
    	model = "a3\structures_f\items\vessels\canisterfuel_f.p3d";
    };
    class valor_Land_DrillAku_F: valor_item_base
    {
    	displayName = "Accu-Drill";
    	model = "a3\structures_f\items\tools\drillaku_f.p3d";
    };
    class valor_Land_ButaneCanister_F: valor_item_base
    {
    	displayName = "Butane canister";
    	model = "a3\structures_f_epa\items\tools\butanecanister_f.p3d";
    };
    class valor_Land_Crowbar_01_F: valor_item_base
    {
    	displayName = "Crowbar";
    	model = "a3\props_f_orange\items\tools\crowbar_01_f.p3d";
    };
    class valor_Land_FirstAidKit_01_closed_F: valor_item_base
    {
    	displayName = "First Aid Box (Closed)";
    	model = "a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d";
    };
    class valor_Land_DuctTape_F: valor_item_base
    {
    	displayName = "Duct tape";
    	model = "a3\structures_f_epa\items\tools\ducttape_f.p3d";
    };
    class valor_Land_Axe_F: valor_item_base
    {
    	displayName = "Axe";
    	model = "a3\structures_f\items\tools\axe_f.p3d";
    };
    class valor_Land_Matches_F: valor_item_base
    {
    	displayName = "Box of matches";
    	model = "a3\structures_f_epa\items\tools\matches_f.p3d";
    };
    class valor_Land_Defibrillator_F: valor_item_base
    {
    	displayName = "Defibrillator";
    	model = "a3\structures_f_epa\items\medical\defibrillator_f.p3d";
    };
    class valor_Land_Axe_fire_F: valor_item_base
    {
    	displayName = "Axe (Firefighter)";
    	model = "a3\structures_f\items\tools\axe_fire_f.p3d";
    };
    class valor_Land_Pumpkin_01_F: valor_item_base
    {
    	displayName = "Pumpkin";
    	model = "a3\props_f_orange\humanitarian\supplies\pumpkin_01_f.p3d";
    };
    class valor_Land_IntravenBag_01_full_F: valor_item_base
    {
    	displayName = "IV Bag (Full)";
    	model = "a3\props_f_orange\humanitarian\camps\intravenbag_01_full_f.p3d";
    };
    class valor_Land_BottlePlastic_V1_F: valor_item_base
    {
    	displayName = "Plastic Bottle";
    	model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
    };
    class valor_Land_VitaminBottle_F: valor_item_base
    {
    	displayName = "Vitamin bottle";
    	model = "a3\structures_f_epa\items\medical\vitaminbottle_f.p3d";
    };
    class valor_Land_Camping_Light_F: valor_item_base
    {
    	displayName = "Camping Lantern";
    	model = "a3\structures_f_epb\civ\camping\camping_light_f.p3d";
    };
    class valor_Land_Ketchup_01_F: valor_item_base
    {
    	displayName = "Ketchup Bottle";
    	model = "a3\structures_f_heli\items\food\ketchup_01_f.p3d";
    };
    class valor_Land_BloodBag_F: valor_item_base
    {
    	displayName = "Blood bag";
    	model = "a3\structures_f_epa\items\medical\bloodbag_f.p3d";
    };
    class valor_Land_CerealsBox_F: valor_item_base
    {
    	displayName = "Cereal box";
    	model = "a3\structures_f_epa\items\food\cerealsbox_f.p3d";
    };
    class valor_Land_PortableLongRangeRadio_F: valor_item_base
    {
    	displayName = "Portable Long-range Radio";
    	model = "a3\structures_f\items\electronics\portablelongrangeradio_f.p3d";
    };
    class valor_Land_Antibiotic_F: valor_item_base
    {
    	displayName = "Antibiotics";
    	model = "a3\structures_f_epa\items\medical\antibiotic_f.p3d";
    };
    class valor_Land_PainKillers_F: valor_item_base
    {
    	displayName = "Pain killers";
    	model = "a3\structures_f_epa\items\medical\painkillers_f.p3d";
    };
    class valor_Land_Mustard_01_F: valor_item_base
    {
    	displayName = "Mustard Bottle";
    	model = "a3\structures_f_heli\items\food\mustard_01_f.p3d";
    };
    class valor_Land_MetalWire_F: valor_item_base
    {
    	displayName = "Metal wire";
    	model = "a3\structures_f_epa\items\tools\metalwire_f.p3d";
    };
    class valor_Land_Bandage_F: valor_item_base
    {
    	displayName = "Bandages";
    	model = "a3\structures_f_epa\items\medical\bandage_f.p3d";
    };
    class valor_Land_Can_Dented_F: valor_item_base
    {
    	displayName = "Can (Dented)";
    	model = "a3\structures_f\items\food\can_dented_f.p3d";
    };
    class valor_Land_BottlePlastic_V2_F: valor_item_base
    {
    	displayName = "Water bottle";
    	model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
    };
    class valor_Land_Can_V3_F: valor_item_base
    {
    	displayName = "Can (RedGull)";
    	model = "a3\structures_f\items\food\can_v3_f.p3d";
    };
    class valor_Land_BakedBeans_F: valor_item_base
    {
    	displayName = "Baked Beans";
    	model = "a3\structures_f_epa\items\food\bakedbeans_f.p3d";
    };
    class valor_Can_small: valor_item_base
    {
    	displayName = "Can (Small)";
    	model = "ca\misc\plechovka_1.p3d";
    };
    class valor_Land_Canteen_F: valor_item_base
    {
    	displayName = "Canteen";
    	model = "a3\structures_f_epa\items\food\canteen_f.p3d";
    };
    class valor_Land_Can_V2_F: valor_item_base
    {
    	displayName = "Can (Franta)";
    	model = "a3\structures_f\items\food\can_v2_f.p3d";
    };
    class valor_Land_Orange_01_F: valor_item_base
    {
    	displayName = "Orange";
    	model = "a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d";
    };
    class valor_Land_ExtensionCord_F: valor_item_base
    {
    	displayName = "Extension Cord";
    	model = "a3\structures_f\items\electronics\extensioncord_f.p3d";
    };
    class valor_Land_Can_V1_F: valor_item_base
    {
    	displayName = "Can (Spirit)";
    	model = "a3\structures_f\items\food\can_v1_f.p3d";
    };
    class valor_Land_FMradio_F: valor_item_base
    {
    	displayName = "FM Radio";
    	model = "a3\structures_f\items\electronics\fmradio_f.p3d";
    };
    class valor_Land_Can_Rusty_F: valor_item_base
    {
    	displayName = "Can (Rusty)";
    	model = "a3\structures_f\items\food\can_rusty_f.p3d";
    };
    class valor_Land_TacticalBacon_F: valor_item_base
    {
    	displayName = "Tactical Bacon";
    	model = "a3\structures_f\items\food\tacticalbacon_f.p3d";
    };
    class valor_Land_RiceBox_F: valor_item_base
    {
    	displayName = "Rice";
    	model = "a3\structures_f_epa\items\food\ricebox_f.p3d";
    };
    class valor_Land_Tyre_F: valor_item_base
    {
    	displayName = "Tire";
    	model = "a3\structures_f\civ\garbage\tyre_f.p3d";
    };
    class valor_Land_Sleeping_bag_folded_F: valor_item_base
    {
    	displayName = "Sleeping Bag (Folded)";
    	model = "a3\structures_f\civ\camping\sleeping_bag_folded_f.p3d";
    };
    class valor_Tire_Van_02_Cargo_F: valor_item_base
    {
    	displayName = "Van Tire (Rim, Cargo)";
    	model = "a3\soft_f_orange\van_02\van_02_vehicle_tire_f.p3d";
    };
    class valor_Land_WoodenLog_F: valor_item_base
    {
    	displayName = "Wooden log";
    	model = "a3\structures_f_epa\civ\camping\woodenlog_f.p3d";
    };
    class valor_Land_EmergencyBlanket_01_F: valor_item_base
    {
    	displayName = "Emergency Blanket";
    	model = "a3\props_f_orange\humanitarian\camps\emergencyblanket_01_f.p3d";
    };
    class valor_Land_Portable_generator_F: valor_item_base
    {
    	displayName = "Portable Generator";
    	model = "a3\structures_f\items\electronics\portable_generator_f.p3d";
    };
    class valor_Land_HumanSkull_F: valor_item_base
    {
    	displayName = "Skull";
    	model = "a3\structures_f\civ\dead\humanskull_f.p3d";
    };
    class valor_Tire_Van_02_Transport_F: valor_item_base
    {
    	displayName = "Van Tire (Rim, Transport)";
    	model = "a3\soft_f_orange\van_02\van_02_transport_tire_f.p3d";
    };
    class valor_Land_Cliff_stone_medium_F: valor_item_base
    {
    	displayName = "Small Stone (Mossy)";
    	model = "a3\rocks_f_exp\cliff\cliff_stone_medium_f.p3d";
    };
    class valor_Land_PaperBox_01_small_closed_brown_F: valor_item_base
    {
    	displayName = "Cardboard Box (Brown)";
    	model = "a3\props_f_orange\humanitarian\supplies\paperbox_01_small_closed_f.p3d";
    };
    class valor_Land_Battery_F: valor_item_base
    {
    	displayName = "Battery";
    	model = "a3\structures_f_epa\items\electronics\battery_f.p3d";
    };
    class valor_Land_FoodSack_01_full_brown_F: valor_item_base
    {
    	displayName = "Food Sack (Brown, Full)";
    	model = "a3\props_f_orange\humanitarian\supplies\foodsack_01_full_f.p3d";
    };
    class valor_Land_Campfire_F: valor_item_base
    {
    	displayName = "Campfire";
    	model = "a3\structures_f\civ\camping\campfire_f.p3d";
    };
    class valor_CUP_box_c: valor_item_base
    {
    	displayName = "Box C";
    	model = "ca\structures\furniture\decoration\box_c\box_c.p3d";
    };
    class valor_Land_CarBattery_01_F: valor_item_base
    {
    	displayName = "Car Battery (Truck)";
    	model = "a3\structures_f_bootcamp\items\electronics\carbattery_01_f.p3d";
    };
    class valor_Land_CarBattery_02_F: valor_item_base
    {
    	displayName = "Car Battery (Car)";
    	model = "a3\structures_f_bootcamp\items\electronics\carbattery_02_f.p3d";
    };
    class valor_Land_PaperBox_01_small_closed_white_med_F: valor_item_base
    {
    	displayName = "Cardboard Box (Medical) [IDAP]";
    	model = "a3\props_f_orange\humanitarian\supplies\paperbox_01_small_closed_f.p3d";
    };
    class valor_Land_Sack_F: valor_item_base
    {
    	displayName = "Sack";
    	model = "a3\structures_f\civ\market\sack_f.p3d";
    };
    class valor_Land_Suitcase_F: valor_item_base
    {
    	displayName = "Suitcase";
    	model = "a3\structures_f\items\luggage\suitcase_f.p3d";
    };

};
