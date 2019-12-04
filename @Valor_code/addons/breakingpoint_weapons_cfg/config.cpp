/*
	Breaking Point Mod for Arma 3

	Released under Arma Public Share Like Licence (APL-SA)
	https://www.bistudio.com/community/licenses/arma-public-license-share-alike

	Alderon Games Pty Ltd
*/

#include "basicDefines.hpp"

class CfgPatches
{
	class breakingpoint_weapons_cfg
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"breakingpoint_weapons","A3_Weapons_F","A3_characters_F","A3_Data_F"};
	};
};

//Global External References
class Mode_SemiAuto;
class Mode_FullAuto;
class recoil_default;
class Mode_Burst;

/*
	Breaking Point: Melee Weapons
		By Deathlyrage
*/

class CfgRecoils
{
	Swing_recoil[] = {0,0.06,-0.1,0,0.1,-0.12,0.1,0,0};

	class recoil_22lr: recoil_default
	{
		muzzleOuter[] = {0.2,0.6,0.2,0.2};
		kickBack[] = {0.01,0.03};
		temporary = 0.01;
	};
};

class ItemActions
{
	class Use
	{
		text = "";
		script = "";
		use[] = {};
	};
};

class CfgMovesBasic
{
	class ManActions
	{
		GestureSwing = " ";
		GestureSwing2 = " ";
		GestureSwing3 = " ";
		GestureStab = " ";
		GestureMelee = " ";
		AdjustF = "";
		AdjustB = "";
		AdjustL = "";
		AdjustR = "";
		AdjustLF = "";
		AdjustLB = "";
		AdjustRB = "";
		AdjustRF = "";
		dooraction = "amovpercmwlksnonwnondf";
		GestureLegPush = "";
		agonyStart = "AinjPpneMstpSnonWnonDnon";
		agonyStop = "AmovPpneMstpSnonWnonDnon";
		medicStop = "AinvPknlMstpSnonWnonDnon_medicEnd";
		medicStart = "AinvPknlMstpSnonWnonDnon_medic0S";
		medicStartUp = "AinvPknlMstpSnonWrflDnon_medicUp0S";
		medicStartRightSide = "AinvPknlMstpSnonWnonDr_medic0S";
		GestureAgonyCargo = "";
		grabCarry = "Helper_SwitchToCarryRfl";
		grabCarried = "AinjPfalMstpSnonWnonDnon_carried_still";
		grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
		grabDragged = "AcinPknlMwlkSlowWrflDb_still";
		carriedStill = "AinjPfalMstpSnonWrflDnon_carried_still";
		released = "";
		releasedBad = "";
		Stop = "";
		StopRelaxed = "";
		TurnL = "";
		TurnR = "";
		TurnLRelaxed = "";
		TurnRRelaxed = "";
		ReloadMagazine = "";
		reloadGM6 = "";
		ReloadMGun = "";
		ReloadRPG = "ReloadRPG";
		ReloadMortar = "";
		ThrowPrepare = "";
		ThrowGrenade = "";
		WalkF = "";
		WalkLF = "";
		WalkRF = "";
		WalkL = "";
		WalkR = "";
		WalkLB = "";
		WalkRB = "";
		WalkB = "";
		PlayerWalkF = "";
		PlayerWalkLF = "";
		PlayerWalkRF = "";
		PlayerWalkL = "";
		PlayerWalkR = "";
		PlayerWalkLB = "";
		PlayerWalkRB = "";
		PlayerWalkB = "";
		SlowF = "";
		SlowLF = "";
		SlowRF = "";
		SlowL = "";
		SlowR = "";
		SlowLB = "";
		SlowRB = "";
		SlowB = "";
		PlayerSlowF = "";
		PlayerSlowLF = "";
		PlayerSlowRF = "";
		PlayerSlowL = "";
		PlayerSlowR = "";
		PlayerSlowLB = "";
		PlayerSlowRB = "";
		PlayerSlowB = "";
		FastF = "";
		FastLF = "";
		FastRF = "";
		FastL = "";
		FastR = "";
		FastLB = "";
		FastRB = "";
		FastB = "";
		TactF = "";
		TactLF = "";
		TactRF = "";
		TactL = "";
		TactR = "";
		TactLB = "";
		TactRB = "";
		TactB = "";
		PlayerTactF = "";
		PlayerTactLF = "";
		PlayerTactRF = "";
		PlayerTactL = "";
		PlayerTactR = "";
		PlayerTactLB = "";
		PlayerTactRB = "";
		PlayerTactB = "";
		EvasiveLeft = "";
		EvasiveRight = "";
		startSwim = "";
		surfaceSwim = "";
		bottomSwim = "";
		StopSwim = "";
		startDive = "AdvePercMrunSnonWnonDf";
		SurfaceDive = "AsdvPercMrunSnonWnonDf";
		BottomDive = "AbdvPercMrunSnonWnonDf";
		StopDive = "";
		Down = "";
		Up = "";
		PlayerStand = "";
		PlayerCrouch = "";
		PlayerProne = "";
		Lying = "";
		Stand = "";
		Combat = "";
		Crouch = "";
		CanNotMove = "";
		Civil = "";
		CivilLying = "";
		FireNotPossible = "";
		Die = "Unconscious";
		Unconscious = "Unconscious";
		WeaponOn = "";
		WeaponOff = "";
		Default = "";
		JumpOff = "";
		StrokeFist = "";
		StrokeGun = "";
		SitDown = "";
		Salute = "";
		saluteOff = "";
		GetOver = "";
		Diary = "";
		Surrender = "";
		Gear = "";
		BinocOn = "";
		BinocOff = "";
		PutDown = "";
		PutDownEnd = "";
		Medic = "";
		MedicOther = "";
		Treated = "";
		LadderOnDown = "";
		LadderOnUp = "";
		LadderOff = "";
		LadderOffTop = "";
		LadderOffBottom = "";
		GetInLow = "";
		GetInMedium = "";
		GetInHigh = "";
		GetInSDV = "";
		GetInHeli_Attack_01Pilot = "";
		GetInHeli_Attack_01Gunner = "";
		GetInHelicopterCargo = "";
		GetInMRAP_01 = "";
		GetInMRAP_01_cargo = "";
		GetOutMRAP_01 = "";
		GetOutMRAP_01_cargo = "";
		GetOutHelicopterCargo = "";
		GetOutLow = "";
		GetOutMedium = "";
		GetOutHigh = "";
		GetOutHighZamak = "";
		GetOutHighHemtt = "";
		GetOutSDV = "";
		GetOutHeli_Attack_01Pilot = "";
		GetOutHeli_Attack_01Gunner = "";
		TakeFlag = "";
		HandGunOn = "";
		gestureAttack = "";
		gestureGo = "";
		gestureGoB = "";
		gestureFreeze = "";
		gesturePoint = "";
		gestureCeaseFire = "";
		gestureCover = "";
		gestureUp = "";
		gestureNo = "";
		gestureYes = "";
		gestureFollow = "";
		gestureAdvance = "";
		gestureHi = "";
		gestureHiB = "";
		gestureHiC = "";
		gestureNod = "";
		GestureSpasm0 = "";
		GestureSpasm1 = "";
		GestureSpasm2 = "";
		GestureSpasm3 = "";
		GestureSpasm4 = "";
		GestureSpasm5 = "";
		GestureSpasm6 = "";
		GestureSpasm0weak = "";
		GestureSpasm1weak = "";
		GestureSpasm2weak = "";
		GestureSpasm3weak = "";
		GestureSpasm4weak = "";
		GestureSpasm5weak = "";
		GestureSpasm6weak = "";
		GestureReloadMX = "";
		GestureReloadMXCompact = "";
		GestureReloadMXSniper = "";
		GestureReloadMk20 = "";
		GestureReloadTRG = "";
		GestureReloadTRGUGL = "";
		GestureReloadKatiba = "";
		GestureReloadM200 = "";
		GestureReloadLRR = "";
		GestureReloadEBR = "";
		GestureReloadM4SSAS = "";
		GestureReloadSMG_02 = "";
		GestureReloadSMG_03 = "";
		GestureReloadPistol = "";
		GestureReloadPistolHeavy02 = "";
		GestureReloadFlaregun = "";
		GestureReloadSMG_01 = "";
		GestureReloadSDAR = "";
		GestureReloadDMR = "";
		MountOptic = "";
		DismountOptic = "";
		MountSide = "";
		DismountSide = "";
		GestureMountMuzzle = "";
		GestureDismountMuzzle = "";
		healedStart = "";
		healedStop = "";
		TestDriver = "BasicDriver";
		TestDriverOut = "BasicDriverOut";
		TestGunner = "BasicSittingGunner";
		Relax = "";
		swimUp = "";
		swimDown = "";
		StartFreefall = "";
		PrimaryWeapon = "";
		SecondaryWeapon = "";
		Binoculars = "";
 		crossbow_reload = "crossbow_reload";















		BP_Jump = " ";
		BP_Zomb_Act_Attack1 = " ";
		BP_Zomb_Act_Attack2 = " ";
		BP_Act_Man_Drink_Erc_x3_Gesture = "";
		BP_Act_Man_Eat_Erc_x3_Gesture = "";

		MOCAP_Man_Act_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg = "";

		MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "";

		MOCAP_Man_Act_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg = "";

		MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct = "";
		MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct = "";

		MOCAP_Man_Act_Idle_Stay_CivPace_Non_Push_Kick_LeftLeg = "";
	};

	class StandBase;  //extern

	class Actions
	{
		class NoActions : ManActions
		{
			GestureSwing[] = {"GestureSwing", "Gesture"};
			GestureSwing2[] = {"GestureSwing2", "Gesture"};
			GestureSwing3[] = {"GestureSwing3", "Gesture"};
			GestureStab[] = {"GestureStab", "Gesture"};
			GestureMelee[] = {"GestureMelee", "Gesture"};
			GestureLegPush[] = {"GestureLegPush", "Gesture"};
			GestureNod[] = {"GestureNod", "Gesture"};
			GestureAgonyCargo[] = {"GestureAgonyCargo", "Gesture"};
			access = 3;
			ladderOnDown = "LadderCivilOn_Top";
			ladderOnUp = "LadderCivilOn_Top";
			turnSpeed = 1;
			upDegree = -1;
			stance = "ManStanceUndefined";
			limitFast = 5;
			leanRRot = 0;
			leanRShift = 0;
			leanLRot = 0;
			leanLShift = 0;
			useFastMove = 0;
			GestureSpasm0[] = {"GestureSpasm0", "Gesture"};
			GestureSpasm1[] = {"GestureSpasm1", "Gesture"};
			GestureSpasm2[] = {"GestureSpasm2", "Gesture"};
			GestureSpasm3[] = {"GestureSpasm3", "Gesture"};
			GestureSpasm4[] = {"GestureSpasm4", "Gesture"};
			GestureSpasm5[] = {"GestureSpasm5", "Gesture"};
			GestureSpasm6[] = {"GestureSpasm6", "Gesture"};
			GestureSpasm0weak[] = {"GestureSpasm0weak", "Gesture"};
			GestureSpasm1weak[] = {"GestureSpasm1weak", "Gesture"};
			GestureSpasm2weak[] = {"GestureSpasm2weak", "Gesture"};
			GestureSpasm3weak[] = {"GestureSpasm3weak", "Gesture"};
			GestureSpasm4weak[] = {"GestureSpasm4weak", "Gesture"};
			GestureSpasm5weak[] = {"GestureSpasm5weak", "Gesture"};
			GestureSpasm6weak[] = {"GestureSpasm6weak", "Gesture"};
			GestureReloadMk20[] = {"GestureReloadMk20", "Gesture"};
			GestureReloadMX[] = {"GestureReloadMX", "Gesture"};
			GestureReloadMXCompact[] = {"GestureReloadMXCompact", "Gesture"};
			GestureReloadMXSniper[] = {"GestureReloadMXSniper", "Gesture"};
			GestureReloadTRG[] = {"GestureReloadTRG", "Gesture"};
			GestureReloadTRGUGL[] = {"GestureReloadTRGUGL", "Gesture"};
			GestureReloadKatiba[] = {"GestureReloadKatiba", "Gesture"};
			GestureReloadM200[] = {"GestureReloadM200", "Gesture"};
			GestureReloadLRR[] = {"GestureReloadLRR", "Gesture"};
			GestureReloadEBR[] = {"GestureReloadEBR", "Gesture"};
			GestureReloadSMG_02[] = {"GestureReloadSMG_02", "Gesture"};
			GestureReloadSMG_03[] = {"GestureReloadSMG_03", "Gesture"};
			GestureReloadPistol[] = {"GestureReloadPistol", "Gesture"};
			GestureReloadPistolHeavy02[] = {"GestureReloadPistolHeavy02", "Gesture"};
			GestureReloadFlaregun[] = {"GestureReloadFlaregun", "Gesture"};
			GestureReloadSMG_01[] = {"GestureReloadSMG_01", "Gesture"};
			GestureReloadSDAR[] = {"GestureReloadSDAR", "Gesture"};
			GestureReloadDMR[] = {"GestureReloadDMR", "Gesture"};
			GestureReloadM4SSAS[] = {"GestureReloadM4SSAS", "Gesture"};
			GestureMountMuzzle[] = {"GestureMountMuzzle", "Gesture"};
			GestureDismountMuzzle[] = {"GestureDismountMuzzle", "Gesture"};
			grabCarried = "AinjPfalMstpSnonWrflDnon_carried_Up";
			crossbow_reload[] = {"crossbow_reload", "Gesture"};

			BP_Jump[] = {"BP_Jump", "Gesture"};
			BP_Zomb_Act_Attack1[] = {"BP_Zomb_Attack1","Gesture"};
			BP_Zomb_Act_Attack2[] = {"BP_Zomb_Attack2","Gesture"};

			BP_Act_Man_Drink_Erc_x3_Gesture[] = {"BP_Drink_Erc_x3_Gesture", "Gesture"};
			BP_Act_Man_Eat_Erc_x3_Gesture[] = {"BP_Eat_Erc_x3_Gesture", "Gesture"};
		};

/*
		class RifleStandActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg";
		};
		class RifleCrouchActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg = "";
		};
		class RifleKneelActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg = "";
		};
		class RifleLowStandActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg";
		};
		class RifleAdjustStandBaseActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg";
		};

		//Pistol
		class PistolStandActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg";
		};
		class PistolLowStandActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg";
		};
		class PistolStandActionsNoAdjust{
			MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg";
		};
		class PistolLowStandActionsNoAdjust{
			MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg";
		};
		class PistolKneelActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "";
		};
		class PistolLowKneelActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "";
		};
		class PistolProneActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg = "";
		};

		//Launcher
		class LauncherStandActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg";
		};
		class LauncherKneelActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg = "";
		};
		class LauncherProneActions {
			MOCAP_Man_Act_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg = "";
		};

		//Melee
		class CivilStandActions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Right_Direct","Gesture"};
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Left_Direct","Gesture"};
			MOCAP_Man_Act_Idle_Stay_CivPace_Non_Push_Kick_LeftLeg = "MOCAP_Idle_Stay_CivPace_Non_Push_Kick_LeftLeg";
		};
		class CivilKneelActions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Right_Direct","Gesture"};
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Left_Direct","Gesture"};
		};
		class CivilProneActions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct = "";
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct = "";
		};
		class CivilStandSurrenderActions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct = "";
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct = "";
		};
		class CivilSiTactions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct = "";
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct = "";
		};
		class CivilStandSaluteActions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct = "";
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct = "";
		};
		class CivilEvasiveActions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Right_Direct","Gesture"};
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Left_Direct","Gesture"};
		};
		class CivilRunActions {
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Right_Direct","Gesture"};
			MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct[] = {"MOCAP_Gesture_CivPace_Non_Punch_Hand_Left_Direct","Gesture"};
		};

*/

		class RifleBaseStandActions;
		class RifleProneActions: RifleBaseStandActions
		{
			crossbow_reload[] = {"crossbow_reload_prone", "Gesture"};
		};
		class RifleAdjustProneBaseActions;
		class RifleAdjustRProneActions: RifleAdjustProneBaseActions
		{
			crossbow_reload[] = {"crossbow_reload_prone", "Gesture"};
		};
		class RifleAdjustLProneActions: RifleAdjustProneBaseActions
		{
			crossbow_reload[] = {"crossbow_reload_prone", "Gesture"};
		};
		class RifleAdjustFProneActions: RifleAdjustProneBaseActions
		{
			crossbow_reload[] = {"crossbow_reload_prone", "Gesture"};
		};

	};
};

class CfgMovesMaleSdr: CfgMovesBasic
{
	skeletonName = "OFP2_ManSkeleton";
	gestures = "CfgGesturesMale";

	class States
	{
		class TransAnimBase; //extern
		class TransAnimBase_noIK;  //extern
		class AidlPknlMstpSrasWlnrDnon_G0S; //extern
		class AidlPpneMstpSrasWrflDnon_G0S;  //extern
		class AidlPercMstpSrasWlnrDnon_G0S; //extern
		class AidlPpneMstpSrasWpstDnon_G0S;  //extern
		class AadjPpneMstpSrasWpstDup;  //extern


		class AmovPercMstpSlowWrflDnon; //stay weap low
		class AmovPercMstpSrasWrflDnon; //stay weap up
		//class AmovPknlMstpSlowWrflDnon; //kneel weap low
		class AmovPknlMstpSrasWrflDnon; //kneel weap up
		class AmovPsitMstpSrasWrflDnon; //sit weap
		class AmovPercMstpSrasWrflDnon_Salute; //salute weap up
		class AmovPercMstpSlowWrflDnon_Salute; //salute weap low
		class AmovPercMstpSlowWpstDnon; //stay pistol low
		class AmovPercMstpSrasWpstDnon; //stay pistol up
		class AmovPknlMstpSlowWpstDnon; //kneel pistol low
		class AmovPknlMstpSrasWpstDnon; //kneel pistol up
		class amovpsitmstpsnonwpstdnon_ground; //sit pistol
		class AmovPercMstpSrasWpstDnon_Salute; //salute pistol up
		class AmovPercMstpSnonWnonDnon; //stay no weapon
		class AmovPknlMstpSnonWnonDnon; //kneel no weapon
		class AmovPpneMstpSnonWnonDnon; //prone no weapon
		class AmovPsitMstpSnonWnonDnon_ground; //sit no weapon
		class amovpercmstpsnonwnondnon_salute; //salute no weapon
		class AmovPercMstpSsurWnonDnon; //Surrender no weapon
		//class AmovPercMstpSrasWlnrDnon; //stay launcher up
		class AmovPercMstpSlowWlnrDnon; //stay launcher low
		class AmovPknlMstpSrasWlnrDnon; //kneel launcher
		//class AmovPknlMstpSnonWnonDf; 	//kneel no weapon forward
		class AmovPercMstpSlowWrflDnon_gear;
		class AovrPercMstpSnonWnonDf; //vault from object

		class DeadState;



		class AadjPpneMstpSrasWrflDup: AidlPpneMstpSrasWrflDnon_G0S
		{
			file = "\A3\anims_f\Data\Anim\Sdr\Adj\pne\stp\ras\rfl\AadjPpneMstpSrasWrflDup.rtm";
			canBlendStep = 0;
			actions = "RifleAdjustFProneActions";
			speed = 0.084746;
			adjstance = "u";
			soundEnabled = 0;
			camShakeFire = 0.700000;
			ConnectTo[] = {"AadjPpneMstpSrasWrflDup", 0.020000, "AadjPpneMstpSrasWrflDup_AmovPpneMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDup_AadjPknlMstpSrasWrflDdown", 0.020000, "AadjPpneMstpSrasWrflDup_turnL", 0.020000, "AadjPpneMstpSrasWrflDup_turnR", 0.020000};
			InterpolateTo[] = {"AadjPpneMstpSrasWrflDup_AmovPpneMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDup_AadjPknlMstpSrasWrflDdown", 0.020000, "AadjPpneMstpSrasWrflDup_turnL", 0.020000, "AadjPpneMstpSrasWrflDup_turnR", 0.020000, "AadjPpneMwlkSrasWrflDup_l", 0.020000, "AadjPpneMwlkSrasWrflDup_r", 0.020000, "AadjPpneMwlkSrasWrflDup_f", 0.020000, "AadjPpneMwlkSrasWrflDup_b", 0.020000, "Unconscious", 0.100000};
		};

