class CfgPatches {
	class valor_backpacks {
		requiredVersion=0.1;
		requiredAddons[]={"A3_Characters_F","CACharacters","rhs_weapons"};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};

#define e(className, load) class className; class valor_##className : className {maximumLoad = load;};

class cfgVehicles {
    e(B_LegStrapBag_black_F, 100)
    e(B_LegStrapBag_olive_F, 100)
    e(B_LegStrapBag_coyote_F, 100)
    e(CUP_B_ACRScout_m95, 130)
    e(rhs_medic_bag, 150)
    e(CUP_B_AssaultPack_Black, 180)
    e(CUP_B_AssaultPack_Coyote, 180)
    e(B_AssaultPack_blk, 200)
    e(B_AssaultPack_cbr, 200)
    e(B_AssaultPack_rgr, 200)
    e(B_AssaultPack_sgg, 200)
    e(rhs_sidor, 250)
    e(CUP_B_USMC_MOLLE_WDL, 300)
    e(B_FieldPack_cbr, 350)
    e(B_FieldPack_khk, 350)
    e(B_FieldPack_oli, 350)
    e(B_Kitbag_mcamo, 370)
    e(B_Kitbag_sgg, 400)
    e(CUP_B_RUS_Backpack, 450)
    e(CUP_B_AlicePack_Khaki, 470)
    e(CUP_B_AlicePack_OD, 470)
    e(rhs_assault_umbts_engineer_empty, 500)
    e(CUP_B_Bergen_BAF, 550)
    e(CUP_B_AlicePack_Bedroll, 570)
    e(CUP_B_CivPack_WDL, 600)
    e(CUP_B_HikingPack_Civ, 620)
    e(B_Carryall_cbr, 650)
    e(B_Carryall_khk, 650)
    e(B_Carryall_oli, 650)
    e(CUP_B_USPack_Black, 700)
    e(CUP_B_USPack_Coyote, 700)
    class valor_inf_backpack : CUP_B_USPack_Coyote  { maximumLoad = 2147483647; model = "a3\weapons_f\empty.p3d";};
};