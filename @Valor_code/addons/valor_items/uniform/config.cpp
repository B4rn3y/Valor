class CfgPatches {
    class valor_backpacks {
        requiredVersion=0.1;
        requiredAddons[]={"A3_Characters_F","CACharacters","rhs_weapons","CUP_Creatures_People_Civil_Chernarus"};
        units[]={};
        weapons[]={};
        magazines[]={};
        ammo[]={};
    };
};



#define e(vehicleName) class vehicleName; class valor_##vehicleName : vehicleName {class HitPoints {     \
    class HitHead {                                                                                      \
      armor = 1;                                                                                         \
      material = -1;                                                                                     \
      name = "head";                                                                                     \
      passThrough = 0.8;                                                                                 \
      radius = 0.2;                                                                                      \
      explosionShielding = 0.5;                                                                          \
      minimalHit = 0.01;                                                                                 \
      depends = "HitFace max HitNeck";                                                                   \
    };                                                                                                   \
    class HitBody {                                                                                      \
      armor = 1000;                                                                                      \
      material = -1;                                                                                     \
      name = "body";                                                                                     \
      passThrough = 1;                                                                                   \
      radius = 0;                                                                                        \
      explosionShielding = 6;                                                                            \
      visual = "injury_body";                                                                            \
      minimalHit = 0.01;                                                                                 \
      depends = "HitPelvis max HitAbdomen max HitDiaphragm max HitChest";                                \
    };                                                                                                   \
    class HitHands {                                                                                     \
      armor = 3;                                                                                         \
      material = -1;                                                                                     \
      name = "hands";                                                                                    \
      passThrough = 1;                                                                                   \
      radius = 0.1;                                                                                      \
      explosionShielding = 1;                                                                            \
      visual = "injury_hands";                                                                           \
      minimalHit = 0.01;                                                                                 \
      depends = "HitArms";                                                                               \
    };                                                                                                   \
    class HitLegs {                                                                                      \
      armor = 3;                                                                                         \
      material = -1;                                                                                     \
      name = "legs";                                                                                     \
      passThrough = 1;                                                                                   \
      radius = 0.14;                                                                                     \
      explosionShielding = 1;                                                                            \
      visual = "injury_legs";                                                                            \
      minimalHit = 0.01;                                                                                 \
      depends = "0";                                                                                     \
    };                                                                                                   \
    class HitFace {                                                                                      \
      armor = 1;                                                                                         \
      material = -1;                                                                                     \
      name = "face_hub";                                                                                 \
      passThrough = 0.8;                                                                                 \
      radius = 0.08;                                                                                     \
      explosionShielding = 0.1;                                                                          \
      minimalHit = 0.01;                                                                                 \
    };                                                                                                   \
    class HitNeck {                                                                                      \
      armor = 1;                                                                                         \
      material = -1;                                                                                     \
      name = "neck";                                                                                     \
      passThrough = 0.8;                                                                                 \
      radius = 0.1;                                                                                      \
      explosionShielding = 0.5;                                                                          \
      minimalHit = 0.01;                                                                                 \
    };                                                                                                   \
    class HitPelvis {                                                                                    \
      armor = 6;                                                                                         \
      material = -1;                                                                                     \
      name = "pelvis";                                                                                   \
      passThrough = 0.8;                                                                                 \
      radius = 0.24;                                                                                     \
      explosionShielding = 1;                                                                            \
      visual = "injury_body";                                                                            \
      minimalHit = 0.01;                                                                                 \
      depends = "0";                                                                                     \
    };                                                                                                   \
    class HitAbdomen {                                                                                   \
      armor = 1;                                                                                         \
      material = -1;                                                                                     \
      name = "spine1";                                                                                   \
      passThrough = 0.8;                                                                                 \
      radius = 0.16;                                                                                     \
      explosionShielding = 1;                                                                            \
      visual = "injury_body";                                                                            \
      minimalHit = 0.01;                                                                                 \
    };                                                                                                   \
    class HitDiaphragm {                                                                                 \
      armor = 1;                                                                                         \
      material = -1;                                                                                     \
      name = "spine2";                                                                                   \
      passThrough = 0.8;                                                                                 \
      radius = 0.18;                                                                                     \
      explosionShielding = 6;                                                                            \
      visual = "injury_body";                                                                            \
      minimalHit = 0.01;                                                                                 \
    };                                                                                                   \
    class HitChest {                                                                                     \
      armor = 1;                                                                                         \
      material = -1;                                                                                     \
      name = "spine3";                                                                                   \
      passThrough = 0.8;                                                                                 \
      radius = 0.18;                                                                                     \
      explosionShielding = 6;                                                                            \
      visual = "injury_body";                                                                            \
      minimalHit = 0.01;                                                                                 \
    };                                                                                                   \
    class HitArms {                                                                                      \
      armor = 3;                                                                                         \
      material = -1;                                                                                     \
      name = "arms";                                                                                     \
      passThrough = 1;                                                                                   \
      radius = 0.1;                                                                                      \
      explosionShielding = 1;                                                                            \
      visual = "injury_hands";                                                                           \
      minimalHit = 0.01;                                                                                 \
      depends = "0";                                                                                     \
    };                                                                                                   \
    class Incapacitated {                                                                                \
      armor = 1000;                                                                                      \
      material = -1;                                                                                     \
      name = "body";                                                                                     \
      passThrough = 1;                                                                                   \
      radius = 0;                                                                                        \
      explosionShielding = 1;                                                                            \
      visual = "";                                                                                     \
      minimalHit = 0;                                                                                  \
      depends = "(((Total - 0.25) max 0) + ((HitHead - 0.25) max 0) + ((HitBody - 0.25) max 0)) * 2";    \
    };                                                                                                   \
};};