		class AadjPpneMstpSrasWpstDdown: AadjPpneMstpSrasWpstDup
		{
			enableOptics = 1;
			file = "\A3\anims_f\Data\Anim\Sdr\Adj\pne\stp\ras\pst\AadjPpneMstpSrasWpstDdown.rtm";
			actions = "PistolAdjustBProneActions";
			speed = 0.365854;
			adjstance = "d";
			ConnectTo[] = {"AadjPpneMstpSrasWpstDdown", 0.020000, "AadjPpneMstpSrasWpstDdown_AmovPpneMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDdown_turnL", 0.020000, "AadjPpneMstpSrasWpstDdown_turnR", 0.020000};
			InterpolateTo[] = {"AadjPpneMstpSrasWpstDdown_AmovPpneMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDdown_turnL", 0.020000, "AadjPpneMstpSrasWpstDdown_turnR", 0.020000, "Unconscious", 0.100000};
		};

		class AadjPpneMstpSrasWpstDright: AidlPpneMstpSrasWpstDnon_G0S
		{
			file = "\A3\anims_f\Data\Anim\Sdr\Adj\pne\stp\ras\pst\AadjPpneMstpSrasWpstDright.rtm";
			actions = "PistolAdjustRProneActions";
			speed = 0.084746;
			adjstance = "r";
			enableOptics = 1;
			ConnectTo[] = {"AadjPpneMstpSrasWpstDright", 0.020000, "AadjPpneMstpSrasWpstDright_AmovPpneMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDright_AmovPercMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDright_AmovPknlMstpSrasWpstDnon", 0.020000};
			InterpolateTo[] = {"AadjPpneMstpSrasWpstDright_AmovPpneMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDright_AmovPercMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDright_AmovPknlMstpSrasWpstDnon", 0.020000, "AadjPpneMwlkSrasWpstDright_l", 0.020000, "AadjPpneMwlkSrasWpstDright_r", 0.020000, "Unconscious", 0.100000};
		};

		class AadjPpneMstpSrasWpstDleft: AidlPpneMstpSrasWpstDnon_G0S
		{
			file = "\A3\anims_f\Data\Anim\Sdr\Adj\pne\stp\ras\pst\AadjPpneMstpSrasWpstDleft.rtm";
			actions = "PistolAdjustLProneActions";
			speed = 0.084746;
			adjstance = "l";
			enableOptics = 1;
			ConnectTo[] = {"AadjPpneMstpSrasWpstDleft", 0.020000, "AadjPpneMstpSrasWpstDleft_AmovPpneMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDleft_AmovPercMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDleft_AmovPknlMstpSrasWpstDnon", 0.020000};
			InterpolateTo[] = {"AadjPpneMstpSrasWpstDleft_AmovPpneMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDleft_AmovPercMstpSrasWpstDnon", 0.020000, "AadjPpneMstpSrasWpstDleft_AmovPknlMstpSrasWpstDnon", 0.020000, "AadjPpneMwlkSrasWpstDleft_l", 0.020000, "AadjPpneMwlkSrasWpstDleft_r", 0.020000, "Unconscious", 0.100000};
		};

		class AadjPpneMstpSrasWrflDdown: AadjPpneMstpSrasWrflDup
		{
			file = "\A3\anims_f\Data\Anim\Sdr\Adj\pne\stp\ras\rfl\AadjPpneMstpSrasWrflDdown.rtm";
			aimPrecision = 0.500000;
			speed = 0.365854;
			actions = "RifleAdjustBProneActions";
			adjstance = "d";
			enableOptics = 1;
			soundEnabled = 0;
			ConnectTo[] = {"AadjPpneMstpSrasWrflDdown", 0.020000, "AadjPpneMstpSrasWrflDdown_turnL", 0.020000, "AadjPpneMstpSrasWrflDdown_turnR", 0.020000, "AadjPpneMstpSrasWrflDdown_AmovPpneMstpSrasWrflDnon", 0.020000};
			InterpolateTo[] = {"AadjPpneMstpSrasWrflDdown_AmovPpneMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDdown_turnL", 0.020000, "AadjPpneMstpSrasWrflDdown_turnR", 0.020000, "Unconscious", 0.100000};
		};

		class AadjPpneMstpSrasWrflDleft: AidlPpneMstpSrasWrflDnon_G0S //enable prone optics
		{
			aimPrecision = 0.500000;
			file = "\A3\anims_f\Data\Anim\Sdr\Adj\pne\stp\ras\rfl\AadjPpneMstpSrasWrflDleft.rtm";
			actions = "RifleAdjustLProneActions";
			speed = 0.084746;
			adjstance = "l";
			enableOptics = 1;
			soundEnabled = 0;
			collisionShape = "A3\anims_f\Data\Geom\Sdr\Ppne_Adjl.p3d";
			ConnectTo[] = {"AadjPpneMstpSrasWrflDleft", 0.020000, "AadjPpneMstpSrasWrflDleft_AmovPpneMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDleft_AmovPercMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDleft_AmovPknlMstpSrasWrflDnon", 0.020000};
			InterpolateTo[] = {"AadjPpneMstpSrasWrflDleft_AmovPpneMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDleft_AmovPercMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDleft_AmovPknlMstpSrasWrflDnon", 0.020000, "AadjPpneMwlkSrasWrflDleft_l", 0.020000, "AadjPpneMwlkSrasWrflDleft_r", 0.020000, "Unconscious", 0.100000};
		};

		class AadjPpneMstpSrasWrflDright: AidlPpneMstpSrasWrflDnon_G0S //enable prone optics
		{
			aimPrecision = 0.500000;
			file = "\A3\anims_f\Data\Anim\Sdr\Adj\pne\stp\ras\rfl\AadjPpneMstpSrasWrflDright.rtm";
			actions = "RifleAdjustRProneActions";
			speed = 0.084746;
			adjstance = "r";
			enableOptics = 1;
			soundEnabled = 0;
			collisionShape = "A3\anims_f\Data\Geom\Sdr\Ppne_Adjr.p3d";
			ConnectTo[] = {"AadjPpneMstpSrasWrflDright", 0.020000, "AadjPpneMstpSrasWrflDright_AmovPpneMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDright_AmovPercMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDright_AmovPknlMstpSrasWrflDnon", 0.020000};
			InterpolateTo[] = {"AadjPpneMstpSrasWrflDright_AmovPpneMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDright_AmovPercMstpSrasWrflDnon", 0.020000, "AadjPpneMstpSrasWrflDright_AmovPknlMstpSrasWrflDnon", 0.020000, "AadjPpneMwlkSrasWrflDright_l", 0.020000, "AadjPpneMwlkSrasWrflDright_r", 0.020000, "Unconscious", 0.100000};
		};

