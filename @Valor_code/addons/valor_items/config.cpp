class CfgPatches
{
	class valor_items
	{
		requiredVersion=0.1;
		requiredAddons[]={
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

    class valor_hook: valor_item_base
    {
        author = "Bloodwyn";
        displayName = "grappling hook";
        picture = "\valor_items\ui\grapplinghook_icon.paa";
        model = "valor_items\models\grapplinghook.p3d";
        descriptionShort = "Climb walls like Sp!der(man)";
        class ItemInfo
        {
            mass=3;
        };
    };

    class valor_Raptor_Egg: valor_item_base
    {
        displayName = "Raptor Egg";
        model = "valor_items\models\egg.p3d";
        picture = "\valor_items\ui\egg.paa";
        class ItemInfo
        {
            mass=3;
        };
    };

    class valor_cinder_blocks: valor_item_base
    {
        displayName = "Cinder Blocks";
        model = "valor_items\models\cinderblocks.p3d";
        picture =  "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_CinderBlock_01_F.jpg";
        class ItemInfo
        {
            mass=70;
        };
    };
    class valor_cement_bag: valor_item_base
    {
        displayName = "Cement Bag";
        model = "valor_items\models\bag.p3d";
        picture = "\valor_items\ui\cement_icon.paa";
        class ItemInfo
        {
            mass=70;
        };
    };

    //automaticly generated
 	class valor_humanskull: valor_item_base
 	{
 		displayName = "Skull";
 		model = "a3\structures_f\civ\dead\humanskull_f.p3d";
 		picture = "\valor_items\ui\humanskull_icon.paa";
 		class ItemInfo
 		{
 			mass=24;
 		};
 	};

 	class valor_tankboresighter_01: valor_item_base
 	{
 		displayName = "Engine Parts";
 		model = "a3\props_f_tank\military\tankacc\tankboresighter_01_f.p3d";
 		picture = "\valor_items\ui\tankboresighter_01_icon.paa";
 		class ItemInfo
 		{
 			mass=32;
 		};
 	};

 	class valor_drillaku: valor_item_base
 	{
 		displayName = "Accu-Drill";
 		model = "a3\structures_f\items\tools\drillaku_f.p3d";
 		picture = "\valor_items\ui\drillaku_icon.paa";
 		class ItemInfo
 		{
 			mass=21;
 		};
 	};

 	class valor_axe: valor_item_base
 	{
 		displayName = "Axe";
 		model = "a3\structures_f\items\tools\axe_f.p3d";
 		picture = "\valor_items\ui\axe_icon.paa";
 		class ItemInfo
 		{
 			mass=53;
 		};
 	};

 	class valor_axe_fire: valor_item_base
 	{
 		displayName = "Axe (Firefighter)";
 		model = "a3\structures_f\items\tools\axe_fire_f.p3d";
 		picture = "\valor_items\ui\axe_fire_icon.paa";
 		class ItemInfo
 		{
 			mass=55;
 		};
 	};

 	class valor_matches: valor_item_base
 	{
 		displayName = "Box of matches";
 		model = "a3\structures_f_epa\items\tools\matches_f.p3d";
 		picture = "\valor_items\ui\matches_icon.paa";
 		class ItemInfo
 		{
 			mass=5;
 		};
 	};

 	class valor_butanetorch: valor_item_base
 	{
 		displayName = "Butane torch";
 		model = "a3\structures_f_epa\items\tools\butanetorch_f.p3d";
 		picture = "\valor_items\ui\butanetorch_icon.paa";
 		class ItemInfo
 		{
 			mass=17;
 		};
 	};

 	class valor_canopener: valor_item_base
 	{
 		displayName = "Can opener";
 		model = "a3\structures_f_epa\items\tools\canopener_f.p3d";
 		picture = "\valor_items\ui\canopener_icon.paa";
 		class ItemInfo
 		{
 			mass=9;
 		};
 	};

 	class valor_crowbar_01: valor_item_base
 	{
 		displayName = "Crowbar";
 		model = "a3\props_f_orange\items\tools\crowbar_01_f.p3d";
 		picture = "\valor_items\ui\crowbar_01_icon.paa";
 		class ItemInfo
 		{
 			mass=38;
 		};
 	};

 	class valor_ducttape: valor_item_base
 	{
 		displayName = "Duct tape";
 		model = "a3\structures_f_epa\items\tools\ducttape_f.p3d";
 		picture = "\valor_items\ui\ducttape_icon.paa";
 		class ItemInfo
 		{
 			mass=11;
 		};
 	};

 	class valor_hammer: valor_item_base
 	{
 		displayName = "Hammer";
 		model = "a3\structures_f\items\tools\hammer_f.p3d";
 		picture = "\valor_items\ui\hammer_icon.paa";
 		class ItemInfo
 		{
 			mass=17;
 		};
 	};

 	class valor_metalwire: valor_item_base
 	{
 		displayName = "Metal wire";
 		model = "a3\structures_f_epa\items\tools\metalwire_f.p3d";
 		picture = "\valor_items\ui\metalwire_icon.paa";
 		class ItemInfo
 		{
 			mass=25;
 		};
 	};

 	class valor_rope_01: valor_item_base
 	{
 		displayName = "Rope";
 		model = "a3\structures_f_heli\items\tools\rope_01_f.p3d";
 		picture = "\valor_items\ui\rope_01_icon.paa";
 		class ItemInfo
 		{
 			mass=21;
 		};
 	};

 	class valor_saw: valor_item_base
 	{
 		displayName = "Saw";
 		model = "a3\structures_f\items\tools\saw_f.p3d";
 		picture = "\valor_items\ui\saw_icon.paa";
 		class ItemInfo
 		{
 			mass=25;
 		};
 	};

 	class valor_shovel: valor_item_base
 	{
 		displayName = "Shovel";
 		model = "a3\structures_f_epa\items\tools\shovel_f.p3d";
 		picture = "\valor_items\ui\shovel_icon.paa";
 		class ItemInfo
 		{
 			mass=53;
 		};
 	};

 	class valor_wrench: valor_item_base
 	{
 		displayName = "wrench";
 		model = "a3\structures_f\items\tools\wrench_f.p3d";
 		picture = "\valor_items\ui\wrench_icon.paa";
 		class ItemInfo
 		{
 			mass=15;
 		};
 	};

 	class valor_sleeping_bag_blue_folded: valor_item_base
 	{
 		displayName = "Sleeping Bag (Folded)";
 		model = "a3\structures_f\civ\camping\sleeping_bag_blue_folded_f.p3d";
 		picture = "\valor_items\ui\sleeping_bag_blue_folded_icon.paa";
 		class ItemInfo
 		{
 			mass=28;
 		};
 	};

 	class valor_sleeping_bag_brown_folded: valor_item_base
 	{
 		displayName = "Sleeping Bag (Folded)";
 		model = "a3\structures_f\civ\camping\sleeping_bag_brown_folded_f.p3d";
 		picture = "\valor_items\ui\sleeping_bag_brown_folded_icon.paa";
 		class ItemInfo
 		{
 			mass=28;
 		};
 	};

 	class valor_sleeping_bag_folded: valor_item_base
 	{
 		displayName = "Sleeping Bag (Folded)";
 		model = "a3\structures_f\civ\camping\sleeping_bag_folded_f.p3d";
 		picture = "\valor_items\ui\sleeping_bag_folded_icon.paa";
 		class ItemInfo
 		{
 			mass=28;
 		};
 	};

 	class valor_woodenlog: valor_item_base
 	{
 		displayName = "Wooden log";
 		model = "a3\structures_f_epa\civ\camping\woodenlog_f.p3d";
 		picture = "\valor_items\ui\woodenlog_icon.paa";
 		class ItemInfo
 		{
 			mass=45;
 		};
 	};

 	class valor_battery: valor_item_base
 	{
 		displayName = "Battery";
 		model = "a3\structures_f_epa\items\electronics\battery_f.p3d";
 		picture = "\valor_items\ui\battery_icon.paa";
 		class ItemInfo
 		{
 			mass=4;
 		};
 	};

 	class valor_camera_01: valor_item_base
 	{
 		displayName = "Camera";
 		model = "a3\structures_f_heli\items\electronics\camera_01_f.p3d";
 		picture = "\valor_items\ui\camera_01_icon.paa";
 		class ItemInfo
 		{
 			mass=8;
 		};
 	};

 	class valor_carbattery_02: valor_item_base
 	{
 		displayName = "Car Battery (Car)";
 		model = "a3\structures_f_bootcamp\items\electronics\carbattery_02_f.p3d";
 		picture = "\valor_items\ui\carbattery_02_icon.paa";
 		class ItemInfo
 		{
 			mass=19;
 		};
 	};

 	class valor_extensioncord: valor_item_base
 	{
 		displayName = "Extension Cord";
 		model = "a3\structures_f\items\electronics\extensioncord_f.p3d";
 		picture = "\valor_items\ui\extensioncord_icon.paa";
 		class ItemInfo
 		{
 			mass=49;
 		};
 	};

 	class valor_bakedbeans: valor_item_base
 	{
 		displayName = "Baked Beans";
 		model = "a3\structures_f_epa\items\food\bakedbeans_f.p3d";
 		picture = "\valor_items\ui\bakedbeans_icon.paa";
 		class ItemInfo
 		{
 			mass=9;
 		};
 	};

 	class valor_can_dented: valor_item_base
 	{
 		displayName = "Can (Dented)";
 		model = "a3\structures_f\items\food\can_dented_f.p3d";
 		picture = "\valor_items\ui\can_dented_icon.paa";
 		class ItemInfo
 		{
 			mass=6;
 		};
 	};

 	class valor_can_v2: valor_item_base
 	{
 		displayName = "Can (Franta)";
 		model = "a3\structures_f\items\food\can_v2_f.p3d";
 		picture = "\valor_items\ui\can_v2_icon.paa";
 		class ItemInfo
 		{
 			mass=5;
 		};
 	};

 	class valor_can_v3: valor_item_base
 	{
 		displayName = "Can (RedGull)";
 		model = "a3\structures_f\items\food\can_v3_f.p3d";
 		picture = "\valor_items\ui\can_v3_icon.paa";
 		class ItemInfo
 		{
 			mass=5;
 		};
 	};

 	class valor_can_rusty: valor_item_base
 	{
 		displayName = "Can (Rusty)";
 		model = "a3\structures_f\items\food\can_rusty_f.p3d";
 		picture = "\valor_items\ui\can_rusty_icon.paa";
 		class ItemInfo
 		{
 			mass=5;
 		};
 	};

 	class valor_can_v1: valor_item_base
 	{
 		displayName = "Can (Spirit)";
 		model = "a3\structures_f\items\food\can_v1_f.p3d";
 		picture = "\valor_items\ui\can_v1_icon.paa";
 		class ItemInfo
 		{
 			mass=5;
 		};
 	};

 	class valor_canteen: valor_item_base
 	{
 		displayName = "Canteen";
 		model = "a3\structures_f_epa\items\food\canteen_f.p3d";
 		picture = "\valor_items\ui\canteen_icon.paa";
 		class ItemInfo
 		{
 			mass=18;
 		};
 	};

 	class valor_cerealsbox: valor_item_base
 	{
 		displayName = "Cereal box";
 		model = "a3\structures_f_epa\items\food\cerealsbox_f.p3d";
 		picture = "\valor_items\ui\cerealsbox_icon.paa";
 		class ItemInfo
 		{
 			mass=20;
 		};
 	};

 	class valor_orange_01: valor_item_base
 	{
 		displayName = "Orange";
 		model = "a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d";
 		picture = "\valor_items\ui\orange_01_icon.paa";
 		class ItemInfo
 		{
 			mass=9;
 		};
 	};

 	class valor_bottleplastic_v1: valor_item_base
 	{
 		displayName = "Plastic Bottle";
 		model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
 		picture = "\valor_items\ui\bottleplastic_v1_icon.paa";
 		class ItemInfo
 		{
 			mass=11;
 		};
 	};

 	class valor_pumpkin_01: valor_item_base
 	{
 		displayName = "Pumpkin";
 		model = "a3\props_f_orange\humanitarian\supplies\pumpkin_01_f.p3d";
 		picture = "\valor_items\ui\pumpkin_01_icon.paa";
 		class ItemInfo
 		{
 			mass=24;
 		};
 	};

 	class valor_ricebox: valor_item_base
 	{
 		displayName = "Rice";
 		model = "a3\structures_f_epa\items\food\ricebox_f.p3d";
 		picture = "\valor_items\ui\ricebox_icon.paa";
 		class ItemInfo
 		{
 			mass=12;
 		};
 	};

 	class valor_tacticalbacon: valor_item_base
 	{
 		displayName = "Tactical Bacon";
 		model = "a3\structures_f\items\food\tacticalbacon_f.p3d";
 		picture = "\valor_items\ui\tacticalbacon_icon.paa";
 		class ItemInfo
 		{
 			mass=6;
 		};
 	};

 	class valor_bottleplastic_v2: valor_item_base
 	{
 		displayName = "Water bottle";
 		model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
 		picture = "\valor_items\ui\bottleplastic_v2_icon.paa";
 		class ItemInfo
 		{
 			mass=14;
 		};
 	};

 	class valor_waterbottle_01_empty: valor_item_base
 	{
 		displayName = "Water bottle (empty)";
 		model = "a3\props_f_orange\humanitarian\supplies\waterbottle_01_empty_f.p3d";
 		picture = "\valor_items\ui\waterbottle_01_empty_icon.paa";
 		class ItemInfo
 		{
 			mass=14;
 		};
 	};

 	class valor_waterbottle_01_compressed: valor_item_base
 	{
 		displayName = "Water bottle (empty)";
 		model = "a3\props_f_orange\humanitarian\supplies\waterbottle_01_compressed_f.p3d";
 		picture = "\valor_items\ui\waterbottle_01_compressed_icon.paa";
 		class ItemInfo
 		{
 			mass=16;
 		};
 	};

 	class valor_waterbottle_01_pack: valor_item_base
 	{
 		displayName = "Water bottle (pack)";
 		model = "a3\props_f_orange\humanitarian\supplies\waterbottle_01_pack_f.p3d";
 		picture = "\valor_items\ui\waterbottle_01_pack_icon.paa";
 		class ItemInfo
 		{
 			mass=20;
 		};
 	};

 	class valor_antibiotic: valor_item_base
 	{
 		displayName = "Antibiotics";
 		model = "a3\structures_f_epa\items\medical\antibiotic_f.p3d";
 		picture = "\valor_items\ui\antibiotic_icon.paa";
 		class ItemInfo
 		{
 			mass=8;
 		};
 	};

 	class valor_bandage: valor_item_base
 	{
 		displayName = "Bandages";
 		model = "a3\structures_f_epa\items\medical\bandage_f.p3d";
 		picture = "\valor_items\ui\bandage_icon.paa";
 		class ItemInfo
 		{
 			mass=7;
 		};
 	};

 	class valor_bloodbag: valor_item_base
 	{
 		displayName = "Blood bag";
 		model = "a3\structures_f_epa\items\medical\bloodbag_f.p3d";
 		picture = "\valor_items\ui\bloodbag_icon.paa";
 		class ItemInfo
 		{
 			mass=13;
 		};
 	};

 	class valor_defibrillator: valor_item_base
 	{
 		displayName = "Defibrillator";
 		model = "a3\structures_f_epa\items\medical\defibrillator_f.p3d";
 		picture = "\valor_items\ui\defibrillator_icon.paa";
 		class ItemInfo
 		{
 			mass=26;
 		};
 	};

 	class valor_disinfectantspray: valor_item_base
 	{
 		displayName = "Disinfectant spray";
 		model = "a3\structures_f_epa\items\medical\disinfectantspray_f.p3d";
 		picture = "\valor_items\ui\disinfectantspray_icon.paa";
 		class ItemInfo
 		{
 			mass=15;
 		};
 	};

 	class valor_firstaidkit_01_closed: valor_item_base
 	{
 		displayName = "First Aid Box (Closed)";
 		model = "a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d";
 		picture = "\valor_items\ui\firstaidkit_01_closed_icon.paa";
 		class ItemInfo
 		{
 			mass=30;
 		};
 	};

 	class valor_heatpack: valor_item_base
 	{
 		displayName = "Heatpack";
 		model = "a3\structures_f_epa\items\medical\heatpack_f.p3d";
 		picture = "\valor_items\ui\heatpack_icon.paa";
 		class ItemInfo
 		{
 			mass=11;
 		};
 	};

 	class valor_intravenbag_01_empty: valor_item_base
 	{
 		displayName = "Intraven bag";
 		model = "a3\props_f_orange\humanitarian\camps\intravenbag_01_empty_f.p3d";
 		picture = "\valor_items\ui\intravenbag_01_empty_icon.paa";
 		class ItemInfo
 		{
 			mass=20;
 		};
 	};

 	class valor_painkillers: valor_item_base
 	{
 		displayName = "Pain killers";
 		model = "a3\structures_f_epa\items\medical\painkillers_f.p3d";
 		picture = "\valor_items\ui\painkillers_icon.paa";
 		class ItemInfo
 		{
 			mass=10;
 		};
 	};

 	class valor_vitaminbottle: valor_item_base
 	{
 		displayName = "Vitamin bottle";
 		model = "a3\structures_f_epa\items\medical\vitaminbottle_f.p3d";
 		picture = "\valor_items\ui\vitaminbottle_icon.paa";
 		class ItemInfo
 		{
 			mass=7;
 		};
 	};

 	class valor_waterpurificationtablets: valor_item_base
 	{
 		displayName = "Water purification tablets";
 		model = "a3\structures_f_epa\items\medical\waterpurificationtablets_f.p3d";
 		picture = "\valor_items\ui\waterpurificationtablets_icon.paa";
 		class ItemInfo
 		{
 			mass=15;
 		};
 	};

 	class valor_torquewrench_01: valor_item_base
 	{
 		displayName = "Metal Parts";
 		model = "a3\props_f_tank\military\tankacc\torquewrench_01_f.p3d";
 		picture = "\valor_items\ui\torquewrench_01_icon.paa";
 		class ItemInfo
 		{
 			mass=63;
 		};
 	};

 	class valor_tyre: valor_item_base
 	{
 		displayName = "Tire";
 		model = "a3\structures_f\civ\garbage\tyre_f.p3d";
 		picture = "\valor_items\ui\tyre_icon.paa";
 		class ItemInfo
 		{
 			mass=50;
 		};
 	};

 	class valor_van_02_rimless_tire: valor_item_base
 	{
 		displayName = "Tire";
 		model = "a3\soft_f_orange\van_02\van_02_rimless_tire_f.p3d";
 		picture = "\valor_items\ui\van_02_rimless_tire_icon.paa";
 		class ItemInfo
 		{
 			mass=58;
 		};
 	};

 	class valor_fireplace: valor_item_base
 	{
 		displayName = "Fireplace";
 		model = "a3\structures_f\civ\camping\fireplace_f.p3d";
 		picture = "\valor_items\ui\fireplace_icon.paa";
 		class ItemInfo
 		{
 			mass=72;
 		};
 	};

 	class valor_portable_generator: valor_item_base
 	{
 		displayName = "Portable Generator";
 		model = "a3\structures_f\items\electronics\portable_generator_f.p3d";
 		picture = "\valor_items\ui\portable_generator_icon.paa";
 		class ItemInfo
 		{
 			mass=68;
 		};
 	};

 	class valor_file1: valor_item_base
 	{
 		displayName = "File";
 		model = "a3\structures_f\items\documents\file1_f.p3d";
 		picture = "\valor_items\ui\file1_icon.paa";
 		class ItemInfo
 		{
 			mass=15;
 		};
 	};

 	class valor_campfire: valor_item_base
 	{
 		displayName = "Campfire";
 		model = "a3\structures_f\civ\camping\campfire_f.p3d";
 		picture = "\valor_items\ui\campfire_icon.paa";
 		class ItemInfo
 		{
 			mass=148;
 		};
 	};

 	class valor_gascooker: valor_item_base
 	{
 		displayName = "Gas cooker";
 		model = "a3\structures_f_epa\items\tools\gascooker_f.p3d";
 		picture = "\valor_items\ui\gascooker_icon.paa";
 		class ItemInfo
 		{
 			mass=15;
 		};
 	};

 	class valor_canisterfuel: valor_item_base
 	{
 		displayName = "Canister (full)";
 		model = "a3\structures_f\items\vessels\canisterfuel_f.p3d";
 		picture = "\valor_items\ui\canisterfuel_icon.paa";
 		class ItemInfo
 		{
 			mass=35;
 		};
 	};

    class valor_canisterfuel_empty: valor_canisterfuel
    {
        displayName = "Canister (empty)";
    };

 	class valor_butanecanister: valor_item_base
 	{
 		displayName = "Butane canister";
 		model = "a3\structures_f_epa\items\tools\butanecanister_f.p3d";
 		picture = "\valor_items\ui\butanecanister_icon.paa";
 		class ItemInfo
 		{
 			mass=11;
 		};
 	};

 	class valor_intravenbag_01_full: valor_item_base
 	{
 		displayName = "IV Bag (Full)";
 		model = "a3\props_f_orange\humanitarian\camps\intravenbag_01_full_f.p3d";
 		picture = "\valor_items\ui\intravenbag_01_full_icon.paa";
 		class ItemInfo
 		{
 			mass=16;
 		};
 	};

 	class valor_camping_light: valor_item_base
 	{
 		displayName = "Camping Lantern";
 		model = "a3\structures_f_epb\civ\camping\camping_light_f.p3d";
 		picture = "\valor_items\ui\camping_light_icon.paa";
 		class ItemInfo
 		{
 			mass=15;
 		};
 	};

 	class valor_ketchup_01: valor_item_base
 	{
 		displayName = "Ketchup Bottle";
 		model = "a3\structures_f_heli\items\food\ketchup_01_f.p3d";
 		picture = "\valor_items\ui\ketchup_01_icon.paa";
 		class ItemInfo
 		{
 			mass=11;
 		};
 	};

 	class valor_portablelongrangeradio: valor_item_base
 	{
 		displayName = "Portable Long-range Radio";
 		model = "a3\structures_f\items\electronics\portablelongrangeradio_f.p3d";
 		picture = "\valor_items\ui\portablelongrangeradio_icon.paa";
 		class ItemInfo
 		{
 			mass=9;
 		};
 	};

 	class valor_mustard_01: valor_item_base
 	{
 		displayName = "Mustard Bottle";
 		model = "a3\structures_f_heli\items\food\mustard_01_f.p3d";
 		picture = "\valor_items\ui\mustard_01_icon.paa";
 		class ItemInfo
 		{
 			mass=11;
 		};
 	};

 	class valor_fmradio: valor_item_base
 	{
 		displayName = "FM Radio";
 		model = "a3\structures_f\items\electronics\fmradio_f.p3d";
 		picture = "\valor_items\ui\fmradio_icon.paa";
 		class ItemInfo
 		{
 			mass=14;
 		};
 	};

 	class valor_van_02_vehicle_tire: valor_item_base
 	{
 		displayName = "Van Tire (Rim, Cargo)";
 		model = "a3\soft_f_orange\van_02\van_02_vehicle_tire_f.p3d";
 		picture = "\valor_items\ui\van_02_vehicle_tire_icon.paa";
 		class ItemInfo
 		{
 			mass=58;
 		};
 	};

 	class valor_emergencyblanket_01: valor_item_base
 	{
 		displayName = "Emergency Blanket";
 		model = "a3\props_f_orange\humanitarian\camps\emergencyblanket_01_f.p3d";
 		picture = "\valor_items\ui\emergencyblanket_01_icon.paa";
 		class ItemInfo
 		{
 			mass=37;
 		};
 	};

 	class valor_van_02_transport_tire: valor_item_base
 	{
 		displayName = "Van Tire (Rim, Transport)";
 		model = "a3\soft_f_orange\van_02\van_02_transport_tire_f.p3d";
 		picture = "\valor_items\ui\van_02_transport_tire_icon.paa";
 		class ItemInfo
 		{
 			mass=58;
 		};
 	};

 	class valor_cliff_stone_medium: valor_item_base
 	{
 		displayName = "Small Stone (Mossy)";
 		model = "a3\rocks_f_exp\cliff\cliff_stone_medium_f.p3d";
 		picture = "\valor_items\ui\cliff_stone_medium_icon.paa";
 		class ItemInfo
 		{
 			mass=68;
 		};
 	};

 	class valor_paperbox_01_small_closed: valor_item_base
 	{
 		displayName = "Cardboard Box (Medical) [IDAP]";
 		model = "a3\props_f_orange\humanitarian\supplies\paperbox_01_small_closed_f.p3d";
 		picture = "\valor_items\ui\paperbox_01_small_closed_icon.paa";
 		class ItemInfo
 		{
 			mass=46;
 		};
 	};

 	class valor_foodsack_01_full: valor_item_base
 	{
 		displayName = "Food Sack (Brown, Full)";
 		model = "a3\props_f_orange\humanitarian\supplies\foodsack_01_full_f.p3d";
 		picture = "\valor_items\ui\foodsack_01_full_icon.paa";
 		class ItemInfo
 		{
 			mass=43;
 		};
 	};

 	class valor_carbattery_01: valor_item_base
 	{
 		displayName = "Car Battery (Truck)";
 		model = "a3\structures_f_bootcamp\items\electronics\carbattery_01_f.p3d";
 		picture = "\valor_items\ui\carbattery_01_icon.paa";
 		class ItemInfo
 		{
 			mass=33;
 		};
 	};

 	class valor_sack: valor_item_base
 	{
 		displayName = "Sack";
 		model = "a3\structures_f\civ\market\sack_f.p3d";
 		picture = "\valor_items\ui\sack_icon.paa";
 		class ItemInfo
 		{
 			mass=71;
 		};
 	};

 	class valor_suitcase: valor_item_base
 	{
 		displayName = "Suitcase";
 		model = "a3\structures_f\items\luggage\suitcase_f.p3d";
 		picture = "\valor_items\ui\suitcase_icon.paa";
 		class ItemInfo
 		{
 			mass=40;
 		};
 	};
    class valor_blueprint1: valor_item_base
    {
        displayName = "Hero Level 1 Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };
    class valor_blueprint2: valor_item_base
    {
        displayName = "Hero Level 2 Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };

    class valor_blueprint3: valor_item_base
    {
        displayName = "Hero Level 3 Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };

    class valor_blueprint4: valor_item_base
    {
        displayName = "Bandit Level 1 Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };
    class valor_blueprint5: valor_item_base
    {
        displayName = "Bandit Level 2 Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };
        class valor_blueprint6: valor_item_base
    {
        displayName = "Bandit Level 3 Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };

    class valor_blueprint7: valor_item_base
    {
        displayName = "Castle Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };

    class valor_blueprint8: valor_item_base
    {
        displayName = "Wall Entrance Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };

    class valor_blueprint9: valor_item_base
    {
        displayName = "Wall Blueprint";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };

    class valor_blueprint10: valor_item_base
    {
        displayName = "Blueprint 10";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };
    class valor_blueprint11: valor_item_base
    {
        displayName = "Blueprint 11";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };
    class valor_blueprint12: valor_item_base
    {
        displayName = "Blueprint 12";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };
    class valor_blueprint13: valor_item_base
    {
        displayName = "Blueprint 13";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };
    class valor_blueprint14: valor_item_base
    {
        displayName = "Blueprint 14";
        model = "a3\structures_f\items\documents\file1_f.p3d";
        picture = "\valor_items\ui\file1_icon.paa";
        class ItemInfo
        {
            mass=15;
        };
    };

};