class CfgVehicles {
    e(CUP_C_UFireman_01)
    e(CUP_C_URescuer_01)
    e(CUP_C_UVillager_01)
    e(CUP_C_UVillager_02)
    e(CUP_C_UVillager_03)
    e(CUP_C_UVillager_04)
    e(CUP_C_UWoodlander_01)
    e(CUP_C_UWoodlander_02)
    e(CUP_C_UWoodlander_04)
    e(CUP_C_UWorker_01)
    e(CUP_C_UWorker_02)
    e(CUP_C_UWorker_03)
    e(CUP_C_UWorker_04)
    e(CUP_C_UMechanic_01)
    e(CUP_C_UMechanic_02)
    e(CUP_C_UMechanic_03)
    e(CUP_I_GUE_Soldier_14)
    e(CUP_I_GUE_Soldier_15)
    e(CUP_I_GUE_Soldier_16)
    e(CUP_Creatures_Military_CHDKZ_Soldier_01)
    e(CUP_Creatures_Military_CHDKZ_Soldier_03)
    e(CUP_C_UCitizen_01)
    e(CUP_C_UCitizen_02)
    e(CUP_C_UCitizen_03)
    e(CUP_C_UCitizen_04)
    e(CUP_I_GUE_Soldier_01)
    e(CUP_I_GUE_Soldier_02)
    e(CUP_I_GUE_Soldier_04)
    e(CUP_C_UPilot_01)
    e(CUP_C_UPriest_01)
    e(CUP_C_UProfiteer_01)
    e(CUP_C_UProfiteer_02)
    e(CUP_C_UProfiteer_03)
    e(CUP_C_UProfiteer_04)
    e(CUP_C_URocker_01)
    e(CUP_C_URocker_02)
    e(CUP_C_URocker_03)
    e(CUP_C_URocker_04)
    e(CUP_O_SLA_Soldier_Overalls_Pilot)
    e(CUP_O_SLA_Soldier_Overalls_Tank)
    e(CUP_C_UFunctionary_01)
    e(CUP_C_UFunctionary_02)
    e(CUP_O_TK_Soldier_02)
    e(CUP_I_RACS_Desert_Soldier_01)
    e(CUP_O_SLA_Soldier_06)
    e(CUP_O_SLA_Soldier_04)
};
#define s(vehicleName, uniformName) class uniformName; class valor_##uniformName : uniformName {class ItemInfo {uniformClass = valor_##vehicleName; uniformModel = "-"; type = 801; mass = 20; containerClass = "Supply20";};};
class CfgWeapons {
  s(CUP_C_UFireman_01,CUP_U_C_Fireman_01)
  s(CUP_C_URescuer_01,CUP_U_C_Rescuer_01)
  s(CUP_C_UVillager_01,CUP_U_C_Villager_01)
  s(CUP_C_UVillager_04,CUP_U_C_Villager_04)
  s(CUP_C_UVillager_02,CUP_U_C_Villager_02)
  s(CUP_C_UVillager_03,CUP_U_C_Villager_03)
  s(CUP_C_UWoodlander_01,CUP_U_C_Woodlander_01)
  s(CUP_C_UWoodlander_02,CUP_U_C_Woodlander_02)
  s(CUP_C_UWorker_03,CUP_U_C_Worker_03)
  s(CUP_C_UWorker_01,CUP_U_C_Worker_01)
  s(CUP_C_UWorker_02,CUP_U_C_Worker_02)
  s(CUP_C_UWorker_04,CUP_U_C_Worker_04)
  s(CUP_C_UMechanic_02,CUP_U_C_Mechanic_02)
  s(CUP_C_UMechanic_03,CUP_U_C_Mechanic_03)
  s(CUP_C_UMechanic_01,CUP_U_C_Mechanic_01)
  s(CUP_I_GUE_Soldier_14,CUP_U_I_GUE_Anorak_01)
  s(CUP_I_GUE_Soldier_16,CUP_U_I_GUE_Anorak_03)
  s(CUP_I_GUE_Soldier_15,CUP_U_I_GUE_Anorak_02)
  s(CUP_Creatures_Military_CHDKZ_Soldier_01,CUP_U_O_CHDKZ_Bardak)
  s(CUP_Creatures_Military_CHDKZ_Soldier_03,CUP_U_O_CHDKZ_Lopotev)
  s(CUP_C_UCitizen_02,CUP_U_C_Citizen_02)
  s(CUP_C_UCitizen_01,CUP_U_C_Citizen_01)
  s(CUP_C_UCitizen_04,CUP_U_C_Citizen_04)
  s(CUP_C_UCitizen_03,CUP_U_C_Citizen_03)
  s(CUP_I_GUE_Soldier_02,CUP_U_I_GUE_Flecktarn2)
  s(CUP_I_GUE_Soldier_04,CUP_U_I_GUE_Flecktarn3)
  s(CUP_I_GUE_Soldier_01,CUP_U_I_GUE_Flecktarn)
  s(CUP_C_UPilot_01,CUP_U_C_Pilot_01)
  s(CUP_C_UPriest_01,CUP_U_C_Priest_01)
  s(CUP_C_UProfiteer_02,CUP_U_C_Profiteer_02)
  s(CUP_C_UProfiteer_03,CUP_U_C_Profiteer_03)
  s(CUP_C_UProfiteer_01,CUP_U_C_Profiteer_01)
  s(CUP_C_UProfiteer_04,CUP_U_C_Profiteer_04)
  s(CUP_C_URocker_01,CUP_U_C_Rocker_01)
  s(CUP_C_URocker_03,CUP_U_C_Rocker_03)
  s(CUP_C_URocker_02,CUP_U_C_Rocker_02)
  s(CUP_C_URocker_04,CUP_U_C_Rocker_04)
  s(CUP_O_SLA_Soldier_Overalls_Pilot,CUP_U_O_SLA_Overalls_Pilot)
  s(CUP_O_SLA_Soldier_Overalls_Tank,CUP_U_O_SLA_Overalls_Tank)
  s(CUP_C_UFunctionary_01,CUP_U_C_Suit_01)
  s(CUP_C_UFunctionary_02,CUP_U_C_Suit_02)
  s(CUP_C_UWoodlander_04,CUP_U_C_Woodlander_04)
  s(CUP_O_TK_Soldier_02,CUP_U_O_TK_MixedCamo)
  s(CUP_I_RACS_Desert_Soldier_01,CUP_U_I_RACS_Desert_1)
  s(CUP_O_SLA_Soldier_06,CUP_U_O_Partisan_TTsKO)
  s(CUP_O_SLA_Soldier_04,CUP_U_O_SLA_Urban)
};