		class amovpercmstpsraswlnrdnon: AmovPknlMstpSrasWlnrDnon
		{
			aimPrecision = 1.000000;
			variantsPlayer[] = {"AidlPercMstpSrasWlnrDnon_G01", 0.500000, "AidlPercMstpSrasWlnrDnon_G02", 0.500000};
			variantAfter[] = {6, 6, 6};
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\lnr\amovpercmstpsraswlnrdnon.rtm";
			duty = -0.200000;
			actions = "LauncherStandActions";
			collisionShape = "A3\anims_f\Data\Geom\Sdr\Perc_Wrfl.p3d";
			aiming = "aimingDefault";
			ConnectTo[] = {"LauncherReloadStand", 0.020000, "amovpercmstpsraswlnrdnon_amovpercmstpSlowwlnrdnon", 0.010000, "amovpercmstpsraswlnrdnon_amovpercmstpsraswrfldnon", 0.010000, "amovpercmstpsraswlnrdnon_amovpknlmstpsraswlnrdnon", 0.020000, "AmovPercMstpSrasWlnrDnon_AmovPpneMstpSnonWnonDnon", 0.020000, "AmovPercMstpSrasWlnrDnon_AmovPpneMstpSrasWlnrDnon", 0.020000, "AswmPercMstpSnonWnonDnon", 0.300000, "aidlpercmstpsraswlnrdnon_S", 0.020000, "amovpercmstpsraswlnrdnon_turnl", 0.020000, "amovpercmstpSraswlnrdnon_turnr", 0.020000, "amovpercmstpsraswlnrdnon_amovpercmstpsnonwnondnon", 0.010000, "AmovPercMstpSrasWlnrDnon_AwopPercMstpSoptWbinDnon", 0.020000, "amovpercmstpsraswlnrdnon_amovpercmstpsraswpstdnon", 0.020000, "ReloadRPG", 0.200000, "amovpercmstpsraswlnrdnon", 0.020000};
			InterpolateTo[] = {"amovpercmstpsraswlnrdnon_turnl", 0.020000, "amovpercmstpSraswlnrdnon_turnr", 0.020000, "AmovPercMwlkSrasWlnrDf", 0.020000, "AovrPercMstpSrasWlnrDf", 0.010000, "AmovPercMevaSlowWlnrDf", 0.020000, "AmovPercMwlkSrasWlnrDfl", 0.020000, "AmovPercMwlkSrasWlnrDl", 0.020000, "AmovPercMwlkSrasWlnrDbl", 0.020000, "AmovPercMwlkSrasWlnrDb", 0.020000, "AmovPercMwlkSrasWlnrDbr", 0.020000, "AmovPercMwlkSrasWlnrDr", 0.020000, "AmovPercMwlkSrasWlnrDfr", 0.020000, "AmovPercMrunSrasWlnrDf", 0.020000, "AmovPercMrunSrasWlnrDfl", 0.020000, "AmovPercMrunSrasWlnrDl", 0.020000, "AmovPercMrunSrasWlnrDbl", 0.020000, "AmovPercMrunSrasWlnrDb", 0.020000, "AmovPercMrunSrasWlnrDbr", 0.020000, "AmovPercMrunSrasWlnrDr", 0.020000, "AmovPercMrunSrasWlnrDfr", 0.020000, "AmovPercMtacSrasWlnrDf", 0.020000, "AmovPercMtacSrasWlnrDfl", 0.020000, "AmovPercMtacSrasWlnrDl", 0.020000, "AmovPercMtacSrasWlnrDbl", 0.020000, "AmovPercMtacSrasWlnrDb", 0.020000, "AmovPercMtacSrasWlnrDbr", 0.020000, "AmovPercMtacSrasWlnrDr", 0.020000, "AmovPercMtacSrasWlnrDfr", 0.020000, "Unconscious", 0.100000, "HaloFreeFall_non", 10.200000, "AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon", 0.020000, "AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon_Putdown", 0.020000, "AfalPercMstpSrasWlnrDnon", 0.025000, "ReloadRPGKneel", 0.050000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class AmovPercMrunSlowWlnrDf: AidlPknlMstpSrasWlnrDnon_G0S
		{
			actions = "LauncherStandRunFActions";
			file = "\A3\anims_f\Data\Anim\Sdr\Mov\erc\run\low\lnr\AmovPercMrunSlowWlnrDf";
			soundEdge[] = {0.250000, 0.500000, 0.750000, 1};
			speed = 0.910750;
			duty = 0.000000;
			canPullTrigger = 1;
			disableWeapons = 0;
			disableWeaponsLong = 0;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leaningFactorBeg = 0.750000;
			leaningFactorEnd = 0.750000;
			soundEnabled = 1;
			soundOverride = "run";
			enableMissile = 1;
			collisionShape = "A3\anims_f\Data\Geom\Sdr\Perc_Wnon.p3d";
			relSpeedMin = 0.500000;
			relSpeedMax = 1.100000;
			Walkcycles = 2;
			weaponLowered = 0;
			ConnectTo[] = {};
			InterpolateTo[] = {"Unconscious", 0.010000, "AmovPknlMrunSrasWlnrDf", 0.030000, "AmovPercMrunSlowWlnrDfl", 0.025000, "AmovPercMrunSlowWlnrDfr", 0.025000, "amovpercmstpSlowwlnrdnon", 0.020000, "AmovPercMwlkSlowWlnrDf", 0.025000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class AmovPknlMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon //crouch anim
		{
			variantsPlayer[] = {"AidlPknlMstpSlowWrflDnon_G01", 0.250000, "AidlPknlMstpSlowWrflDnon_G02", 0.250000, "AidlPknlMstpSlowWrflDnon_G03", 0.250000};
			actions = "RifleKneelLowActions";
			duty = -0.600000;
			file = "\A3\anims_f\Data\Anim\Sdr\Mov\knl\stp\low\rfl\AmovPknlMstpSlowWrflDnon.rtm";
			visibleSize = 0.300122;
			aimprecision = 0.325000;
			camShakeFire = 0.500000;
			collisionShape = "A3\anims_f\data\geom\sdr\Pknl_Wrfl_Low.p3d";
			interpolationSpeed = 4.000000;
			ConnectTo[] = {"AidlPknlMstpSlowWrflDnon_G0S", 0.010000, "AmovPknlMstpSlowWrflDnon_gear", 0.020000, "AmovPknlMstpSlowWrflDnon", 0.020000, "AmovPknlMstpSlowWrflDnon_diary", 0.020000, "AmovPknlMstpSrasWrflDnon_diary", 0.020000, "AmovPercMstpSrasWrflDnon_diary", 0.020000, "AmovPercMstpSlowWrflDnon_gear", 0.020000, "AmovPercMstpSlowWrflDnon_diary", 0.020000, "AidlPknlMstpSlowWrflDnon_AI", 0.100000, "AmovPknlMstpSlowWrflDnon_turnL", 0.020000, "AmovPknlMstpSlowWrflDnon_turnR", 0.020000, "amovpknlmstpSlowwrfldnon_amovpknlmstpsraswrfldnon", 0.010000, "AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon", 0.010000, "AmovPknlMstpSlowWrflDnon_AmovPpneMstpSrasWrflDnon", 0.010000};
			InterpolateTo[] = {"AidlPknlMstpSlowWrflDnon_AI", 0.100000, "AmovPknlMstpSlowWrflDnon_turnL", 0.020000, "AmovPknlMstpSlowWrflDnon_turnR", 0.020000, "AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic", 0.020000, "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon_Putdown", 0.020000, "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon", 0.020000, "AmovPknlMwlkSlowWrflDf", 0.020000, "AmovPknlMwlkSlowWrflDfl", 0.020000, "AmovPknlMwlkSlowWrflDl", 0.020000, "AmovPknlMwlkSlowWrflDbl", 0.020000, "AmovPknlMwlkSlowWrflDb", 0.020000, "AmovPknlMwlkSlowWrflDbr", 0.020000, "AmovPknlMwlkSlowWrflDr", 0.020000, "AmovPknlMwlkSlowWrflDfr", 0.020000, "AmovPknlMrunSlowWrflDf", 0.010000, "AmovPknlMrunSlowWrflDfl", 0.020000, "AmovPknlMrunSlowWrflDl", 0.020000, "AmovPknlMrunSlowWrflDbl", 0.020000, "AmovPknlMrunSlowWrflDb", 0.020000, "AmovPknlMrunSlowWrflDbr", 0.020000, "AmovPknlMrunSlowWrflDr", 0.020000, "AmovPknlMrunSlowWrflDfr", 0.020000, "AmovPknlMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon", 0.020000, "AovrPercMstpSlowWrflDf", 0.020000, "Unconscious", 0.010000, "AmovPknlMstpSlowWrflDnon_relax", 10.010000, "AmovPknlMtacSlowWrflDf", 0.020000, "AmovPknlMtacSlowWrflDfl", 0.020000, "AmovPknlMtacSlowWrflDl", 0.020000, "AmovPknlMtacSlowWrflDbl", 0.020000, "AmovPknlMtacSlowWrflDb", 0.020000, "AmovPknlMtacSlowWrflDbr", 0.020000, "AmovPknlMtacSlowWrflDr", 0.020000, "AmovPknlMtacSlowWrflDfr", 0.020000, "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1", 0.010000, "Acts_CrouchGetLowGesture", 1.000000};
		};

		class AmovPpneMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon //prone anim
		{
			variantsPlayer[] = {"AidlPpneMstpSrasWrflDnon_G01_player", 0.400000, "AidlPpneMstpSrasWrflDnon_G02_player", 0.300000, "AidlPpneMstpSrasWrflDnon_G03_player", 0.300000};
			variantsAI[] = {};
			actions = "RifleProneActions";
			duty = -0.800000;
			file = "\A3\anims_f\Data\Anim\Sdr\Mov\Pne\stp\ras\rfl\AmovPpneMstpSrasWrflDnon.rtm";
			collisionShape = "A3\anims_f\Data\Geom\Sdr\Ppne.p3d";
			onLandBeg = 1;
			onLandEnd = 1;
			visibleSize = 0.100123;
			aimprecision = 0.020000;
			camShakeFire = 0.200000;
			leaningFactorBeg = 0;
			leaningFactorEnd = 0;
			soundOverride = "crawl";
			headBobStrength = 0.154229;
			interpolationSpeed = 2.500000;
			ConnectTo[] = {"AmovPpneMstpSrasWrflDnon_injured", 0.100000, "AmovPpneMstpSrasWrflDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_turnL", 0.020000, "AmovPpneMstpSrasWrflDnon_turnR", 0.020000, "WeaponMagazineReloadProne", 0.100000, "AmovPpneMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMstpSnonWnonDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr", 0.020000, "AwopPpneMstpSgthWrflDnon_Start", 0.100000, "AwopPpneMstpSgthWrflDnon_End", 0.100000, "AidlPpneMstpSrasWrflDnon_AI", 0.100000, "AmovPpneMstpSrasWrflDnon_healed", 0.020000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDdown", 0.020000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDup", 0.020000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright", 0.020000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft", 0.020000};
			InterpolateTo[] = {"AmovPpneMstpSrasWrflDnon_turnL", 0.020000, "AmovPpneMstpSrasWrflDnon_turnR", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon", 0.020000, "AidlPpneMstpSrasWrflDnon_AI", 0.020000, "AmovPpneMstpSrasWrflDnon_AinvPpneMstpSrasWrflDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AinvPpneMstpSrasWrflDnon_Putdown", 0.020000, "AwopPpneMstpSgthWrflDnon_Fast_Start", 0.020000, "AinvPpneMstpSlayWrflDnon_medic", 0.020000, "AmovPpneMrunSlowWrflDf", 0.020000, "AmovPpneMevaSlowWrflDf", 0.020000, "AmovPpneMrunSlowWrflDfl", 0.020000, "AmovPpneMrunSlowWrflDl", 0.020000, "AmovPpneMrunSlowWrflDbl", 0.020000, "AmovPpneMrunSlowWrflDb", 0.020000, "AmovPpneMrunSlowWrflDbr", 0.020000, "AmovPpneMrunSlowWrflDr", 0.020000, "AmovPpneMrunSlowWrflDfr", 0.020000, "AmovPpneMsprSlowWrflDf", 0.020000, "AmovPpneMsprSlowWrflDbl", 0.020000, "AmovPpneMsprSlowWrflDl", 0.020000, "AmovPpneMsprSlowWrflDr", 0.020000, "AmovPpneMsprSlowWrflDbr", 0.020000, "AmovPpneMsprSlowWrflDb", 0.020000, "AmovPpneMsprSlowWrflDfl", 0.020000, "AmovPpneMsprSlowWrflDfr", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPercMsprSlowWrflDf", 0.050000, "Unconscious", 0.010000, "AmovPpneMstpSrasWrflDnon_relax", 0.010000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDdown", 0.020000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDup", 0.020000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft", 0.020000, "AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright", 0.020000, "RifleReloadProneMk20", 0.020000, "RifleReloadProneMX", 0.020000, "RifleReloadProneMXCompact", 0.020000, "RifleReloadProneMXSniper", 0.020000, "RifleReloadProneTRG", 0.020000, "RifleReloadProneTRGUGL", 0.020000, "RifleReloadProneM200", 0.020000, "RifleReloadProneLRR", 0.020000, "RifleReloadProneEBR", 0.020000, "RifleReloadProneSMG_02", 0.020000, "RifleReloadProneSMG_03", 0.020000, "RifleReloadProneSDAR", 0.020000, "RifleReloadProneDMR", 0.020000, "RifleReloadProneGM6", 0.020000, "RifleReloadProneSMG_01", 0.020000, "RifleReloadProneM4SSAS", 0.020000, "RifleReloadProneKatiba", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon", 0.020000, "AfalPpneMstpSrasWrflDnon", 0.025000};
		};

		class AmovPercMevaSlowWlnrDf: AmovPercMrunSlowWlnrDf
		{
			actions = "LauncherStandActions";
			file = "\A3\anims_f\Data\Anim\Sdr\Mov\erc\spr\low\lnr\AmovPercMsprSlowWlnrDf";
			duty = 0.000000;
			speed = 0.907401;
			canPullTrigger = 1;
			disableWeapons = 0;
			disableWeaponsLong = 0;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			soundOverride = "sprint";
			InterpolateTo[] = {"Unconscious", 0.010000, "AmovPercMrunSrasWlnrDf", 0.020000, "AmovPknlMrunSrasWlnrDf", 0.025000, "AmovPercMevaSlowWlnrDfr", 0.025000, "AmovPercMevaSlowWlnrDfl", 0.025000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpercmstpsraswlnrdnon_amovpercmstpsnonwnondnon: AmovPercMstpSnonWnonDnon
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\lnr\amovpercmstpsraswlnrdnon_amovpercmstpsnonwnondnon.rtm";
			speed = 0.710959;
			disableWeapons = 1;
			actions = "CivilStandActions";
			interpolationRestart = 2;
			soundOverride = "launcher_to_unarmed";
			rightHandIKCurve[] = {0.342000, 1, 0.420000, 0};
			leftHandIKCurve[] = {0.642000, 1, 0.710000, 0};
			weaponIK = 4;
			variantsPlayer[] = {};
			variantsAI[] = {};
			looped = 0;
			canBlendStep = 0;
			minPlayTime = 0.850000;
			reverse = "amovpercmstpsnonwnondnon_amovpercmstpsraswlnrdnon";
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class AmovPpneMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\pne\stp\ras\pst\AmovPpneMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon";
			speed = 1.457144;
			canBlendStep = 0;
			onLandBeg = 1;
			interpolationRestart = 1;
			leftHandIKBeg = 0;
			reverse = "AmovPknlMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon";
			leftHandIKCurve[] = {0.000000, 1, 0.058800, 0, 0.745000, 0, 0.882300, 1};
			leftHandIKEnd = 0;
			rightHandIKBeg = 0;
			rightHandIKCurve[] = {};
			rightHandIKEnd = 0;
			duty = 0.400000;
			relSpeedMin = 0.500000;
			relSpeedMax = 1;
			variantsPlayer[] = {};
			variantsAI[] = {};
			looped = 0;
			minPlayTime = 0.650000;
			soundOverride = "adjust_prone_to_stand";
			soundEnabled = 1;
			soundEdge[] = {0.010000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpercmstpsraswpstdnon_amovpercmstpsraswlnrdnon: TransAnimBase
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\pst\amovpercmstpsraswpstdnon_amovpercmstpsraswlnrdnon.rtm";
			disableWeapons = 1;
			actions = "LauncherStandActions";
			showHandGun = 1;
			speed = 1.734400;
			interpolationRestart = 2;
			weaponIK = 2;
			leftHandIKEnd = 0;
			leftHandIKBeg = 0;
			leftHandIKCurve[] = {};
			enableOptics = 2;
			soundOverride = "handgun_to_launcher";
			ConnectTo[] = {"amovpercmstpsraswpstdnon_amovpercmstpsraswlnrdnon_end", 0.020000};
			InterpolateTo[] = {"amovpercmstpsraswlnrdnon_amovpercmstpsraswpstdnon_end", 0.020000, "Unconscious", 0.100000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpercmstpsraswpstdnon_amovpercmstpsraswlnrdnon_end: TransAnimBase
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\pst\amovpercmstpsraswpstdnon_amovpercmstpsraswlnrdnon_end.rtm";
			disableWeapons = 1;
			actions = "LauncherStandActions";
			speed = 0.731310;
			interpolationRestart = 2;
			rightHandIKEnd = 0;
			rightHandIKBeg = 0;
			rightHandIKCurve[] = {0.414000, 0, 0.493000, 1};
			leftHandIKCurve[] = {0.132000, 0, 0.257000, 1};
			leftHandIKEnd = 0;
			leftHandIKBeg = 0;
			enableOptics = 2;
			weaponIK = 4;
			ConnectTo[] = {"amovpercmstpsraswlnrdnon", 0.020000};
			InterpolateTo[] = {"Unconscious", 0.010000, "amovpercmstpsraswlnrdnon_amovpercmstpsraswpstdnon", 0.020000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpercmstpsraswlnrdnon_amovpercmstpsraswpstdnon: TransAnimBase
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\lnr\amovpercmstpsraswlnrdnon_amovpercmstpsraswpstdnon.rtm";
			disableWeapons = 1;
			actions = "PistolStandActions";
			speed = 1.303100;
			interpolationRestart = 2;
			rightHandIKEnd = 0;
			rightHandIKBeg = 0;
			leftHandIKEnd = 0;
			leftHandIKBeg = 0;
			soundOverride = "launcher_to_handgun";
			rightHandIKCurve[] = {0.639000, 1, 0.778000, 0};
			leftHandIKCurve[] = {0.819000, 1, 0.917000, 0};
			weaponIK = 4;
			enableOptics = 2;
			ConnectTo[] = {"amovpercmstpsraswlnrdnon_amovpercmstpsraswpstdnon_end", 0.020000};
			InterpolateTo[] = {"amovpercmstpsraswpstdnon_amovpercmstpsraswlnrdnon_end", 0.020000, "Unconscious", 0.100000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpercmstpsraswlnrdnon_amovpercmstpsraswrfldnon: TransAnimBase
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\lnr\amovpercmstpsraswlnrdnon_amovpercmstpsraswrfldnon.rtm";
			actions = "RifleStandActions";
			speed = 0.960000;
			disableWeapons = 1;
			interpolationRestart = 2;
			leftHandIKBeg = 0;
			leftHandIKEnd = 0;
			rightHandIKBeg = 0;
			rightHandIKEnd = 0;
			leaningFactorEnd = 1;
			leaningFactorBeg = 0.500000;
			soundOverride = "launcher_to_rifle";
			rightHandIKCurve[] = {0.245000, 1, 0.449000, 0};
			leftHandIKCurve[] = {0.643000, 1, 0.724000, 0};
			weaponIK = 4;
			ConnectTo[] = {"amovpercmstpsraswlnrdnon_amovpercmstpsraswrfldnon_end", 0.010000};
			InterpolateTo[] = {"Unconscious", 0.010000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpercmstpsraswrfldnon_amovpercmstpsraswlnrdnon: TransAnimBase_noIK
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\rfl\amovpercmstpsraswrfldnon_amovpercmstpsraswlnrdnon.rtm";
			actions = "LauncherStandActions";
			speed = 1.170588;
			disableWeapons = 1;
			interpolationRestart = 2;
			leaningFactorBeg = 1;
			leaningFactorEnd = 0.500000;
			soundOverride = "rifle_to_launcher";
			rightHandIKCurve[] = {0.136000, 1, 0.288000, 0};
			leftHandIKCurve[] = {0.500000, 1, 0.773000, 0};
			weaponIK = 1;
			ConnectTo[] = {"AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon_end", 0.020000};
			InterpolateTo[] = {"Unconscious", 0.010000, "amovpercmstpsraswlnrdnon_amovpercmstpsraswrfldnon_end", 0.020000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};


		class AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon: TransAnimBase
		{
			actions = "RifleStandActions";
			file = "\A3\anims_f\Data\Anim\Sdr\Mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon";
			speed = 0.95;//0.728571
			disableWeapons = 1;
			aiming = "aimingCivil";
			aimingBody = "aimingUpCivil";
			canPullTrigger = 0;
			soundOverride = "unarmed_to_rifle";
			rightHandIKCurve[] = {0.520000, 0, 0.578000, 1};
			leftHandIKCurve[] = {0.780000, 0, 0.884000, 1};
			weaponIK = 1;
			ConnectTo[] = {"AmovPercMstpSrasWrflDnon", 0.020000};
			InterpolateTo[] = {"AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon", 0.020000, "Unconscious", 0.010000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon: TransAnimBase
		{
			actions = "RifleKneelActions";
			file = "\A3\anims_f\Data\Anim\Sdr\Mov\knl\stp\non\non\AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon";
			speed = 0.761530;
			disableWeapons = 1;
			aiming = "aimingCivil";
			aimingBody = "aimingUpCivil";
			canPullTrigger = 0;
			soundOverride = "unarmed_to_rifle";
			rightHandIKCurve[] = {0.515625, 0, 0.593750, 1};
			leftHandIKCurve[] = {0.850000, 0, 0.920000, 1};
			weaponIK = 1;
			ConnectTo[] = {"AmovPknlMstpSrasWrflDnon", 0.020000};
			InterpolateTo[] = {"AmovPknlMstpSrasWrflDnon_AmovPknlMstpSnonWnonDnon", 0.020000, "Unconscious", 0.010000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpercmstpsnonwnondnon_amovpercmstpsraswlnrdnon: amovpercmstpsraswlnrdnon
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\amovpercmstpsnonwnondnon_amovpercmstpsraswlnrdnon.rtm";
			disableWeapons = 1;
			speed = 0.883871;
			actions = "LauncherStandActions";
			interpolationRestart = 2;
			canPullTrigger = 0;
			soundOverride = "unarmed_to_launcher";
			rightHandIKCurve[] = {0.420000, 0, 0.550000, 1};
			leftHandIKCurve[] = {0.180000, 0, 0.240000, 1};
			weaponIK = 4;
			variantsPlayer[] = {};
			variantsAI[] = {};
			looped = 0;
			canBlendStep = 0;
			minPlayTime = 0.850000;
			reverse = "amovpercmstpsnonwnondnon_amovpercmstpsraswlnrdnon";
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon: AmovPknlMstpSrasWlnrDnon
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\knl\stp\non\non\amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon.rtm";
			disableWeapons = 1;
			speed = 0.483871;
			actions = "LauncherKneelActions";
			interpolationRestart = 2;
			canPullTrigger = 0;
			soundOverride = "unarmed_to_launcher";
			rightHandIKCurve[] = {0.420000, 0, 0.550000, 1};
			leftHandIKCurve[] = {0.180000, 0, 0.240000, 1};
			weaponIK = 4;
			variantsPlayer[] = {};
			variantsAI[] = {};
			looped = 0;
			canBlendStep = 0;
			minPlayTime = 0.850000;
			reverse = "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon_end: TransAnimBase
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\rfl\amovpercmstpsraswrfldnon_amovpercmstpsraswlnrdnon_end.rtm";
			actions = "LauncherStandActions";
			speed = 1.111110;
			disableWeapons = 1;
			interpolationRestart = 2;
			leftHandIKBeg = 0;
			leftHandIKEnd = 0;
			rightHandIKBeg = 0;
			rightHandIKEnd = 0;
			leaningFactorEnd = 1;
			leaningFactorBeg = 0.500000;
			rightHandIKCurve[] = {0.252000, 0, 0.411000, 1};
			leftHandIKCurve[] = {0.093000, 0, 0.243000, 1};
			weaponIK = 4;
			ConnectTo[] = {"amovpercmstpsraswlnrdnon", 0.010000};
			InterpolateTo[] = {"amovpercmstpsraswlnrdnon_amovpercmstpsraswrfldnon", 0.020000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class amovpknlmstpsraswlnrdnon_amovpercmstpsraswlnrdnon: TransAnimBase
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\knl\stp\ras\lnr\amovpknlmstpsraswlnrdnon_amovpercmstpsraswlnrdnon.rtm";
			actions = "LauncherStandActions";
			speed = 2.053846;
			interpolationRestart = 2;
			leaningFactorBeg = 0.500000;
			leaningFactorEnd = 0.500000;
			weaponIK = 4;
			duty = 0.800000;
			relSpeedMin = 0.600000;
			reverse = "AmovPercMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
			soundOverride = "adjust_kneel_to_stand";
			soundEnabled = 1;
			soundEdge[] = {0.010000};
			ConnectTo[] = {"amovpercmstpsraswlnrdnon", 0.020000};
			InterpolateTo[] = {"amovpercmstpsraswlnrdnon_amovpknlmstpsraswlnrdnon", 0.020000, "Unconscious", 0.100000};
			limitGunMovement = 1;//allow body bending for aim up\down
		};

		class AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon
		{
			relSpeedMin = 1;
			variantsPlayer[] = {};
			variantsAI[] = {};
			canBlendStep = 0;
			looped = 0;
			minPlayTime = 0.550000;
			file = "\A3\anims_f\Data\Anim\Sdr\Mov\erc\stp\ras\rfl\AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon.rtm";
			speed = -0.500000;
			interpolationRestart = 2;
			disableWeapons = 1;
			headBobStrength = 0.112438;
			reverse = "AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon";
			limitGunMovement = 1;//allow body bending for aim up\down
		};


		//MOCAP Melee anims
        class MOCAP_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg : AmovPercMstpSrasWrflDnon {
            file = "\breakingpoint_anim\player\Strikes\MOCAP_Idle_Stay_CombatPace_Rfl_Push_Kick_LeftLeg.rtm";
            looped = 0;
            speed = 0.7;
			duty = 0.7;
            mask = "BodyFull";
            leftHandIKBeg = true;
            leftHandIKCurve[] = {1};
            leftHandIKEnd = true;
            rightHandIKBeg = true;
            rightHandIKCurve[] = {1};
            rightHandIKEnd = true;
            weaponIK = 1;
            enableOptics = false;
            showWeaponAim = false;
            disableWeapons = false;
            disableWeaponsLong = false;
			leaning = "empty";
			aimingBody = "empty";
			aiming = "empty";
            forceAim = 1;
            limitGunMovement = 0.2;
            headBobMode = 0;
            headBobStrength = 0;
			canPullTrigger = 1;
			enableDirectControl = 0;
			weaponLowered = 0;
			variantsPlayer[] = {};
			variantsAI[] = {};
			ConnectFrom[] = {"AmovPercMstpSrasWrflDnon", 9.020000, "AmovPercMstpSlowWrflDnon", 9.020000, "aadjpercmstpsraswrflddown_amovpercmstpsraswrfldnon", 9.020000, "aadjpercmstpsraswrfldup_amovpercmstpsraswrfldnon", 9.020000, "aadjpercmstpsraswrfldright_amovpercmstpsraswrfldnon", 9.020000,"aadjpercmstpsraswrfldleft_amovpercmstpsraswrfldnon", 9.020000};
			ConnectTo[] = {"AmovPercMstpSrasWrflDnon", 0.020000};
			//InterpolateTo[] = {"Unconscious",0.01};
			soundOverride = "rifle_to_handgun";
			soundEnabled = 1;
			showHandGun = 0;
			showItemInRightHand = 0;
		};
        class MOCAP_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg : AmovPercMstpSrasWpstDnon {
            file = "\breakingpoint_anim\player\Strikes\MOCAP_Idle_Stay_CombatPace_Pstl_Push_Kick_LeftLeg.rtm";
            looped = 0;
            speed = 0.8;
			duty = 0.7;
            mask = "BodyFull";
            leftHandIKBeg = true;
            leftHandIKCurve[] = {1};
            leftHandIKEnd = true;
            rightHandIKBeg = true;
            rightHandIKCurve[] = {1};
            rightHandIKEnd = true;
            weaponIK = 0;
            enableOptics = false;
            showWeaponAim = false;
            disableWeapons = false;
            disableWeaponsLong = false;
			leaning = "empty";
			aimingBody = "empty";
			aiming = "empty";
            forceAim = 1;
            limitGunMovement = 0.2;
            headBobMode = 0;
            headBobStrength = 0;
			canPullTrigger = 1;
			enableDirectControl = 0;
			weaponLowered = 0;
			variantsPlayer[] = {};
			variantsAI[] = {};
			ConnectFrom[] = {"AmovPercMstpSrasWpstDnon", 9.020000, "AmovPercMstpSlowWpstDnon", 9.020000, "aadjpercmstpsraswpstddown_amovpercmstpsraswpstdnon", 9.020000, "aadjpercmstpsraswpstdup_amovpercmstpsraswpstdnon", 9.020000, "aadjpercmstpsraswpstdright_amovpercmstpsraswpstdnon", 9.020000,"aadjpercmstpsraswpstdleft_amovpercmstpsraswpstdnon", 9.020000};
			ConnectTo[] = {"AmovPercMstpSrasWpstDnon",0.020000};
			//InterpolateTo[] = {"Unconscious",0.01};
			soundOverride = "rifle_to_handgun";
			soundEnabled = 1;
		};
        class MOCAP_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg : AmovPercMstpSrasWlnrDnon {
            file = "\breakingpoint_anim\player\Strikes\MOCAP_Idle_Stay_CombatPace_Lnr_Push_Kick_LeftLeg.rtm";
			looped = 0;
            speed = 0.8;
			duty = 0.7;
            mask = "BodyFull";
			leftHandIKBeg = true;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = true;
			rightHandIKBeg = true;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = true;
            weaponIK = 4;
            enableOptics = false;
            showWeaponAim = false;
            disableWeapons = false;
            disableWeaponsLong = false;
			leaning = "empty";
			aimingBody = "empty";
			aiming = "empty";
            forceAim = 1;
            limitGunMovement = 0.2;
            headBobMode = 0;
            headBobStrength = 0;
			canPullTrigger = 0;
			enableDirectControl = 0;
			weaponLowered = 0;
			variantsPlayer[] = {};
			variantsAI[] = {};
			ConnectFrom[] = {"AmovPercMstpSrasWlnrDnon", 9.020000, "AmovPercMstpSlowWlnrDnon", 9.020000 /*"aadjpercmstpsraswpstddown_amovpercmstpsraswpstdnon", 9.020000, "aadjpercmstpsraswpstdup_amovpercmstpsraswpstdnon", 9.020000, "aadjpercmstpsraswpstdright_amovpercmstpsraswpstdnon", 9.020000,"aadjpercmstpsraswpstdleft_amovpercmstpsraswpstdnon", 9.020000*/};
			ConnectTo[] = {"AmovPercMstpSrasWlnrDnon",0.020000, "AmovPercMstpSlowWlnrDnon", 0.020000};
			//InterpolateTo[] = {"Unconscious",0.01};
			soundOverride = "rifle_to_handgun";
			soundEnabled = 1;
		};
        class MOCAP_Idle_Stay_CivPace_Non_Push_Kick_LeftLeg : AmovPercMstpSnonWnonDnon {
            file = "\breakingpoint_anim\player\Strikes\MOCAP_Idle_Stay_CivPace_Non_Push_Kick_LeftLeg.rtm";
			looped = 0;
            speed = 0.7;
			duty = 0.7;
            mask = "BodyFull";
			leftHandIKBeg = false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = false;
			rightHandIKBeg = false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = false;
            weaponIK = 0;
            enableOptics = false;
            showWeaponAim = false;
            disableWeapons = false;
            disableWeaponsLong = false;
			leaning = "empty";
			aimingBody = "empty";
			aiming = "empty";
            forceAim = 1;
            limitGunMovement = 0.3;
            headBobMode = 0;
            headBobStrength = 0;
			canPullTrigger = 0;
			enableDirectControl = 0;
			weaponLowered = 0;
			variantsPlayer[] = {};
			variantsAI[] = {};
			ConnectFrom[] = {"AmovPercMstpSnonWnonDnon", 9.020000};
			ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.020000};
			//InterpolateTo[] = {"Unconscious",0.01};
			soundOverride = "rifle_to_handgun";
			soundEnabled = 1;
		};


	};
};

class CfgGesturesMale
{
	skeletonName = "OFP2_ManSkeleton";

	class ManActions {};

	class Actions
	{
		class NoActions
		{
			turnSpeed = 0;
			upDegree = 0;
			limitFast = 1;
			useFastMove = 0;
		};
	};

	class Default
	{
		actions = "NoActions";
		file = "";
		looped = 1;
		speed = 0.5;
		relSpeedMin = 1;
		relSpeedMax = 1;
		soundEnabled = 0;
		soundOverride = "";
		soundEdge[] = {0.5, 1};
		terminal = 0;
		equivalentTo = "";
		connectAs = "";
		connectFrom[] = {};
		connectTo[] = {};
		interpolateWith[] = {};
		interpolateTo[] = {};
		interpolateFrom[] = {};
		mask = "empty";
		interpolationSpeed = 6;
		interpolationRestart = 0;
		preload = 0;
		disableWeapons = 1;
		enableOptics = 1;
		showWeaponAim = 1;
		enableMissile = 1;
		enableBinocular = 1;
		showItemInHand = 0;
		showItemInRightHand = 0;
		showHandGun = 0;
		canPullTrigger = 1;
		walkcycles = 1;
		headBobMode = 0;
		headBobStrength = 0;
		leftHandIKBeg = 0;
		leftHandIKEnd = 0;
		rightHandIKBeg = 0;
		rightHandIKEnd = 0;
		leftHandIKCurve[] = {1};
		rightHandIKCurve[] = {1};
		forceAim = 0;
	};

	class States
	{

		class GestureSwing: Default
		{
			file = "\breakingpoint_weapons\anim\hatchet_swing.rtm";
			looped = 0;
			speed = 2.78205;
			mask = "handsWeapon2";
			headBobStrength = 0.2;
			headBobMode = 2;
			disableWeapons = 0;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class GestureSwing2: Default
		{
			file = "\breakingpoint_weapons\anim\hatchet_swing.rtm";
			looped = 0;
			speed = 1.18205;
			mask = "handsWeapon2";
			headBobStrength = 0.2;
			headBobMode = 2;
			disableWeapons = 0;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class GestureSwing3: Default
		{
			file = "\breakingpoint_weapons\anim\hatchet_swing.rtm";
			looped = 0;
			speed = 2.58205;
			mask = "handsWeapon2";
			headBobStrength = 0.2;
			headBobMode = 2;
			disableWeapons = 0;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class GestureStab: Default
		{
			file = "\breakingpoint_weapons\anim\Bayonet_Stab.rtm";
			looped = 0;
			speed = 2.98205;
			mask = "handsWeapon1";
			headBobStrength = 0.2;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class GestureMelee: Default
		{
			file = "\breakingpoint_weapons\anim\Rifle_Melee.rtm";
			looped = 0;
			speed = 2.58205;
			mask = "handsWeapon1";
			headBobStrength = 0.2;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};

		class crossbow_reload: Default
		{
			file="breakingpoint_weapons\anim\crossbow_reload.rtm";
			looped=0;
			speed=0.200000;
			mask="handsWeapon";
			headBobStrength=0.200000;
			headBobMode=2;
			rightHandIKBeg=1;
			rightHandIKEnd=0;
			rightHandIKCurve[]={};
			leftHandIKBeg=1;
			leftHandIKEnd=0;
			leftHandIKCurve[]={};
		};
		class crossbow_reload_prone: Default
		{
			file="breakingpoint_weapons\anim\crossbow_reload_prone.rtm";
			looped=0;
			speed=0.250000;
			mask="handsWeapon";
			headBobStrength=0.200000;
			headBobMode=2;
			rightHandIKBeg=1;
			rightHandIKEnd=0;
			rightHandIKCurve[]={};
			leftHandIKBeg=1;
			leftHandIKEnd=0;
			leftHandIKCurve[]={};
		};
		class BP_Jump : Default {
			variantsPlayer[] = {};
			variantsAI[] = {};
			canBlendStep = 0;
			looped = false;
			collisionShape = "A3\anims_f\Data\Geom\Sdr\Perc_Wovr.p3d";
			relSpeedMin = 1;
			relSpeedMax = 1;
			limitGunMovement = 1.0;
			headBobStrength = 0.23;
			interpolationspeed = 10.0;
			interpolationrestart = true;
			forceAim = 1;
			minPlayTime = 0.9;
			duty = 10.0;
			file = "\A3\anims_f\Data\Anim\Sdr\ovr\erc\stp\ras\rfl\AovrPercMrunSrasWrflDf";
			speed = 1.25849;
			disableWeapons = false;
			mask = "BodyFullReal";
			//actions = "RifleStandActionsRunF";
			adjstance = "m";
			soundOverride = "adjust_stand_side";
			soundEnabled = true;
			soundEdge[] = {0.01};
		};
		class BP_Drink_Erc_x3_Gesture : Default {
			file = "breakingpoint_anim\player\BP_Drink_Erc_x3_Gesture.rtm";
			looped = 0;
			speed = 0.1;
			duty = 0;
			aimingBody = "aimingUpDefault";
			mask = "LeftHandFeed";
			leftHandIKBeg = false;
			leftHandIKCurve[] = {};
			leftHandIKEnd = true;
			rightHandIKBeg = true;
			rightHandIKCurve[] = {};
			rightHandIKEnd = true;
			weaponIK = 1;
			enableOptics = false;
			showWeaponAim = false;
			disableWeapons = false;
			disableWeaponsLong = false;
			canPullTrigger = 1;
			InterpolateTo[] = {};
			interpolateFrom[] = {};
			soundOverride = "";
		};
		class BP_Eat_Erc_x3_Gesture : Default {
			file = "breakingpoint_anim\player\BP_Eat_Erc_x3_Gesture.rtm";
			looped = 0;
			speed = 0.1;
			duty = 0;
			aimingBody = "aimingUpDefault";
			mask = "LeftHandFeed";
			leftHandIKBeg = false;
			leftHandIKCurve[] = {};
			leftHandIKEnd = true;
			rightHandIKBeg = true;
			rightHandIKCurve[] = {};
			rightHandIKEnd = true;
			weaponIK = 1;
			enableOptics = false;
			showWeaponAim = false;
			disableWeapons = false;
			disableWeaponsLong = false;
			canPullTrigger = 1;
			InterpolateTo[] = {};
			interpolateFrom[] = {};
			soundOverride = "";
		};

		//MOCAP Melee Gestures
		class MOCAP_Gesture_CivPace_Non_Punch_Hand_Left_Direct : Default {
			file = "breakingpoint_anim\player\Gestures\Non\MOCAP_Gesture_CivPace_Non_Punch_Hand_Left_Direct.rtm";
			looped = 0;
			speed = 0.75;
			duty = 1.0;
			aimingBody = "aimingUpDefault";
			mask = "handsWeapon";
			leftHandIKBeg = false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = false;
			rightHandIKBeg = false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = false;
			weaponIK = 0;
			enableOptics = false;
			showWeaponAim = false;
			disableWeapons = true;
			disableWeaponsLong = true;
			canPullTrigger = 0;
			//ConnectFrom[] ={"MOCAP_Gesture_CivPace_Non_Idle_Combat_Pose",9.3};
			//ConnectTo[] = {"AmovPercMstpSrasWrflDnon", 0.020000};
			//ConnectTo[] = {"MOCAP_Gesture_CivPace_Non_Idle_Combat_Pose",9.3};
			//InterpolateTo[] = {"Unconscious",0.01};
			InterpolateTo[] = {};
			interpolateFrom[] = {};
			soundOverride = "rifle_to_handgun";
		};
		class MOCAP_Gesture_CivPace_Non_Punch_Hand_Right_Direct : Default {
			file = "breakingpoint_anim\player\Gestures\Non\MOCAP_Gesture_CivPace_Non_Punch_Hand_Right_Direct.rtm";
			looped = 0;
			speed = 0.7;
			duty = 1.0;
			aimingBody = "aimingUpDefault";
			mask = "handsWeapon";
			leftHandIKBeg = false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = false;
			rightHandIKBeg = false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = false;
			weaponIK = 0;
			enableOptics = false;
			showWeaponAim = false;
			disableWeapons = true;
			disableWeaponsLong = true;
			canPullTrigger = 0;
			//ConnectFrom[] ={"MOCAP_Gesture_CivPace_Non_Idle_Combat_Pose",9.3};
			//ConnectTo[] = {"AmovPercMstpSrasWrflDnon", 0.020000};
			//ConnectTo[] = {"MOCAP_Gesture_CivPace_Non_Idle_Combat_Pose",9.3};
			//InterpolateTo[] = {"Unconscious",0.01};
			//InterpolateTo[] = {};
			//interpolateFrom[] = {};
			soundOverride = "rifle_to_handgun";
		};

	};

	class BlendAnims
	{
		handsWeapon1[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1};
		handsWeapon2[] = {"head",1,"neck1",1,"neck",1,"launcher",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1};
		wholeBody[] = {"Pelvis",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1,"Camera",1,"weapon",1,"launcher",1,"neck",1,"neck1",1,"head",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftLeg",1,"LeftLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightLeg",1,"RightLegRoll",1,"RightFoot",1,"RightToeBase",1};
		aimingDefault[] = {"head",0.6,"neck1",0.6,"neck",0.6,"weapon",1,"launcher",1,"LeftShoulder",0.8,"LeftArm",0.8,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",0.8,"RightArm",0.8,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",0.3,"Spine1",0.4,"Spine2",0.5,"Spine3",0.6};
		aimingPistol[] = {"head",0.6,"neck1",0.6,"neck",0.6,"LeftShoulder",1,"launcher",1,"weapon",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",0.3,"Spine1",0.4,"Spine2",0.5,"Spine3",0.6};
		aimingLauncher[] = {"head",0.6,"neck1",0.6,"neck",0.6,"launcher",1,"weapon",1,"LeftShoulder",0.8,"LeftArm",0.8,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",0.8,"RightArm",0.8,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",0.3,"Spine1",0.4,"Spine2",0.5,"Spine3",0.6};
		aimingCivil[] = {"neck1",0.25,"neck",0.25,"Spine",0.3,"Spine1",0.4,"Spine2",0.5,"Spine3",0.5};
		aimingCivilKneel[] = {"neck1",0.25,"neck",0.25,"Spine",0.3,"Spine1",0.4,"Spine2",0.5,"Spine3",0.5,"LeftShoulder",0.5,"LeftArm",0.2,"LeftArmRoll",0.15,"LeftForeArm",0.1,"LeftForeArmRoll",0.05,"RightShoulder",0.5,"RightArm",0.2,"RightArmRoll",0.15,"RightForeArm",0.1,"RightForeArmRoll",0.05};
		aimingLying[] = {"weapon",1,"LeftShoulder",0.8,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",0.8,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine2",0.2,"Spine3",0.6};
		aimingLyingPistol[] = {"LeftShoulder",0.8,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",0.8,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine2",0.2,"Spine3",0.6};
		legsLyingAiming[] = {"weapon",0,"LeftShoulder",0.2,"LeftArm",0,"LeftArmRoll",0,"LeftForeArm",0,"LeftForeArmRoll",0,"LeftHand",0,"LeftHandRing",0,"LeftHandPinky1",0,"LeftHandPinky2",0,"LeftHandPinky3",0,"LeftHandRing1",0,"LeftHandRing2",0,"LeftHandRing3",0,"LeftHandMiddle1",0,"LeftHandMiddle2",0,"LeftHandMiddle3",0,"LeftHandIndex1",0,"LeftHandIndex2",0,"LeftHandIndex3",0,"LeftHandThumb1",0,"LeftHandThumb2",0,"LeftHandThumb3",0,"RightShoulder",0.2,"RightArm",0,"RightArmRoll",0,"RightForeArm",0,"RightForeArmRoll",0,"RightHand",0,"RightHandRing",0,"RightHandPinky1",0,"RightHandPinky2",0,"RightHandPinky3",0,"RightHandRing1",0,"RightHandRing2",0,"RightHandRing3",0,"RightHandMiddle1",0,"RightHandMiddle2",0,"RightHandMiddle3",0,"RightHandIndex1",0,"RightHandIndex2",0,"RightHandIndex3",0,"RightHandThumb1",0,"RightHandThumb2",0,"RightHandThumb3",0,"Spine2",0.8,"Spine3",0.4,"spine1",1,"pelvis",1,"leftupleg",1,"leftuplegroll",1,"leftleg",1,"leftlegroll",1,"leftfoot",1,"LeftToeBase",1,"rightupleg",1,"rightuplegroll",1,"rightleg",1,"rightlegroll",1,"rightfoot",1,"RightToeBase",1};
		legsLyingAimingPistol[] = {"LeftShoulder",0.2,"LeftArm",0,"LeftArmRoll",0,"LeftForeArm",0,"LeftForeArmRoll",0,"LeftHand",0,"LeftHandRing",0,"LeftHandPinky1",0,"LeftHandPinky2",0,"LeftHandPinky3",0,"LeftHandRing1",0,"LeftHandRing2",0,"LeftHandRing3",0,"LeftHandMiddle1",0,"LeftHandMiddle2",0,"LeftHandMiddle3",0,"LeftHandIndex1",0,"LeftHandIndex2",0,"LeftHandIndex3",0,"LeftHandThumb1",0,"LeftHandThumb2",0,"LeftHandThumb3",0,"RightShoulder",0.2,"RightArm",0,"RightArmRoll",0,"RightForeArm",0,"RightForeArmRoll",0,"RightHand",0,"RightHandRing",0,"RightHandPinky1",0,"RightHandPinky2",0,"RightHandPinky3",0,"RightHandRing1",0,"RightHandRing2",0,"RightHandRing3",0,"RightHandMiddle1",0,"RightHandMiddle2",0,"RightHandMiddle3",0,"RightHandIndex1",0,"RightHandIndex2",0,"RightHandIndex3",0,"RightHandThumb1",0,"RightHandThumb2",0,"RightHandThumb3",0,"Spine2",0.8,"Spine3",0.4,"spine1",1,"pelvis",1,"leftupleg",1,"leftuplegroll",1,"leftleg",1,"leftlegroll",1,"leftfoot",1,"LeftToeBase",1,"rightupleg",1,"rightuplegroll",1,"rightleg",1,"rightlegroll",1,"rightfoot",1,"RightToeBase",1};
		headDefault[] = {"head",1,"neck1",0.5,"neck",0.5};
		leaningDefault[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"spine3",0.95,"spine2",0.9,"spine1",0.8,"spine",0.7,"pelvis",0.4};
		crewShake_half[] = {"weapon",0.5,"Camera",0.5,"launcher",0.5,"Head",0.5,"Neck",0.5,"Neck1",0.5,"LeftShoulder",0.45,"LeftArm",0.35,"LeftArmRoll",0.25,"LeftForeArm",0.15,"RightShoulder",0.45,"RightArm",0.35,"RightArmRoll",0.25,"RightForeArm",0.315,"spine3",0.475,"spine2",0.45,"spine1",0.4,"spine",0.35,"pelvis",0.2,"LeftUpLeg",0.1,"LeftUpLegRoll",0.25,"LeftLeg",0.1,"RightUpLeg",0.1,"RightUpLegRoll",0.25,"RightLeg",0.1};
		crewShake[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"LeftShoulder",0.9,"LeftArm",0.7,"LeftArmRoll",0.5,"LeftForeArm",0.3,"RightShoulder",0.9,"RightArm",0.7,"RightArmRoll",0.5,"RightForeArm",0.3,"spine3",0.95,"spine2",0.9,"spine1",0.8,"spine",0.7,"pelvis",0.4,"LeftUpLeg",0.2,"LeftUpLegRoll",0.5,"LeftLeg",0.2,"RightUpLeg",0.2,"RightUpLegRoll",0.5,"RightLeg",0.2};
		aimingUpDefault[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"spine3",0.95,"spine2",0.9,"spine1",0.8,"spine",0.7};
		aimingUpCivilKneel[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"spine3",0.95,"spine2",0.9,"spine1",0.8,"spine",0.7,"LeftShoulder",0.95,"LeftArm",0.45,"LeftArmRoll",0.35,"LeftForeArm",0.25,"LeftForeArmRoll",0.15,"RightShoulder",0.95,"RightArm",0.45,"RightArmRoll",0.35,"RightForeArm",0.25,"RightForeArmRoll",0.15};
		aimingUpLying[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"spine3",0.9,"spine2",0.7,"spine1",0.5};
		aimingUpPistol[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"spine3",0.95,"spine2",0.9,"spine1",0.8,"spine",0.7};
		aimingUpCivil[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"spine3",0.95,"spine2",0.9,"spine1",0.8,"spine",0.7};
		aimingUpLauncher[] = {"weapon",1,"Camera",1,"launcher",1,"Head",1,"Neck",1,"Neck1",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"spine3",0.95,"spine2",0.9,"spine1",0.8,"spine",0.7};
		legsDefault[] = {"LeftUpLeg",0.9,"LeftUpLegRoll",0.9,"LeftLeg",0.95,"LeftLegRoll",0.95,"LeftFoot",1,"LeftToeBase",1,"RightUpLeg",0.9,"RightUpLegRoll",0.9,"RightLeg",0.95,"RightLegRoll",0.95,"RightFoot",1,"RightToeBase",1};
		idleDefault[] = {"Pelvis",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1,"Camera",1,"weapon",1,"launcher",1,"neck",1,"neck1",1,"head",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftLeg",1,"LeftLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightLeg",1,"RightLegRoll",1,"RightFoot",1,"RightToeBase",1};
		leftHand[] = {"LeftShoulder",0.3,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1};
		launcher[] = {"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"launcher",1,"Spine3",1,"Spine2",0.75,"Spine1",0.5,"Spine",0.25,"weapon",1};
		rightHand[] = {"RightShoulder",0.3,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1};
		handsWeapon_pst[] = {"head",1,"neck1",1,"neck",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",0.2,"Spine1",0.3,"Spine2",1,"Spine3",1,"pelvis","MaskStart"};
		handsWeapon_pst_context[] = {"head",1,"neck1",1,"neck",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",0.7,"Spine2",0.3,"Spine3",0.2};
		handsWeapon[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1,"pelvis","MaskStart"};
		handsWeapon_context[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",0.9,"Spine3",0.8};
		leftHandInfluence[] = {"head",0.2,"neck1",0.3,"neck",0.3,"weapon",0.3,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"Spine",0.2,"Spine1",0.3,"Spine2",1,"Spine3",1};
		head[] = {"head",1,"neck1",0.8,"neck",0.5};
		upperTorso[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1};
		Legs[] = {"head",0,"neck1",0,"neck",0,"weapon",0,"LeftShoulder",0,"LeftArm",0,"LeftArmRoll",0,"LeftForeArm",0,"LeftForeArmRoll",0,"LeftHand",0,"LeftHandRing",0,"LeftHandPinky1",0,"LeftHandPinky2",0,"LeftHandPinky3",0,"LeftHandRing1",0,"LeftHandRing2",0,"LeftHandRing3",0,"LeftHandMiddle1",0,"LeftHandMiddle2",0,"LeftHandMiddle3",0,"LeftHandIndex1",0,"LeftHandIndex2",0,"LeftHandIndex3",0,"LeftHandThumb1",0,"LeftHandThumb2",0,"LeftHandThumb3",0,"Spine1",0,"Spine2",0,"Spine3",0,"Spine",0,"Pelvis",0,"LeftLeg",1,"LeftLegRoll",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightLeg",1,"RightLegRoll",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightFoot",1,"RightToeBase",1};
		LegRight[] = {"head",0,"neck1",0,"neck",0,"weapon",0,"LeftShoulder",0,"LeftArm",0,"LeftArmRoll",0,"LeftForeArm",0,"LeftForeArmRoll",0,"LeftHand",0,"LeftHandRing",0,"LeftHandPinky1",0,"LeftHandPinky2",0,"LeftHandPinky3",0,"LeftHandRing1",0,"LeftHandRing2",0,"LeftHandRing3",0,"LeftHandMiddle1",0,"LeftHandMiddle2",0,"LeftHandMiddle3",0,"LeftHandIndex1",0,"LeftHandIndex2",0,"LeftHandIndex3",0,"LeftHandThumb1",0,"LeftHandThumb2",0,"LeftHandThumb3",0,"Spine1",0.3,"Spine2",0,"Spine3",0,"Spine",0,"Pelvis",0,"LeftLeg",0,"LeftLegRoll",0,"LeftUpLeg",0,"LeftUpLegRoll",0,"LeftFoot",0,"LeftToeBase",0,"RightLeg",1,"RightLegRoll",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightFoot",1,"RightToeBase",1};
		LegLeft[] = {"head",0,"neck1",0,"neck",0,"weapon",0,"LeftShoulder",0,"LeftArm",0,"LeftArmRoll",0,"LeftForeArm",0,"LeftForeArmRoll",0,"LeftHand",0,"LeftHandRing",0,"LeftHandPinky1",0,"LeftHandPinky2",0,"LeftHandPinky3",0,"LeftHandRing1",0,"LeftHandRing2",0,"LeftHandRing3",0,"LeftHandMiddle1",0,"LeftHandMiddle2",0,"LeftHandMiddle3",0,"LeftHandIndex1",0,"LeftHandIndex2",0,"LeftHandIndex3",0,"LeftHandThumb1",0,"LeftHandThumb2",0,"LeftHandThumb3",0,"Spine1",0,"Spine2",0,"Spine3",0,"Spine",0,"Pelvis",0,"LeftLeg",1,"LeftLegRoll",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightLeg",0,"RightLegRoll",0,"RightUpLeg",0,"RightUpLegRoll",0,"RightFoot",0,"RightToeBase",0};
		BodyFullReal[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine1",1,"Spine2",1,"Spine3",1,"Spine",1,"Pelvis",1,"LeftLeg",1,"LeftLegRoll",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightLeg",1,"RightLegRoll",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightFoot",1,"RightToeBase",1};
		BodyFull[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"Spine1",1,"Spine2",1,"Spine3",1,"Spine",1,"Pelvis",1,"LeftLeg",1,"LeftLegRoll",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightLeg",1,"RightLegRoll",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightFoot",1,"RightToeBase",1};
		BodyHalf[] = {"head",0.01,"neck1",0.01,"neck",0.01,"weapon",0.01,"LeftShoulder",0.01,"LeftArm",0.01,"LeftArmRoll",0.01,"LeftForeArm",0.01,"LeftForeArmRoll",0.01,"LeftHand",0.01,"LeftHandRing",0.01,"LeftHandPinky1",0.01,"LeftHandPinky2",0.01,"LeftHandPinky3",0.01,"LeftHandRing1",0.01,"LeftHandRing2",0.01,"LeftHandRing3",0.01,"LeftHandMiddle1",0.01,"LeftHandMiddle2",0.01,"LeftHandMiddle3",0.01,"LeftHandIndex1",0.01,"LeftHandIndex2",0.01,"LeftHandIndex3",0.01,"LeftHandThumb1",0.01,"LeftHandThumb2",0.01,"LeftHandThumb3",0.01,"Spine1",0.01,"Spine2",0.01,"Spine3",0.01,"Spine",0.01,"Pelvis",0.01,"LeftLeg",0.01,"LeftLegRoll",0.01,"LeftUpLeg",0.01,"LeftUpLegRoll",0.01,"LeftFoot",0.01,"LeftToeBase",0.01,"RightLeg",0.01,"RightLegRoll",0.01,"RightUpLeg",0.01,"RightUpLegRoll",0.01,"RightFoot",0.01,"RightToeBase",0.01};
		ReloadMask[] = {"LeftShoulder",0.3,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"RightShoulder",0.3,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"weapon",1};
		Throwing[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1,"pelvis","MaskStart"};
		Throwing_context[] = {"head", 1, "neck1", 1, "neck", 1, "weapon", 1, "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, "LeftHandRing", 1, "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1, "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, "RightHandRing", 1, "RightHandPinky1", 1, "RightHandPinky2", 1, "RightHandPinky3", 1, "RightHandRing1", 1, "RightHandRing2", 1, "RightHandRing3", 1, "RightHandMiddle1", 1, "RightHandMiddle2", 1, "RightHandMiddle3", 1, "RightHandIndex1", 1, "RightHandIndex2", 1, "RightHandIndex3", 1, "RightHandThumb1", 1, "RightHandThumb2", 1, "RightHandThumb3", 1, "Spine", 1, "Spine1", 0.900000, "Spine2", 0.700000, "Spine3", 0.500000};
		LeftHandFeed[] = {"head",1,"neck1",1,"neck",1,"weapon",0,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",0,"RightArm",0,"RightArmRoll",0,"RightForeArm",0,"RightForeArmRoll",0,"RightHand",0,"RightHandRing",0,"RightHandPinky1",0,"RightHandPinky2",0,"RightHandPinky3",0,"RightHandRing1",0,"RightHandRing2",0,"RightHandRing3",0,"RightHandMiddle1",0,"RightHandMiddle2",0,"RightHandMiddle3",0,"RightHandIndex1",0,"RightHandIndex2",0,"RightHandIndex3",0,"RightHandThumb1",0,"RightHandThumb2",0,"RightHandThumb3",0,"Spine",0,"Spine1",0,"Spine2",0,"Spine3",0,"pelvis","MaskStart"};
		handsNonPounch[] = {"head",0,"neck1",0,"neck",0,"weapon",1,"launcher",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",0.4,"Spine1",0.8,"Spine2",1,"Spine3",1,"pelvis",1};
	};
};
class BP_Melee : Mode_SemiAuto
{
	multiplier = 1;
	burst = 5;
	displayName = "Hack";
	dispersion = 0.1;
	sound[] = {"", 0, 1};
	soundContinuous = 1;
	reloadTime = 1;
	magazineReloadTime = 1;
	ffCount = 1;
	optics = "false";
	recoil = "empty";
	autoFire = "true";
	CraterEffects = "NoCrater";
	explosionEffects = "NoExplosion";
	aiRateOfFire = 0.7;	// delay between shots at given distance
	aiRateOfFireDistance = 2.2;
	useAction = 1;
	useActionTitle = "GestureSwing";
	recoilProne = "empty";
	showToPlayer = "true";
	minRange = 0;
	minRangeProbab = 0.8;
	midRange = 0.3;
	midRangeProbab = 0.8;
	maxRange = 3;
	maxRangeProbab = 0;
	soundBurst = 1;
};

/* -------------------------------- */

class CfgWeapons
{
	class SlotInfo;
    // class LinkedItems;
    class Default;	// External class reference
	class ItemCore;	// External class reference
	class InventoryMuzzleItem_Base_F;	   // External class reference
	class InventoryOpticsItem_Base_F;      // External class reference
    class InventoryFlashLightItem_Base_F;  // External class reference
	class InventoryUnderItem_Base_F;       // External class reference
	class Snip;	            // External class reference
	// class GunParticles;     // External class reference
	class muzzle_snds_L;    // External class reference
	class muzzle_snds_H_MG;	// External class reference
	class muzzle_snds_H;    // External class reference
	class muzzle_snds_B;    // External class reference
	class muzzle_snds_M;    // External class reference
    class muzzle_snds_acp;	// External class reference
	class acc_pointer_IR;	// External class reference
	class acc_flashlight;	// External class reference
	class PistolCore;	// External class reference
	class Pistol;       // External class reference
    class Rifle;        // External class reference
    class RifleCore;    // External class reference
	class Pistol_Base_F;
	class Rifle_Base_F;
	class Rifle_Long_Base_F;
	// class WeaponSlotsInfo;
	// class ItemInfo;
	class CowsSlot;
	class PointerSlot;
	class UGL_F;
	class GrenadeLauncher;
    //Pistols
	class hgun_Pistol_heavy_02_F;
	class hgun_Rook40_F;
	class hgun_P07_F;
	class hgun_ACPC2_F;
	class hgun_Pistol_heavy_01_F;
	class Binocular;
	class arifle_AKS_base_F;
	class arifle_AKM_base_F;
	class arifle_AK12_base_F;
	class LMG_03_base_F;
	class arifle_SPAR_01_base_F;
	class arifle_SPAR_02_base_F;
	class arifle_SPAR_03_base_F;
	class arifle_CTAR_base_F;
	class arifle_CTARS_base_F;
	class arifle_ARX_base_F;
	class DMR_07_base_F;
	class SMG_05_base_F;

	class HMG_M2;
	class BP_HMG_M2 : HMG_M2
	{
	    displayName = "BP M2 HMG .50";
        magazines[] = {"BP_100Rnd_127x99_box"};
	};

	class Rifle_Base_F_BP: Rifle_Base_F
	{
		class Butt: UGL_F
		{
			maxZeroing = 5;
			discreteDistanceInitIndex = 0;
			discreteDistance[] = {5};
			magazines[] = {"BP_Rifle_Butt"};
			displayName = "Melee";
			modes[] = {"Single"};
			class Single: Mode_SemiAuto
			{
				sounds[] = {"StandardSound"};
				class BaseSoundModeType
				{
					closure1[] = {};
					soundClosure[] = {};
				};
				class StandardSound: BaseSoundModeType
				{
					begin1[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.95, 10};
					begin2[] = {};
					soundBegin[] = {"begin1", 1};
				};
			};
			reloadMagazineSound[] = {};
			drySound[] = {};
			magazineReloadTime = 0;
			autoReload = 1;
			reloadTime = 0.400000;
			optics = 0;
			modelOptics = "-";
			cameraDir = "";
			memoryPointCamera = "eye";
			opticsZoomMin = 0.375000;
			opticsZoomMax = 1.100000;
			opticsZoomInit = 0.750000;
			weaponInfoType = "RscWeaponZeroing";
			flash = "";
			flashSize = 0;
			class GunParticles
			{
				class FirstEffect
				{
					effectName = "";
					positionName = "Usti hlavne";
					directionName = "Konec hlavne";
				};
			};
		};
	};

	/*
		Breaking Point: Melee Weapons
			By Deathlyrage
	*/


	class MeleeWeapon : Rifle
	{
		scope = 2;
		distanceZoomMin = 50;
		distanceZoomMax = 50;
		canDrop = 0;
		cursor = "EmptyCursor";
		cursorAim = "throw";
		cursorSize = 1;
		weaponInfoType = "RscWeaponEmpty";
	};

	class MeleeHatchet : MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		weaponReloadtime = 0.25;
		model = "\breakingpoint_weapons\models\Hatchet\bp_Hatchet.p3d";
		picture = "\breakingpoint_weapons\icons\gear_hatchet_x_CA.paa";
		displayName = "Hatchet";
		descriptionUse = "Hatchet";
		reloadAction = "ReloadRPG";
		magazines[] = {"Hatchet_Swing"};
		handAnim[] = {"OFP2_ManSkeleton", "\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "$STR_EQUIP_DESC_41";
		modes[] = {"Single"};
		class Single : Mode_SemiAuto
		{
			sounds[] = {StandardSound};
			class BaseSoundModeType
 			{
 				weaponSoundEffect  = "DefaultRifle";
 				closure1[] = {"", 0.00006, 1, 10};
 				closure2[] = {"", 0.00006, 1, 10};
 				soundClosure[] = {"closure1", 0.500000, "closure2", 0.500000};
 			};
 			class StandardSound: BaseSoundModeType
 			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.95, 10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.70, 10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.60, 10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.80, 10};
				soundBegin[] = {"begin1", 0.25, "begin2", 0.25, "begin3", 0.25, "begin4", 0.25};
 			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 0.6;
			recoil = "recoil_single_primary_prone_1outof10";
			recoilProne = "";
		};
		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901, 801, 701};
			class MuzzleSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class CowsSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot : PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleeHatchet_WDL : MeleeHatchet
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\hatchet_wdl_co.paa"};
	};

	class MeleeHatchet_DES : MeleeHatchet
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\hatchet_des_co.paa"};
	};

	class MeleeHatchet_URB : MeleeHatchet
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\hatchet_urb_co.paa"};
	};

	class MeleeKatana : MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		dexterity = 9.000000;
		weaponReloadtime = 0.25;
		model = "\breakingpoint_weapons\models\Hatchet\bp_katana.p3d";
		picture = "\breakingpoint_weapons\icons\gear_katana_melee_x_CA.paa";
		displayName = "Katana";
		descriptionUse = "Katana";
		//reloadAction = "ReloadRPG";
		magazines[] = {"Katana_Swing"};
		handAnim[] = {"OFP2_ManSkeleton", "\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "Traditional Japanese sword, must have belonged to a collector";
		modes[] = {"Single"};
		class Single : Mode_SemiAuto
		{
			sounds[] = {StandardSound};
			class BaseSoundModeType
 			{
 				weaponSoundEffect  = "DefaultRifle";
 				closure1[] = {"", 0.00006, 1, 10};
 				closure2[] = {"", 0.00006, 1, 10};
 				soundClosure[] = {"closure1", 0.500000, "closure2", 0.500000};
 			};
 			class StandardSound: BaseSoundModeType
 			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.95, 10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.70, 10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.60, 10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.80, 10};
				soundBegin[] = {"begin1", 0.25, "begin2", 0.25, "begin3", 0.25, "begin4", 0.25};
 			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 0.6;
			recoil = "recoil_single_primary_prone_1outof10";
			recoilProne = "";
		};
		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901, 801, 701};
			class MuzzleSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class CowsSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot : PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleeKatana_WDL : MeleeKatana
	{
		hiddenSelections[] = {"camo1", "camo2"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\Blade2_wdl_co.paa", "breakingpoint_weapons\textures\Hatchet\Tsuka2_wdl_co.paa"};
	};

	class MeleeKatana_DES : MeleeKatana
	{
		hiddenSelections[] = {"camo1", "camo2"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\Blade2_des_co.paa", "breakingpoint_weapons\textures\Hatchet\Tsuka2_des_co.paa"};
	};

	class MeleeKatana_URB : MeleeKatana
	{
		hiddenSelections[] = {"camo1", "camo2"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\Blade2_urb_co.paa", "breakingpoint_weapons\textures\Hatchet\Tsuka2_urb_co.paa"};
	};

	class MeleePickaxe : MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		weaponReloadtime = 0.25;
		model = "\breakingpoint_weapons\models\Hatchet\bp_pickaxe.p3d";
		picture = "\breakingpoint_weapons\icons\gear_axe_rifle_x_ca.paa";
		displayName = "Pick Axe";
		descriptionUse = "Pick Axe";
		//reloadAction = "ReloadRPG";
		magazines[] = {"Pickaxe_Swing"};
		handAnim[] = {"OFP2_ManSkeleton", "\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "Basic farm implement";
		modes[] = {"Single"};
		class Single : Mode_SemiAuto
		{
			sounds[] = {StandardSound};
			class BaseSoundModeType
 			{
 				weaponSoundEffect  = "DefaultRifle";
 				closure1[] = {"", 0.00006, 1, 10};
 				closure2[] = {"", 0.00006, 1, 10};
 				soundClosure[] = {"closure1", 0.500000, "closure2", 0.500000};
 			};
 			class StandardSound: BaseSoundModeType
 			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.65, 10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.70, 10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.90, 10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.80, 10};
				soundBegin[] = {"begin1", 0.25, "begin2", 0.25, "begin3", 0.25, "begin4", 0.25};
 			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 1.0;
			recoil = "recoil_single_primary_prone_3outof10";
			recoilProne = "";
		};
		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901, 801, 701};
			class MuzzleSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class CowsSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot : PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleePickaxe_WDL : MeleePickaxe
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\pickaxe_wdl_co.paa"};
	};

	class MeleePickaxe_DES : MeleePickaxe
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\pickaxe_des_co.paa"};
	};

	class MeleePickaxe_URB : MeleePickaxe
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\pickaxe_urb_co.paa"};
	};

	class MeleeHammer : MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		weaponReloadtime = 0.45;
		model = "\breakingpoint_weapons\models\Hatchet\bp_hammer.p3d";
		picture = "\breakingpoint_weapons\icons\gear_hammer_rifle_x_CA.paa";
		displayName = "Sledge Hammer";
		descriptionUse = "Sledge Hammer";
		//reloadAction = "ReloadRPG";
		magazines[] = {"Hammer_Swing"};
		handAnim[] = {"OFP2_ManSkeleton", "\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "I wanna be...";
		modes[] = {"Single"};
		class Single : Mode_SemiAuto
		{
			sounds[] = {StandardSound};
			class BaseSoundModeType
 			{
 				weaponSoundEffect  = "DefaultRifle";

 				closure1[] = {"", 0.00006, 1, 10};
 				closure2[] = {"", 0.00006, 1, 10};
 				soundClosure[] = {"closure1", 0.500000, "closure2", 0.500000};
 			};
 			class StandardSound: BaseSoundModeType
 			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.55, 10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.30, 10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.70, 10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.90, 10};
				soundBegin[] = {"begin1", 0.25, "begin2", 0.25, "begin3", 0.25, "begin4", 0.25};
 			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 1.2;
			recoil = "recoil_single_primary_prone_3outof10";
			recoilProne = "";
		};
		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901, 801, 701};
			class MuzzleSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {"BP_Wire"};
				iconScale = 0.1;
			};
			class CowsSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot : PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleeHammer_WDL : MeleeHammer
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\sledge_wdl_co.paa"};
	};

	class MeleeHammer_DES : MeleeHammer
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\sledge_des_co.paa"};
	};

	class MeleeHammer_URB : MeleeHammer
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\sledge_urb_co.paa"};
	};

	class MeleeHammer2 : MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		model = "\breakingpoint_weapons\models\Hatchet\bp_hammerW.p3d";
		picture = "\breakingpoint_weapons\icons\gear_hammer_rifle_x_CA.paa";
		displayName = "Modified Sledge Hammer";
		descriptionUse = "Sledge Hammer";
		magazines[] = {"Hammer_Swing2"};
		handAnim[] = {"OFP2_ManSkeleton", "\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "I wanna be...";
		modes[] = {"Single"};
		class Single : Mode_SemiAuto
		{
			sounds[] = {StandardSound};
			class BaseSoundModeType
 			{
 				weaponSoundEffect  = "DefaultRifle";
 				closure1[] = {"", 0.00006, 1, 10};
 				closure2[] = {"", 0.00006, 1, 10};
 				soundClosure[] = {"closure1", 0.500000, "closure2", 0.500000};
 			};
 			class StandardSound: BaseSoundModeType
 			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.55, 10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.30, 10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.70, 10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav", 1.994328, 0.90, 10};
				soundBegin[] = {"begin1", 0.25, "begin2", 0.25, "begin3", 0.25, "begin4", 0.25};
 			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 1.2;
			recoil = "recoil_single_primary_prone_3outof10";
			recoilProne = "";
		};
		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901, 801, 701};

			class MuzzleSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {"BP_Wire"};
				iconScale = 0.1;
			};
			class CowsSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot : PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleeHammer2_WDL : MeleeHammer2
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\sledge_wdl_co.paa"};
	};

	class MeleeHammer2_DES : MeleeHammer2
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\sledge_des_co.paa"};
	};

	class MeleeHammer2_URB : MeleeHammer2
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\sledge_urb_co.paa"};
	};

	class MeleeShovel: MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		weaponReloadtime = 0.25;
		model = "\breakingpoint_weapons\models\hatchet\bp_shovel.p3d";
		picture = "\breakingpoint_weapons\icons\gear_shovel_rifle_x_ca.paa";
		displayName = "Shovel";
		descriptionUse = "Shovel";
		magazines[] = {"Shovel_Swing"};
		handAnim[] = {"OFP2_ManSkeleton","\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "Standard gardening tool. Can be used for construction and as an improvised weapon.";
		modes[] = {"Single"};
		class Single: Mode_SemiAuto
		{
			sounds[] = {0};
			class BaseSoundModeType
			{
				weaponSoundEffect = "DefaultRifle";
				closure1[] = {"",6e-005,1,10};
				closure2[] = {"",6e-005,1,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class 0: BaseSoundModeType
			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.65,10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.7,10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.9,10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.8,10};
				soundBegin[] = {"begin1",0.25,"begin2",0.25,"begin3",0.25,"begin4",0.25};
			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 0.8;
			recoil = "recoil_single_primary_prone_3outof10";
			recoilProne = "";
		};
		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901,801,701};
			class MuzzleSlot: SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class CowsSlot: SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot: PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleeShovel_WDL: MeleeShovel
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\shovel_wdl_co.paa"};
	};

	class MeleeShovel_DES: MeleeShovel
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\shovel_des_co.paa"};
	};

	class MeleeShovel_URB: MeleeShovel
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\shovel_urb_co.paa"};
	};

	class MeleeCrowbar: MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		weaponReloadtime = 0.25;
		model = "\breakingpoint_weapons\models\hatchet\bp_crowbar.p3d";
		picture = "\breakingpoint_weapons\icons\gear_crowbar_rifle_x_ca.paa";
		displayName = "Crowbar";
		descriptionUse = "Crowbar";
		magazines[] = {"Shovel_Swing"};
		handAnim[] = {"OFP2_ManSkeleton","\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "A tool consisting of a metal bar with a single curved end and flattened points, often with a small fissure on one or both ends for removing nails.";
		modes[] = {"Single"};
		class Single: Mode_SemiAuto
		{
			sounds[] = {0};
			class BaseSoundModeType
			{
				weaponSoundEffect = "DefaultRifle";
				closure1[] = {"",6e-005,1,10};
				closure2[] = {"",6e-005,1,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class 0: BaseSoundModeType
			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.65,10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.7,10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.9,10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.8,10};
				soundBegin[] = {"begin1",0.25,"begin2",0.25,"begin3",0.25,"begin4",0.25};
			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 0.8;
			recoil = "recoil_single_primary_prone_3outof10";
			recoilProne = "";
		};

		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901,801,701};
			class MuzzleSlot: SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class CowsSlot: SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot: PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleeCrowbar_WDL: MeleeCrowbar
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\crowbar_wdl_co.paa"};
	};

	class MeleeCrowbar_DES: MeleeCrowbar
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\crowbar_des_co.paa"};
	};

	class MeleeCrowbar_URB: MeleeCrowbar
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\crowbar_urb_co.paa"};
	};

	class MeleeClub: MeleeWeapon
	{
		autoreload = 1;
		scope = 2;
		type = 4;
		primary = 0;
		weaponReloadtime = 0.25;
		model = "\breakingpoint_weapons\models\hatchet\bp_club.p3d";
		picture = "\breakingpoint_weapons\icons\gear_club_rifle_x_ca.paa";
		displayName = "Barbed Club";
		descriptionUse = "Barbed Club";
		magazines[] = {"Shovel_Swing"};
		handAnim[] = {"OFP2_ManSkeleton","\breakingpoint_weapons\anim\Hatchet_Idle.rtm"};
		descriptionShort = "";
		modes[] = {"Single"};
		class Single: Mode_SemiAuto
		{
			sounds[] = {0};
			class BaseSoundModeType
			{
				weaponSoundEffect = "DefaultRifle";
				closure1[] = {"",6e-005,1,10};
				closure2[] = {"",6e-005,1,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class 0: BaseSoundModeType
			{
				begin1[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.65,10};
				begin2[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.7,10};
				begin3[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.9,10};
				begin4[] = {"breakingpoint_sfx\effects\Swing.wav",1.994328,0.8,10};
				soundBegin[] = {"begin1",0.25,"begin2",0.25,"begin3",0.25,"begin4",0.25};
			};
			dispersion = 0.0092;
			soundContinuous = 0;
			reloadTime = 0.8;
			recoil = "recoil_single_primary_prone_3outof10";
			recoilProne = "";
		};
		class WeaponSlotsInfo
		{
			mass = 35;
			allowedSlots[] = {901,801,701};
			class MuzzleSlot: SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class CowsSlot: SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
			class PointerSlot: PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {};
				iconScale = 0.1;
			};
		};
	};

	class MeleeClub_WDL: MeleeClub
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\club_wdl_co.paa"};
	};

	class MeleeClub_DES: MeleeClub
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\club_des_co.paa"};
	};

	class MeleeClub_URB: MeleeClub
	{
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"breakingpoint_weapons\textures\Hatchet\club_urb_co.paa"};
	};

	class BP_Crossbow : Rifle_Base_F_BP
	{
		author = "Kol9yN, Boolyq";
		displayName = "PSE TAC Elite Crossbow";
		descriptionUse = "Crossbow";
		descriptionShort = "Crossbow";
		scope = 2;
		picture = "\breakingpoint_weapons\icons\gear_crossbow_rifle_x_ca.paa";
		model = "breakingpoint_weapons\models\crossbow\bp_crossbow.p3d";
		magazines[] = {"BP_Arrow_Mag","BP_Arrow_Rambo","BP_Arrow_Tranq","BP_Arrow_Poison","BP_Arrow_Fire"};
		muzzles[] = {"this", "Butt"};
		class Library
		{
			libTextDesc = "PSE TAC Elite Crossbow";
		};
		reloadAction = "crossbow_reload";
		maxZeroing = 300;
		discreteDistanceInitIndex = 3;
		discreteDistance[] = { 25,50,75,100,125,150,175,200,225,250,275,300 };
		maxRecoilSway = 0.0125;
		swayDecaySpeed = 0.75;
		canShootInWater = 1;
		class GunParticles
		{
			class SecondEffect
			{
				//positionName = "Nabojnicestart";
				//directionName = "Nabojniceend";
				//effectName = "CaselessAmmoCloud";
				positionName = "";
				directionName = "";
				effectName = "";
			};
		};
		class WeaponSlotsInfo
		{
		    mass = 70;
			allowedSlots[] = {901};
			class MuzzleSlot: SlotInfo {};
			class CowsSlot : SlotInfo
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				compatibleItems[] = {"BP_compm4s", "optic_MRCO", "optic_aco", "optic_Holosight", "BP_SOS", "BP_optic_ACOG", "BP_M3A", "BP_M3A2","BP_M3AN", "BP_MRT"};
				iconScale = 0.1;
			};
			class PointerSlot: PointerSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\SIDE";
				compatibleItems[] = {"BP_flashlight"}; //removed "BP_CPad" due to incorrect placement
				iconScale = 0.1;
			};
		};
		opticsZoomMin = 0.575;
		opticsZoomMax = 1.0;
		opticsZoomInit = 0.75;
		distanceZoomMin = 300;
		distanceZoomMax = 300;
		handAnim[] = { "OFP2_ManSkeleton", "breakingpoint_weapons\anim\crossbow_handanim.rtm" };
		//handAnim[] = {"OFP2_ManSkeleton","\A3\Weapons_F\Rifles\MX\data\Anim\MX.rtm"};
		dexterity = 0.8;
		inertia = 0.400000;
		caseless[] = { "", 1, 1, 1 };
		soundBullet[] = { "caseless", 1 };
		changeFiremodeSound[] = { "", 0.17782794, 1, 5 };
		modes[] = { "Single" };
		UiPicture = "";
		class Single : Mode_SemiAuto
		{
			sounds[] = {StandardSound};
			class BaseSoundModeType
			{
				weaponSoundEffect = "DefaultRifle";
				closure1[] = { "A3\sounds_f\weapons\closure\closure_rifle_6", 0.4, 1, 5 };
				closure2[] = { "A3\sounds_f\weapons\closure\closure_rifle_7", 0.4, 1, 5 };
				soundClosure[] = { "closure1", 0.5, "closure2", 0.5 };
			};
			class StandardSound : BaseSoundModeType
			{
				begin1[] = { "breakingpoint_jsrs\sounds\crossbow-1.wav", 1, 1, 10 };
				begin2[] = { "breakingpoint_jsrs\sounds\crossbow-1.wav", 1, 1, 10 };
				soundBegin[] = { "begin1", 0.5, "begin2", 0.5 };
			};
			reloadTime = 4.8;
			magazineReloadTime = 4.8;
			//recoil = "recoil_single_trg";
			//recoilProne = "recoil_single_prone_trg";
			recoil = "recoil_single_primary_prone_1outof10";
			recoilProne = "recoil_single_primary_prone_1outof10";
			dispersion = 0.00007;
			minRange = 1;
			minRangeProbab = 0.5;
			midRange = 100;
			midRangeProbab = 0.7;
			maxRange = 300;
			maxRangeProbab = 0.3;
		};
		aiDispersionCoefY = 2.0;
		aiDispersionCoefX = 1.0;
		drySound[] = { "A3\sounds_f\weapons\Other\dry_1", 0.56234133, 1, 35 };
		//reloadMagazineSound[] = { "A3\sounds_f\weapons\reloads\new_MX", 1.0, 1, 5 };
		reloadMagazineSound[] = { "breakingpoint_jsrs\sounds\crossbow_reload.wss", 1.0, 1, 20 };
	};
	class BP_Crossbow_DigitCamo : BP_Crossbow
	{
		displayName = "PSE TAC Elite Crossbow Digital Camo";
		picture = "\breakingpoint_weapons\icons\gear_crossbow_indp_rifle_x_ca.paa";
		descriptionUse = "Crossbow";
		linkedAttach[] = {"BP_Compm4s"};
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"\breakingpoint_weapons\textures\crossbow\crossbow_indp_co.paa"};
	};

	/*
		Breaking Point: Throwable Weapons
			By Valtiel
	*/


	class Throw: GrenadeLauncher
	{
		muzzles[] = {"BP_M84Muzzle", "BP_AlarmClockMuzzle", "HandGrenade_Stone", "HandGrenadeMuzzle", "MiniGrenadeMuzzle", "SmokeShellMuzzle", "SmokeShellYellowMuzzle", "SmokeShellGreenMuzzle", "SmokeShellRedMuzzle", "SmokeShellPurpleMuzzle", "SmokeShellOrangeMuzzle", "SmokeShellBlueMuzzle", "ChemlightGreenMuzzle", "ChemlightRedMuzzle", "ChemlightYellowMuzzle", "ChemlightBlueMuzzle", "KnifeMuzzle", "BookMuzzle", "MugMuzzle", "BrickMuzzle", "PotteryMuzzle", "VideotapeMuzzle", "ZipDiskMuzzle", "RockMuzzle", "PlateMuzzle", "TennisBallMuzzle", "CanMuzzle", "HammerMuzzle", "InfectedMuzzle", "ChemRMuzzle", "ChemGMuzzle", "ChemBMuzzle", "ChemYMuzzle"};

		class ThrowMuzzle: GrenadeLauncher
		{
			aidispersioncoefx = 6;
			aidispersioncoefy = 6;
			autoreload = 1;
			cursor = "EmptyCursor";
			cursoraim = "throw";
			enableattack = 0;
			keepininventory = 1;
			magazinereloadtime = 0;
			modeloptics = "";
			reloadsound[] = {"", 0.000316, 1};
			reloadtime = 0;
			showempty = 0;
			sound[] = {"", 0.000316, 1};
		};

		class BP_M84Muzzle: ThrowMuzzle
		{
			displayName = "M84 Flashbang";
			magazines[] = {"BP_M84_Flash"};
		};
		class BP_AlarmClockMuzzle: ThrowMuzzle
		{
			displayName = "Alarm Clock";
			magazines[] = {"BP_AlarmClock_Black", "BP_AlarmClock_Red"};
		};
		class KnifeMuzzle: ThrowMuzzle
		{
			displayName = "Hunting Knife";
			magazines[] = {"Itemknife"};
		};

		class InfectedMuzzle: ThrowMuzzle
		{
			displayName = "Infected Needle";
			magazines[] = {"ItemInfectedNeedle"};
		};

		class BookMuzzle: ThrowMuzzle
		{
			displayName = "Book";
			magazines[] = {"ItemBook1", "ItemBook2", "ItemBook3"};
		};

		class MugMuzzle: ThrowMuzzle
		{
			displayName = "Mug";
			magazines[] = {"ItemMug"};
		};

		class BrickMuzzle: ThrowMuzzle
		{
			displayName = "Brick";
			magazines[] = {"ItemBrick1", "ItemBrick2"};
		};

		class PotteryMuzzle: ThrowMuzzle
		{
			displayName = "Pottery";
			magazines[] = {"ItemPottery"};
		};

		class VideotapeMuzzle: ThrowMuzzle
		{
			displayName = "VHS Tape";
			magazines[] = {"ItemVideoTape"};
		};

		class ZipDiskMuzzle: ThrowMuzzle
		{
			displayName = "ZipDisk";
			magazines[] = {"ItemZipDisk"};
		};

		class RockMuzzle: ThrowMuzzle
		{
			displayName = "Rock";
			magazines[] = {"ItemRock"};
		};

		class PlateMuzzle: ThrowMuzzle
		{
			displayName = "Dinner Plate";
			magazines[] = {"ItemPlate1", "ItemPlate2"};
		};

		class TennisBallMuzzle: ThrowMuzzle
		{
			displayName = "Tennis Ball";
			magazines[] = {"ItemTennisBall"};
		};

		class CanMuzzle: ThrowMuzzle
		{
			displayName = "Empty Can";
			magazines[] = {"ItemCanEmpty"};
		};

		class HammerMuzzle: ThrowMuzzle
		{
			displayName = "Hammer";
			magazines[] = {"ItemHammer"};
		};

		class ChemRMuzzle: ThrowMuzzle
		{
			displayName = "Chemlight";
			magazines[] = {"ChemR"};
		};

		class ChemGMuzzle: ThrowMuzzle
		{
			displayName = "Chemlight";
			magazines[] = {"ChemG"};
		};

		class ChemBMuzzle: ThrowMuzzle
		{
			displayName = "Chemlight";
			magazines[] = {"ChemB"};
		};

		class ChemYMuzzle: ThrowMuzzle
		{
			displayName = "Chemlight";
			magazines[] = {"ChemY"};
		};
	};
	class BP_Wire: ItemCore
	{
		scope = 2;
		displayName = "Barbed Wire";
		descriptionshort = "A snarled bundle of barbed wire";
		picture = "\breakingpoint_weapons\icons\CZMod_co.paa";
		model = "\breakingpoint_weapons\models\hatchet\BP_wire.p3d";
		inertia = 0.000000;
		class ItemInfo: InventoryMuzzleItem_Base_F
		{
			mass = 10;
 			soundTypeIndex = 1; // index of sound in sounds[] in weapon modes (inherited 1 from parent class)
 			class MagazineCoef
			{
 				initSpeed = 1.001;
 			};
 			class AmmoCoef
			{
 				hit = 1.5000;
 				visibleFire = 0.3;
 				audibleFire = 0.01;
 				visibleFireTime = 0.5;
 				audibleFireTime = 1.0;
 				cost = 1.0;
 				typicalSpeed = 1.0;
 				airFriction = 1.0;
 			};
 			muzzleEnd = ""; // memory point in muzzle supressor's model
 			alternativeFire = "";  // class in cfgWeapons with model of muzzle flash
 			class MuzzleCoef
			{
 				dispersionCoef = 1.0f;
 				artilleryDispersionCoef = 1.0f;
 				fireLightCoef = 1.0f;
 				recoilCoef = 1.0f;
 				recoilProneCoef = 1.0f;
 				minRangeCoef = 1.0f;
				minRangeProbabCoef = 1.0f;
 				midRangeCoef = 1.0f;
				midRangeProbabCoef = 1.0f;
 				maxRangeCoef = 1.0f;
				maxRangeProbabCoef = 1.0f;
 			};
 		};
	};
};
//--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//CLASS CREATION MAGS|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

class CfgMagazines {
	class Default;	// External class reference
	class CA_Magazine;	// External class reference
	class BP_Magazine;  // External class reference
	class CA_LauncherMagazine;
	class ATMine_Range_Mag;
	class Chemlight_green;
	class Chemlight_red;
	class Chemlight_blue;
	class Chemlight_yellow;
	class 30Rnd_556x45_Stanag;
	class 10Rnd_762x51_Mag;
	class 11Rnd_45ACP_Mag;
	class 150Rnd_762x51_Box;
	class 150Rnd_762x51_Box_Tracer;
	class 200Rnd_65x39_Belt;
	class 200Rnd_65x39_Belt_Tracer_Green;
	class 200Rnd_65x39_Belt_Tracer_Red;
	class 200Rnd_65x39_Belt_Tracer_Yellow;
	class 100Rnd_65x39_caseless_mag;
	class 100Rnd_127x99_mag;
	class 20Rnd_556x45_UW_mag;
	class 20Rnd_762x51_Mag;
	class 30Rnd_45ACP_Mag_SMG_01;
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green;
	class 30Rnd_556x45_Stanag_Tracer_Green;
	class 30Rnd_556x45_Stanag_Tracer_Red;
	class 30Rnd_556x45_Stanag_Tracer_Yellow;
	class 30Rnd_65x39_caseless_green;
	class 30Rnd_65x39_caseless_green_mag_Tracer;
	class 30Rnd_65x39_caseless_mag;
	class 30Rnd_65x39_caseless_mag_Tracer;
	class 16Rnd_9x21_Mag;
	class 30Rnd_9x21_Mag;
	class 5Rnd_127x108_APDS_Mag;
	class 5Rnd_127x108_Mag;
	class 6Rnd_45ACP_Cylinder;
	class 7Rnd_408_Mag;
	class 9Rnd_45ACP_Mag;
	class RPG32_F;
	class RPG32_HE_F;
	class NLAW_F;
	class Titan_AT;
	class Titan_AP;
	class Titan_AA;

	/*
		Magazines: Tin Cans
	*/

	class HandGrenade;	// External class reference
	class TrashJackDaniels : HandGrenade {};
	class TrashTinCan : HandGrenade {};
	class ItemSodaEmpty : HandGrenade {};

	class ChemG: Chemlight_green
	{
		mass = 5;
	};

	class ChemR: Chemlight_red
	{
		mass = 5;
	};

	class ChemY: Chemlight_yellow
	{
		mass = 5;
	};

	class ChemB: Chemlight_blue
	{
		mass = 5;
	};

	class Hatchet_Swing : CA_Magazine
	{
		scope = 2;
		autoReload = 0;
		flash = "";
		flashSize = 0;
		initSpeed = 85;
		maxLeadSpeed = 20;
		picture = "\breakingpoint_weapons\icons\m_satchel_ca.paa";
		//modelSpecial = "\breakingpoint_weapons\models\Hatchet\BP_hatchet_loaded.p3d";
		displayName = "Hatchet Swing";
		displayNameMagazine = "Hatchet Swing";
		shortNameMagazine = "Hatchet Swing";
		count = 100000;
		ammo = "BP_Hatchet_Swing_Ammo";
		mass = 0;
	};

	class Katana_Swing : Hatchet_Swing
	{
		displayName = "Katana Swing";
		displayNameMagazine = "Katana Swing";
		shortNameMagazine = "Katana Swing";
		ammo = "BP_Katana_Swing_Ammo";
	};

	class Pickaxe_Swing : Hatchet_Swing
	{
		displayName = "Pickaxe Swing";
		displayNameMagazine = "Pickaxe Swing";
		shortNameMagazine = "Pickaxe Swing";
		ammo = "BP_Pickaxe_Swing_Ammo";
	};

	class Hammer_Swing : Hatchet_Swing
	{
		displayName = "Hammer Swing";
		displayNameMagazine = "Hammer Swing";
		shortNameMagazine = "Hammer Swing";
		ammo = "BP_Hammer_Swing_Ammo";
	};

	class Hammer_Swing2 : Hatchet_Swing
	{
		displayName = "Modified Hammer Swing";
		displayNameMagazine = "Hammer Swing";
		shortNameMagazine = "Hammer Swing";
		ammo = "BP_Hammer_Swing_Ammo2";
	};

	class Shovel_Swing: Hatchet_Swing
	{
		displayName = "Shovel Swing";
		displayNameMagazine = "Shovel Swing";
		shortNameMagazine = "Shovel Swing";
		ammo = "BP_Shovel_Swing_Ammo";
	};

	class BP_Bayonet_Stab : Hatchet_Swing
	{
		displayName = "Stab";
		displayNameMagazine = "Stab";
		shortNameMagazine = "Stab";
		selectionFireAnim = "";
		initSpeed = 85;
		ammo = "BP_Bayonet";
	};

	class BP_Rifle_Butt : Hatchet_Swing
	{
		displayName = "Rifle Melee";
		displayNameMagazine = "Rifle Melee";
		shortNameMagazine = "Rifle Melee";
		selectionFireAnim = "";
		initSpeed = 85;
		ammo = "BP_Rifle_Melee";
	};

	class BP_Arrow_Mag: CA_Magazine
	{
		scope = 2;
		displayName = "Boarhead Bolt";
		picture = "\breakingpoint_weapons\icons\m_arrow_ca.paa"; //add different pics for each type
		mass = 1;
		ammo = "BP_Arrow_Ball";
		model = "\breakingpoint_weapons\models\crossbow\arrow.p3d";
		count = 1;
		initSpeed = 325;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "Classic boarhead hunting bolt for PSE TAC Elite Crossbow";
	};

	class BP_Arrow_Tranq: CA_Magazine
	{
		scope = 2;
		displayName = "Tranq Bolt";
		picture = "\breakingpoint_weapons\icons\m_arrow_t_ca.paa";
		mass = 1;
		ammo = "BP_Arrow_Ball_Tranq";
		model = "\breakingpoint_weapons\models\crossbow\arrow.p3d";
		count = 1;
		initSpeed = 325;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "Tranq tipped hunting bolt for PSE TAC Elite Crossbow";
	};

	class BP_Arrow_Poison: CA_Magazine
	{
		scope = 2;
		displayName = "Poison Bolt";
		picture = "\breakingpoint_weapons\icons\m_arrow_p_ca.paa";
		mass = 1;
		ammo = "BP_Arrow_Ball_Poison";
		model = "\breakingpoint_weapons\models\crossbow\arrow.p3d";
		count = 1;
		initSpeed = 325;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "Poison tipped hunting bolt for PSE TAC Elite Crossbow";
	};

	class BP_Arrow_Rambo: CA_Magazine
	{
		scope = 2;
		displayName = "Rambo Bolt";
		picture = "\breakingpoint_weapons\icons\m_arrow_r_ca.paa";
		mass = 1.3;
		ammo = "BP_Arrow_Ball_Rambo";
		model = "\breakingpoint_weapons\models\crossbow\arrow.p3d";
		count = 1;
		initSpeed = 290;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "Explosive tipped hunting bolt for PSE TAC Elite Crossbow";
	};

	class BP_Arrow_Fire: CA_Magazine
	{
		scope = 2;
		displayName = "Fire Bolt";
		picture = "\breakingpoint_weapons\icons\m_arrow_p_ca.paa";
		mass = 1;
		ammo = "BP_Arrow_Ball_Fire";
		model = "\breakingpoint_weapons\models\crossbow\arrow.p3d";
		count = 1;
		initSpeed = 325;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "Explosive Fire tipped hunting bolt for PSE TAC Elite Crossbow";
	};

	class BP_M84_Flash: HandGrenade
	{
		author = "Breaking Point";
		model = "\breakingpoint_weapons\models\m84\m84.p3d";
		displayName = "M84 Flashbang";
		picture = "\breakingpoint_weapons\icons\m_m84_r_ca.paa";
		displayNameShort = "Flashbang";
		ammo = "BP_Flashbang_Ammo";
		mass = 5;
	};
	class BP_AlarmClock_Black: HandGrenade
	{
		author = "Breaking Point";
		model = "\breakingpoint_weapons\models\AlarmClock\BP_AlarmClock.p3d";
		displayName = "Alarm Clock(Black)";
		picture = "\breakingpoint_weapons\icons\m_AlarmClock_r_ca.paa";
		displayNameShort = "Alarm Clock";

		descriptionShort = "";
		ammo = "BP_AlarmClock_Ammo";
		type = 256;
		mass = 2;
		value = 1;
		maxLeadSpeed = 7;
		initSpeed = 18;
		namesound = "empty";
		count = 1;
	};
	class BP_AlarmClock_Red: BP_AlarmClock_Black {
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"\breakingpoint_weapons\textures\AlarmClock\AlarmClockRed_co.paa"};
		displayName = "Alarm Clock(Red)";
	};
	class 1Rnd_HE_Grenade_shell;
	class BP_1Rnd_40mm_Flashbang: 1Rnd_HE_Grenade_shell
	{
		author = "Breaking Point";
		displayName = "1Rnd 40mm Flashbang";
		displayNameShort = "1Rnd GL Flashbang";
		descriptionShort = "Flashbang";
		ammo = "BP_GL_Flashbang_Ammo";
	};
};
//-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//CLASS CREATION BULLETS|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

class CfgAmmo {
	class Default;	// External class reference
	class BulletCore;	// External class reference
	class BulletBase;	// External class reference
	class ShotgunBase;  // External class reference
	class ShellBase;    // External class reference
	class FlareBase;    // External class reference
	class GrenadeBase;  // External class reference
	class Rocketbase;   // External class reference
	class MissileCore;   // External class reference
	class MineBase;     // External class reference
	class GrenadeHand_Stone;    // External class reference
	class B_762x51_Ball;
	class B_65x39_Caseless;
	class B_9x21_Ball;
	class B_408_Ball;
	class B_556x45_Ball;
	class B_45ACP_Ball;
	class B_127x108_Ball;
	class GrenadeHand;
	class G_40mm_HE;
	class SmokeShell;

	class BP_Flashbang_Ammo: GrenadeHand
	{
		scope = 1;
		hit = 0.001;
		indirectHit = 0.001;
		indirectHitRange = 0.01;
		model = "\breakingpoint_weapons\models\m84\m84.p3d";
		visibleFire = 0.5;
		audibleFire = 0.05;
		visibleFireTime = 1;
		fuseDistance = 5;
	//	ExplosionEffects = "SUPER_flashExplosion";
		soundHit1[] = {"breakingpoint_jsrs\sounds\m84.wav",1,10};
		soundHit2[] = {"breakingpoint_jsrs\sounds\m84.wav",1,10};
		soundHit3[] = {"breakingpoint_jsrs\sounds\m84.wav",1,10};
		soundHit4[] = {"breakingpoint_jsrs\sounds\m84.wav",1,10};
		soundHit5[] = {"breakingpoint_jsrs\sounds\m84.wav",1,10};
		soundHit6[] = {"breakingpoint_jsrs\sounds\m84.wav",1,10};
		soundHit[] = {"breakingpoint_jsrs\sounds\m84.wav",1,10};
	//	explosionSoundEffect = "flashbang2";
		explosionTime = 1.5;
	};

	class BP_GL_Flashbang_Ammo: G_40mm_HE
	{
		scope = 1;
		hit = 0.001;
		indirectHit = 0.001;
		indirectHitRange = 0.01;
		model = "\A3\weapons_f\ammo\UGL_slug";
		visibleFire = 0.1;
		audibleFire = 0.05;
		visibleFireTime = 1;
		fuseDistance = 4;
	//	ExplosionEffects = "SUPER_flashExplosion";
		soundHit[] = {"",0,1};
		explosionSoundEffect = "";
		explosionTime = 2.5;
	};

	/*class BP_CSGas_Green: SmokeShell
	{
		model = "\A3\Weapons_f\ammo\smokegrenade_green";
		smokeColor[] = {0.2125,0.6258,0.48909998,1};
	};*/

	class BP_Arrow_Ball: BulletBase
	{
		hit = 45;
		timeToLive = 30;
		cost = 1;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "";
		typicalSpeed = 325;
		airFriction = -0.000267;
		waterFriction = 0;
		whistleDist = 1;
		caliber = 0.5;
		deflecting = 0;
		model = "\breakingpoint_weapons\models\crossbow\arrow_tracer.p3d";
		tracerScale = 1;
		tracerStartTime = 0;
		tracerEndTime = 3;
		visibleFire = 1;
		audibleFire = 1;
		supersonicCrackNear[] = {};
		supersonicCrackFar[] = {};
		legFracture = true;
		class CamShakeHit
		{
			power = 2;
			duration = 1;
			frequency = 25;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 4;
			MedicalChance = 70;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 2;
			BleedingChance = 60;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Arrow_Ball_Poison: BulletBase
	{
		hit = 10;
		timeToLive = 30;
		cost = 1;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "";
		typicalSpeed = 325;
		airFriction = -0.000267;
		waterFriction = 0;
		whistleDist = 1;
		caliber = 0.5;
		deflecting = 0;
		model = "\breakingpoint_weapons\models\crossbow\arrow_tracer.p3d";
		tracerScale = 1;
		tracerStartTime = 0;
		tracerEndTime = 3;
		visibleFire = 1;
		audibleFire = 1;
		supersonicCrackNear[] = {};
		supersonicCrackFar[] = {};
		legFracture = true;
		class CamShakeHit
		{
			power = 2;
			duration = 1;
			frequency = 25;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 100;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 100;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 1; // 0 - Disabled / 1 - Enabled
			InfectionChance = 1; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Arrow_Ball_Rambo: GrenadeBase
	{
		hit = 45;
		timeToLive = 30;
		cost = 1;
		indirectHit = 45;
		indirectHitRange = 4;
		cartridge = "";
		typicalSpeed = 290;
		airFriction = -0.000267;
		waterFriction = 0;
		whistleDist = 1;
		caliber = 0.5;
		deflecting = 0;
		model = "\breakingpoint_weapons\models\crossbow\arrow_tracer.p3d";
		tracerScale = 1;
		tracerStartTime = 0;
		tracerEndTime = 3;
		visibleFire = 1;
		audibleFire = 1;
		supersonicCrackNear[] = {};
		supersonicCrackFar[] = {};
		legFracture = true;
		explosive = 1;
		fuseDistance = 2;
		soundHit1[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_1", 3.162278, 1, 1000};
		soundHit2[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_2", 3.162278, 1, 1000};
		soundHit3[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_3", 3.162278, 1, 1000};
		soundHit4[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_4", 3.162278, 1, 1000};
		soundHit5[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_5", 3.162278, 1, 1000};
		soundHit6[] = {"A3\Sounds_F\weapons\Explosion\gr_explosion_6", 3.162278, 1, 1000};
		multiSoundHit[] = {"soundHit1", 0.200000, "soundHit2", 0.200000, "soundHit3", 0.200000, "soundHit4", 0.100000, "soundHit5", 0.150000, "soundHit6", 0.150000};
		explosionSoundEffect = "DefaultExplosion";
		simulation = "shotShell";
		class CamShakeExplode
		{
			power = "(40*0.2)";
			duration = "((round (40^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((3 + 40^0.5)*8)";
		};
		class CamShakeHit
		{
			power = 20;
			duration = "((round (20^0.25))*0.2 max 0.2)";
			frequency = 20;
			distance = 1;
		};
		class CamShakeFire
		{
			power = "(0^0.25)";
			duration = "((round (0^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((0^0.5)*8)";
		};
		class CamShakePlayerFire
		{
			power = 0;
			duration = 0.100000;
			frequency = 20;
			distance = 1;
		};
	};

	class BP_Arrow_Ball_Fire: BulletBase
	{
		hit = 10;
		timeToLive = 30;
		cost = 1;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "";
		typicalSpeed = 325;
		airFriction = -0.000267;
		waterFriction = 0;
		whistleDist = 1;
		caliber = 0.5;
		deflecting = 0;
		model = "\breakingpoint_weapons\models\crossbow\arrow_tracer.p3d";
		tracerScale = 1;
		tracerStartTime = 0;
		tracerEndTime = 3;
		visibleFire = 1;
		audibleFire = 1;
		supersonicCrackNear[] = {};
		supersonicCrackFar[] = {};
		legFracture = true;
		class CamShakeHit
		{
			power = 2;
			duration = 1;
			frequency = 25;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 100;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 100;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 1; // 0 - Disabled / 1 - Enabled
			InfectionChance = 1; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class Throwable_base: Default
	{
		model = "\A3\Weapons_f\ammo\Handgrenade";
		hit = 10;
		indirectHit = 8;
		indirectHitRange = 6;
		explosive = 1;
		explosionEffectsRadius = 5;
		typicalspeed = 60;
		deflecting = 15;
		cost = 40;
		simulation = "shotGrenade";
		simulationStep = 0.05;
		shadow = 1;
		soundFly[] = {"",0.099999994,1,20};
		soundEngine[] = {"",1,1};
		explosionSoundEffect = "DefaultExplosion";
		CraterEffects = "GrenadeCrater";
		CraterWaterEffects = "ImpactEffectsWaterExplosion";
		explosionEffects = "GrenadeExplosion";
		visibleFire = 2;
		audibleFire = 0.25;
		visibleFireTime = 0;
		whistleDist = 28;
		explosionTime = 5;
		timeToLive = 6;
		class HitEffects
		{
			hitWater = "ImpactEffectsWaterRocket";
		};
		class CamShakeExplode
		{
			power = "(30*0.2)";
			duration = "((round (30^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((7 + 30^0.5)*8)";
		};
	};
	class bp_GrenadeHand_stone: Throwable_base
	{
		hit = 0.5;
		indirectHit = 0.2;
		indirectHitRange = 1;
		dangerRadiusHit = 6;
		suppressionRadiusHit = -1;
		CraterEffects = "NoCrater";
		explosionEffects = "NoExplosion";
		explosive = 0;
		soundHit[] = {"",1,1};
		cost = 1;
		whistleDist = 0;
		class CamShakeExplode
		{
			power = "(0*0.2)";
			duration = "((round (0^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((0 + 0^0.5)*8)";
		};
		class CamShakeHit
		{
			power = 5;
			duration = "((round (5^0.25))*0.2 max 0.2)";
			frequency = 20;
			distance = 1;
		};
	};

	class bp_throwable: bp_GrenadeHand_stone
	{
		model = "\A3\Weapons_f\ammo\Handgrenade";
		hit = 0.50000;
		explosionEffectsRadius = 0;
		explosionTime = 0;
		simulation = "shotShell";
		CraterEffects = "NoCrater";
		typicalspeed = 25;
		fuseDistance = 0;
		timeToLive = 45;
		indirectHit = 0;
		indirectHitRange = 0;
		deflecting = 10;
		soundHit1[] = {};
		soundHit2[] = {};
		soundHit3[] = {};
		soundHit4[] = {};
		soundHit5[] = {};
		soundHit6[] = {};
		soundImpactDefault1[] = {"A3\sounds_f\weapons\hits\concrete_3", 2.511886, 1, 10};
		impactGroundSoft[] = {"soundImpactDefault1", 1};
		impactGroundHard[] = {"soundImpactDefault1", 1};
		impactMan[] = {"soundImpactDefault1", 1};
		impactIron[] = {"soundImpactDefault1", 1};
		impactArmor[] = {"soundImpactDefault1", 1};
		impactBuilding[] = {"soundImpactDefault1", 1};
		impactFoliage[] = {"soundImpactDefault1", 1};
		impactWood[] = {"soundImpactDefault1", 1};
		impactGlass[] = {"soundImpactDefault1", 1};
		impactGlassArmored[] = {"soundImpactDefault1", 1};
		impactConcrete[] = {"soundImpactDefault1", 1};
		impactRubber[] = {"soundImpactDefault1", 1};
		impactPlastic[] = {"soundImpactDefault1", 1};
		impactDefault[] = {"soundImpactDefault1", 1};
		impactMetal[] = {"soundImpactDefault1", 1};
		impactMetalplate[] = {"soundImpactDefault1", 1};
		impactWater[] = {"soundImpactDefault1", 1};
		soundDefault1[] = {"A3\sounds_f\weapons\hits\concrete_3", 1.800000, 1, 10};
		soundDefault2[] = {"A3\sounds_f\weapons\hits\concrete_5", 1.800000, 1, 10};
		soundDefault3[] = {"A3\sounds_f\weapons\hits\concrete_7", 1.800000, 1, 10};
		soundDefault4[] = {"A3\sounds_f\weapons\hits\hard_ground_1", 1.812538, 1, 10};
		soundDefault5[] = {"A3\sounds_f\weapons\hits\hard_ground_2", 1.812538, 1, 10};
		soundGlass1[] = {"A3\sounds_f\weapons\hits\glass_5", 1.812538, 1, 100};
		soundGlass2[] = {"A3\sounds_f\weapons\hits\glass_6", 1.812538, 1, 100};
		soundGlass3[] = {"A3\sounds_f\weapons\hits\glass_arm_6", 1.858925, 1, 60};
		soundGlass4[] = {"A3\sounds_f\weapons\hits\glass_arm_7", 1.858925, 1, 60};
		soundRubber1[] = {"A3\sounds_f\weapons\hits\tyre_4", 0.891251, 1, 10};
		soundRubber2[] = {"A3\sounds_f\weapons\hits\tyre_7", 0.891251, 1, 10};
		soundWater1[] = {"A3\sounds_f\weapons\hits\water_4", 1.000000, 1, 10};
		hitDefault[] = {"soundDefault1", 0.200000, "soundDefault2", 0.200000, "soundDefault3", 0.200000, "soundDefault4", 0.200000, "soundDefault5", 0.200000};
		hitGlass[] = {"soundGlass1", 0.4000000, "soundGlass2", 0.400000, "soundGlass3", 0.100000, "soundGlass4", 0.100000};
		hitRubber[] = {"soundRubber1", 0.600000, "soundRubber2", 0.4000000};
		hitWater[] = {"soundWater1", 0.125000};
		class HitEffects
		{
			Hit_Foliage_green = "ImpactLeavesGreen";
			Hit_Foliage_Dead = "ImpactLeavesDead";
			Hit_Foliage_Green_big = "ImpactLeavesGreenBig";
			Hit_Foliage_Palm = "ImpactLeavesPalm";
			Hit_Foliage_Pine = "ImpactLeavesPine";
			hitFoliage = "ImpactLeaves";
			hitGlass = "ImpactGlass";
			hitGlassArmored = "ImpactGlassThin";
			hitWood = "ImpactWood";
			hitMetal = "ImpactMetal";
			hitMetalPlate = "ImpactMetal";
			hitBuilding = "ImpactPlaster";
			hitPlastic = "ImpactPlastic";
			hitRubber = "ImpactRubber";
			hitConcrete = "ImpactConcrete";
			hitMan = "ImpactEffectsBlood";
			hitGroundSoft = "ImpactEffectsSmall";
			hitGroundHard = "ImpactEffectsHardGround";
			hitWater = "ImpactEffectsWater";
		};
	};

	class BP_ThrowingKnife: bp_throwable
	{
		hit = 10.50000;
		typicalspeed = 20;
		model = "\breakingpoint\models\bp_knife.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Knife1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Knife2.wav", 1.584893, 1, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 4;
			duration = 3;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 50;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 2;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_InfectedNeedle: bp_throwable
	{
		model = "\breakingpoint\models\bp_morphine2.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 1;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 1;
			MedicalChance = 100;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 100;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 1; // 0 - Disabled / 1 - Enabled
			InfectionChance = 1; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Book1: bp_throwable
	{
		model = "\breakingpoint\models\bp_book1.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 1;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 10;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 0;
			BleedingChance = 0;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Book2: bp_throwable
	{
		model = "\breakingpoint\models\bp_book2.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 1;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 10;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 0;
			BleedingChance = 0;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Book3: bp_throwable
	{
		model = "\breakingpoint\models\bp_book3.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 1;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 10;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 0;
			BleedingChance = 0;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Mug: bp_throwable
	{
		model = "\breakingpoint\models\bp_mug.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 2;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 25;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 0;
			BleedingChance = 10;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Brick1: bp_throwable
	{
		hit = 7.450000;
		legFracture = true;
		model = "\breakingpoint\models\bp_brick1.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Brick1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Crowbar1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 6;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 85;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 2;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Brick2: bp_throwable
	{
		hit = 7.750000;
		legFracture = true;
		model = "\breakingpoint\models\bp_brick2.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Brick1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Crowbar1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 8;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 85;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 2;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Pottery: bp_throwable
	{
		model = "\breakingpoint\models\bp_pottery.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Brick1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Crowbar1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 1;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 25;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 0;
			BleedingChance = 10;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Videotape: bp_throwable
	{
		model = "\breakingpoint\models\bp_videotape.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 5;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 0;
			BleedingChance = 10;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_ZipDisk: bp_throwable
	{
		model = "\breakingpoint\models\bp_zipdisk.p3d";
        soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Generic1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 5;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 0;
			BleedingChance = 10;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Rock: bp_throwable
	{
		hit = 4.750000;
		model = "\breakingpoint\models\bp_rock.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Brick1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Crowbar1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 4;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 65;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Plate1: bp_throwable
	{
		hit = 2.750000;
		model = "\breakingpoint\models\bp_plate1.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Brick1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Crowbar1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 3;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 50;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Plate2: bp_throwable
	{
		hit = 3.750000;
		model = "\breakingpoint\models\bp_plate2.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Brick1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Crowbar1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 3;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 50;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_TennisBall: bp_throwable
	{
		model = "\breakingpoint\models\bp_tennisball.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Tennis1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Tennis1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 5;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 95;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_EmptyCan: bp_throwable
	{
		hit = 0.750000;
		model = "\breakingpoint\models\bp_canempty.p3d";
		class CamShakeHit
		{
			power = 2;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 50;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_HammerTime: bp_throwable
	{
		hit = 7.750000;
		model = "\breakingpoint\models\bp_hammer.p3d";
		soundHitBody1[] = {"\breakingpoint_jsrs\sounds\Brick1.wav", 1.584893, 1, 10};
		soundHitBody2[] = {"\breakingpoint_jsrs\sounds\Crowbar1.wav", 1.584893, 0.8, 10};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		class CamShakeHit
		{
			power = 5;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 95;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 2;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_AlarmClock_Ammo: bp_throwable
	{
		model = "\breakingpoint_weapons\models\AlarmClock\BP_AlarmClock.p3d";
		hit = 0;
		indirectHit = 0;
		indirectHitRange = 0;
		explosive = 0;
		explosionEffectsRadius = 0;
		typicalspeed = 60;
		deflecting = 15;
		cost = 40;
		simulation = "shotShell";
		simulationStep = 0.05;
		shadow = 1;
		soundHit[] = {};
		soundHit1[] = {"breakingpoint_sfx\effects\AlarmClock1.ogg",10.5022777,1,50};
		soundHit2[] = {};
		soundHit3[] = {};
		multiSoundHit[] = {"soundHit1",1};
		soundFly[] = {"",0.1,1,20};
		soundEngine[] = {"",1,1};
		explosionSoundEffect = "";
		CraterEffects = "NoCrater";
		CraterWaterEffects = "ImpactGlassThin";
		explosionEffects = "NoExplosion";
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		whistleDist = 0;
		explosionTime = 5;
		timeToLive = 50;
		class CamShakeExplode{};
		class CamShakeHit
		{
			power = 2;
			duration = 1;
			frequency = 20;
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 0; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 5;
			MedicalChance = 50;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class Melee : BulletBase
	{
		timeToLive = 0.05;
		typicalSpeed = 70;
		airFriction = -0.00001;
		proxyShape = "";
		explosive = 0;
		cartridge = "";
		simulation = "shotRocket";
		model = "\A3\Weapons_F\empty.p3d";
		muzzleEffect = "";
		soundFly[] = {"", 0, 1};
		soundEngine[] = {"", 0, 1};
		visibleFire = 0.1;	// how much is visible when this weapon is fired
		audibleFire = 0.01;
		caliber = 0.22000;
		visibleFireTime = 0;	// how long is it visible
		maxControlRange = 1;	// max range for manual control, 0 = no control (passive weapon)
		soundDefault1[] = {};
		soundDefault2[] = {};
		soundDefault3[] = {};
		soundDefault4[] = {};
		soundDefault5[] = {};
		soundHitBody1[] = {};
		soundHitBody2[] = {};
		soundConcrete1[] = {};
		soundConcrete2[] = {};
		soundConcrete3[] = {};
		soundGlass1[] = {"A3\sounds_f\weapons\hits\glass_5", 1.812538, 1, 100};
		soundGlass2[] = {"A3\sounds_f\weapons\hits\glass_6", 1.812538, 1, 100};
		soundGlass3[] = {"A3\sounds_f\weapons\hits\glass_arm_6", 1.858925, 1, 10};
		soundGlass4[] = {"A3\sounds_f\weapons\hits\glass_arm_7", 1.858925, 1, 10};
		soundGroundHard1[] = {};
		soundGroundHard2[] = {};
		soundRubber1[] = {"A3\sounds_f\weapons\hits\tyre_4", 0.891251, 1, 10};
		soundRubber2[] = {"A3\sounds_f\weapons\hits\tyre_7", 0.891251, 1, 10};
		soundWater1[] = {"A3\sounds_f\weapons\hits\water_4", 1.000000, 1, 10};
		bulletFly1[] = {"", 0.000008, 1, 30};
		bulletFly2[] = {"", 0.794328, 1, 30};
		bulletFly3[] = {"", 0.794328, 1, 30};
		bulletFly4[] = {"", 0.794328, 1, 30};
		bulletFly5[] = {"", 0.794328, 1, 30};
		bulletFly6[] = {"", 0.794328, 1, 30};
		bulletFly7[] = {"", 0.794328, 1, 30};
		bulletFly8[] = {"", 0.794328, 1, 30};
		bulletFly[] = {"bulletFly1", 0.166000, "bulletFly2", 0.166000, "bulletFly3", 0.166000, "bulletFly4", 0.166000, "bulletFly5", 0.166000, "bulletFly6", 0.167000, "bulletFly7", 0.166000, "bulletFly8", 0.167000};
		hitDefault[] = {"soundDefault1", 0.200000, "soundDefault2", 0.200000, "soundDefault3", 0.200000, "soundDefault4", 0.200000, "soundDefault5", 0.200000};
		hitGlass[] = {"soundGlass1", 0.4000000, "soundGlass2", 0.400000, "soundGlass3", 0.100000, "soundGlass4", 0.100000};
		hitGroundHard[] = {"soundGroundHard1", 0.600000, "soundGroundHard2", 0.400000};
		hitConcrete[] = {"soundConcrete1", 0.33000, "soundConcrete2", 0.33000, "soundConcrete3", 0.34000};
		hitRubber[] = {"soundRubber1", 0.600000, "soundRubber2", 0.4000000};
		hitWater[] = {"soundWater1", 0.125000};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		supersonicCrackNear[] = {"", 0.354813, 1, 10};
		supersonicCrackFar[] = {"", 0.281838, 1, 10};
		cost = 0.01;
		deflecting = 0;
		effectsMissileInit = "";
		effectsMissile = "EmptyEffect";
		effectsSmoke = "";
		explosionEffects = "";
		craterEffects = "";
		class HitEffects
		{
			Hit_Foliage_green = "ImpactLeavesGreen";
			Hit_Foliage_Dead = "ImpactLeavesDead";
			Hit_Foliage_Green_big = "ImpactLeavesGreenBig";
			Hit_Foliage_Palm = "ImpactLeavesPalm";
			Hit_Foliage_Pine = "ImpactLeavesPine";
			hitFoliage = "";
			hitGlass = "ImpactGlass";
			hitGlassArmored = "ImpactGlassThin";
			hitWood = "ImpactWood";
			hitMetal = "ImpactMetal";
			hitMetalPlate = "ImpactMetal";
			hitBuilding = "ImpactPlaster";
			hitPlastic = "ImpactPlastic";
			hitRubber = "ImpactRubber";
			hitConcrete = "ImpactConcrete";
			hitMan = "ImpactEffectsBlood";
			hitGroundSoft = "";
			hitGroundHard = "";
			hitWater = "ImpactEffectsWater";
			default_mat = "";
		};
	};

	class BP_Stab : BulletBase
	{
		hit = 5;
		//indirectHit = 10;
		//indirectHitRange = 1;
		explosive = "false";
		timeToLive = 0.05;
		typicalSpeed = 70;
		airFriction = -0.00001;
		soundFly[] = {"", 0, 1};
		soundEngine[] = {"", 0, 1};
		visibleFire = 0.1;	// how much is visible when this weapon is fired
		audibleFire = 0.01;
		caliber = 0.22000;
		visibleFireTime = 0;	// how long is it visible
		maxControlRange = 1;	// max range for manual control, 0 = no control (passive weapon)
		soundDefault1[] = {};
		soundDefault2[] = {};
		soundDefault3[] = {};
		soundDefault4[] = {};
		soundDefault5[] = {};
		soundHitBody1[] = {};
		soundHitBody2[] = {};
		soundConcrete1[] = {};
		soundConcrete2[] = {};
		soundConcrete3[] = {};
		soundGlass1[] = {"A3\sounds_f\weapons\hits\glass_5", 1.812538, 1, 10};
		soundGlass2[] = {"A3\sounds_f\weapons\hits\glass_6", 1.812538, 1, 10};
		soundGlass3[] = {"A3\sounds_f\weapons\hits\glass_arm_6", 1.858925, 1, 10};
		soundGlass4[] = {"A3\sounds_f\weapons\hits\glass_arm_7", 1.858925, 1, 10};
		soundGroundHard1[] = {};
		soundGroundHard2[] = {};
		soundRubber1[] = {"A3\sounds_f\weapons\hits\tyre_4", 0.891251, 1, 10};
		soundRubber2[] = {"A3\sounds_f\weapons\hits\tyre_7", 0.891251, 1, 10};
		soundWater1[] = {"A3\sounds_f\weapons\hits\water_4", 1.000000, 1, 10};
		hitDefault[] = {"soundDefault1", 0.200000, "soundDefault2", 0.200000, "soundDefault3", 0.200000, "soundDefault4", 0.200000, "soundDefault5", 0.200000};
		hitGlass[] = {"soundGlass1", 0.4000000, "soundGlass2", 0.400000, "soundGlass3", 0.100000, "soundGlass4", 0.100000};
		hitGroundHard[] = {"soundGroundHard1", 0.600000, "soundGroundHard2", 0.400000};
		hitConcrete[] = {"soundConcrete1", 0.33000, "soundConcrete2", 0.33000, "soundConcrete3", 0.34000};
		hitRubber[] = {"soundRubber1", 0.600000, "soundRubber2", 0.4000000};
		hitWater[] = {"soundWater1", 0.125000};
		hitMan[] = {"soundHitBody1", 0.500000, "soundHitBody2", 0.500000};
		supersonicCrackNear[] = {"", 0, 0, 0};
		supersonicCrackFar[] = {"", 0, 0, 0};
		deflecting = 0;
		explosionEffects = "ImpactBlood";
		craterEffects = "ImpactEffectsBlood";
		model = "\A3\Weapons_F\empty.p3d";
		class HitEffects
		{
			Hit_Foliage_green = "ImpactLeavesGreen";
			Hit_Foliage_Dead = "ImpactLeavesDead";
			Hit_Foliage_Green_big = "ImpactLeavesGreenBig";
			Hit_Foliage_Palm = "ImpactLeavesPalm";
			Hit_Foliage_Pine = "ImpactLeavesPine";
			hitFoliage = "";
			hitGlass = "ImpactGlass";
			hitGlassArmored = "ImpactGlassThin";
			hitWood = "ImpactWood";
			hitMetal = "ImpactMetal";
			hitMetalPlate = "ImpactMetal";
			hitBuilding = "ImpactPlaster";
			hitPlastic = "ImpactPlastic";
			hitRubber = "ImpactRubber";
			hitConcrete = "ImpactConcrete";
			hitMan = "ImpactEffectsBlood";
			hitGroundSoft = "";
			hitGroundHard = "";
			hitWater = "ImpactEffectsWater";
			default_mat = "";
		};
	};

	class BP_Hatchet_Swing_Ammo : Melee
	{
		hit = 10;
		typicalSpeed = 85;
		timeToLive = 0.020;
		airFriction = -0.000001;
		soundFly[] = {"", 0, 1};
		soundEngine[] = {"", 0, 1};
		visibleFire = 0.1;	// how much is visible when this weapon is fired
		audibleFire = 0.01;
		caliber = 1.00000;
		deflecting = 0;
		model = "\A3\Weapons_F\empty.p3d";
		class Melee
		{
			damageHit = 0.35; // Hit Damage (Zombies)
			damageBlood = 3500; // Blood Damage (Players)
			anim = "GestureSwing";
			radius = 2.5; //Radius In Meters Of Targets
			angle = 50; //Angle Of Hit Detection
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.384893, 1, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.184893, 0.7, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.284893, 1.1, 10}
			};
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 80;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 3;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Katana_Swing_Ammo : Melee
	{
		hit = 12;
		typicalSpeed = 85;
		//explosive = 1;
		//explosionTime = 0.1;
		timeToLive = 0.020;
		airFriction = -0.000001;
		soundFly[] = {"", 0, 1};
		soundEngine[] = {"", 0, 1};
		visibleFire = 0.1;	// how much is visible when this weapon is fired
		audibleFire = 0.01;
		caliber = 1.70000;
		model = "\A3\Weapons_F\empty.p3d";
		class Melee
		{
			damageHit = 0.7; // Hit Damage (Zombies)
			damageBlood = 4700; // Blood Damage (Players)
			anim = "GestureSwing3";
			radius = 2.2; //Radius In Meters Of Targets
			angle = 82; //Angle Of Hit Detection
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.284893, 1, 10},
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.184893, 1.1, 10},
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.584893, 0.8, 10}
			};

		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 4;
			MedicalChance = 70;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 3;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Pickaxe_Swing_Ammo : Melee
	{
		hit = 10;
		typicalSpeed = 85;
		timeToLive = 0.020;
		airFriction = -0.000001;
		soundFly[] = {"", 0, 1};
		soundEngine[] = {"", 0, 1};
		visibleFire = 0.1;	// how much is visible when this weapon is fired
		audibleFire = 0.01;
		caliber = 1.52000;
		legFracture = false;
		deflecting = 0;
		explosionEffects = "";
		craterEffects = "";
		model = "\A3\Weapons_F\empty.p3d";
		class Melee
		{
			damageHit = 0.5; // Hit Damage (Zombies)
			damageBlood = 4500; // Blood Damage (Players)
			anim = "GestureSwing2";
			radius = 2.4; //Radius In Meters Of Targets
			angle = 50; //Angle Of Hit Detection
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.284893, 1, 10},
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.184893, 1.1, 10},
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.584893, 0.8, 10}
			};
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 70;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 3;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Hammer_Swing_Ammo : Melee
	{
		hit = 10;
		typicalSpeed = 85;
		//explosive = 1;
		//explosionTime = 0.1;
		timeToLive = 0.020;
		airFriction = -0.000001;
		soundFly[] = {"", 0, 1};
		soundEngine[] = {"", 0, 1};
		visibleFire = 0.1;	// how much is visible when this weapon is fired
		audibleFire = 0.02;
		caliber = 1.52000;
		legFracture = true;
		explosionEffects = "";
		craterEffects = "";
		model = "\A3\Weapons_F\empty.p3d";
		class Melee
		{
			damageHit = 0.8; // Hit Damage (Zombies)
			damageBlood = 4000; // Blood Damage (Players)
			anim = "GestureSwing2";
			radius = 2.7; //Radius In Meters Of Targets
			angle = 60; //Angle Of Hit Detection
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.384893, 1, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.184893, 0.7, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.284893, 1.1, 10}
			};
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 1;
			MedicalChance = 95;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Shovel_Swing_Ammo: Melee
	{
		hit = 10;
		typicalSpeed = 85;
		timeToLive = 0.02;
		airFriction = -0.00001;
		soundFly[] = {"",0,1};
		soundEngine[] = {"",0,1};
		visibleFire = 0.1;
		audibleFire = 0.02;
		caliber = 0.9;
		legFracture = 0;
		deflecting = 0;
		explosionEffects = "";
		craterEffects = "";
		model = "\A3\Weapons_F\empty.p3d";
		class Melee
		{
			damageHit = 0.8;
			damageBlood = 2850;
			anim = "GestureSwing2";
			radius = 2.5;
			angle = 70;
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.384893, 1, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.184893, 0.7, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.284893, 1.1, 10}
			};
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 45;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 2;
			BleedingChance = 60;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Hammer_Swing_Ammo2 : Melee
	{
		hit = 15;
		typicalSpeed = 85;
		timeToLive = 0.020;
		airFriction = -0.000001;
		soundFly[] = {"", 0, 1};
		soundEngine[] = {"", 0, 1};
		visibleFire = 0.1;	// how much is visible when this weapon is fired
		audibleFire = 0.02;
		caliber = 1.52000;
		legFracture = true;
		explosionEffects = "";
		craterEffects = "";
		model = "\A3\Weapons_F\empty.p3d";
		class Melee
		{
			damageHit = 1; // Hit Damage (Zombies)
			damageBlood = 5000; // Blood Damage (Players)
			anim = "GestureSwing2";
			radius = 2.7; //Radius In Meters Of Targets
			angle = 65; //Angle Of Hit Detection
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.384893, 1, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.184893, 0.7, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.284893, 1.1, 10}
			};
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 85;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 3;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};

	class BP_Rifle_Melee : BP_Stab
	{
		hit = 4;
		explosive = "false";
		simulation = "shotShell";
		timeToLive = 0.015;
		class Melee
		{
			damageHit = 0.5; // Hit Damage (Zombies)
			damageBlood = 1000; // Blood Damage (Players)
			anim = "GestureMelee";
			radius = 2.2; //Radius In Meters Of Targets
			angle = 55; //Angle Of Hit Detection
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.084893, 1, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 1.184893, 0.7, 10},
				{"breakingpoint_jsrs\sounds\Hatchet1.wav", 0.884893, 1.1, 10}
			};
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 2;
			MedicalChance = 70;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 1;
			BleedingChance = 30;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};
	class BP_Bayonet : BP_Stab
	{
		hit = 6;
		explosive = "false";
		simulation = "shotShell";
		timeToLive = 0.015;
		class Melee
		{
			damageHit = 0.6; // Hit Damage (Zombies)
			damageBlood = 2000; // Blood Damage (Players)
			anim = "GestureStab";
			radius = 2.2; //Radius In Meters Of Targets
			angle = 35; //Angle Of Hit Detection
			sounds[] =
			{
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.284893, 1, 10},
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.184893, 1.1, 10},
				{"breakingpoint_jsrs\sounds\Machete1.wav", 1.584893, 0.8, 10}
			};
		};
		class Medical
		{
			//Instant Bleeding (Bullet will always make you bleed on impact)
			InstantBleeding = 1; // 0 - Disabled / 1 - Enabled

			//Medical State Level (Bullet Hit will always put you in this state)
			// 0 - None / 1 - Pain / 2 - Small Bandage / 3 - Field Dressing / 4 - Surgery Kit
			MedicalState = 3;
			MedicalChance = 60;

			// Bleeding Level (Rate of blood loss)
			// 0 - 30bps / 1 - 50bps / 2 - 75bps / 3 - 100bps
			BleedingLevel = 3;
			BleedingChance = 50;

			// Infection (Bullet Wound Chance Of Infection)
			Infection = 0; // 0 - Disabled / 1 - Enabled
			InfectionChance = 0; //Between 0.1 -> 1.0

			// Knockout (Bullet Wound Chance Of Knockout)
			Knockout = 0; // 0 - Disabled / 1 - Enabled
			KnockoutChance = 0; //Between 0.1 -> 1.0

			//Blood Damage Scale
			scale = 0;
		};
	};
};