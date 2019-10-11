//this is for reenabling the stuff. Soory Allesio
class CfgPatches{
	class Not_Alessio_Base{
		units[]={"Not_Alessio_Base"};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]={"A3_UI_F"};
	};
};
/*
delete RscDisplayFunctionsViewer;
delete RscDisplayDebugPublic;
delete RscDisplayDebug;
delete RscDisplayConfigViewer;
*/




class RscText;
class RscStructuredText;
class RscEdit;
class RscControlsGroup;
class RscButtonSearch;
class RscButtonMenu;
class RscCombo;
class RscFrame;
class RscListBox;
class RscTree;
class RscHTML;
class RscButtonMenuCancel;
class RscButtonMenuOK;

class RscControlsGroupNoScrollbars;

class RscDebugConsole;
class CA_Title;
class RscPicture;

class VScrollbar;
class HScrollbar;

class RscDisplayDebug
{
	idd=56;
	movingEnable=1;
	scriptName="RscDisplayDebug";
	scriptPath="GUI";
	onLoad="[""onLoad"",_this,""RscDisplayDebug"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload="[""onUnload"",_this,""RscDisplayDebug"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	scriptIsInternal=1;
	class controlsBackground
	{
		class Background: RscText
		{
			x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="2.1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + safezoneY";
			w="30 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="safezoneH - 4.2 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			colorBackground[]={0,0,0,0.69999999};
		};
		class Title: RscText
		{
			x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + safezoneY";
			w="30 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			colorBackground[]={0,0,0,1};
			moving=1;
		};
	};
	class Controls
	{
		delete Background1;
		delete Background2;
		delete Title;
		delete G_But;
		delete G_Log;
		delete Text_Script1;
		delete B_Script1;
		delete B_Script2;
		delete B_Script3;
		delete B_Script4;
		delete B_Script5;
		class CA_Title: RscStructuredText
		{
			y="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + safezoneY";
			idc=11838;
			text="$STR_UI_DEBUG_TITLE";
			x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			w="9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
		};
		class CA_Version: RscEdit
		{
			style="0x01 + 0x200";
			y="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + safezoneY";
			font="EtelkaMonospacePro";
			idc=12146;
			x="25.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			w="5.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			sizeEx="0.55 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
		};
		class CA_Player: RscEdit
		{
			style=512;
			font="RobotoCondensedBold";
			y="1.25 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + safezoneY";
			idc=12145;
			x="18.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			w="7 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			sizeEx="0.55 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
		};
		class G_Expression: RscControlsGroup
		{
			y="2 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + safezoneY";
			h="3 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + (safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			idc=13035;
			x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			w="25 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			class controls
			{
				delete B_Apply;
				class SearchExpression: RscEdit
				{
					idc=161;
					font="EtelkaMonospacePro";
					x="12.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="11 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					sizeEx="0.53 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class SearchButtonExpression: RscButtonSearch
				{
					idc=162;
					x="23.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class HistoryExpression: RscCombo
				{
					idc=163;
					font="EtelkaMonospacePro";
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="12 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					sizeEx="0.53 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class TextExpression: RscText
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					idc=11736;
					text="$STR_UI_DEBUG_EXPRESSION";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="23.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueExpression: RscEdit
				{
					idc=101;
					style=16;
					autocomplete="scripting";
					shadow=0;
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + (safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
					font="EtelkaMonospacePro";
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="1.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="24 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					colorBackground[]={0,0,0,0};
					sizeEx="0.53 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
			};
		};
		class G_Watch: G_Expression
		{
			idc=13038;
			x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="4.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="25 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="6.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			class controls
			{
				class ValueExp1: RscEdit
				{
					idc=121;
					autocomplete="scripting";
					shadow=0;
					font="EtelkaMonospacePro";
					x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="23.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					sizeEx="0.53 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueRes1: RscEdit
				{
					idc=141;
					autocomplete="scripting";
					lineSpacing=1;
					style=16;
					shadow=0;
					font="EtelkaMonospacePro";
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="24 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					colorBackground[]={0,0,0,0.75};
					sizeEx="0.53 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueExp2: ValueExp1
				{
					idc=122;
					x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="2 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="23.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueRes2: ValueRes1
				{
					idc=142;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="2.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="24 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueExp3: ValueExp1
				{
					idc=123;
					x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="3.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="23.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueRes3: ValueRes1
				{
					idc=143;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="4 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="24 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueExp4: ValueExp1
				{
					idc=124;
					x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="23.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class ValueRes4: ValueRes1
				{
					idc=144;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="5.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="24 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class TextVar1: RscText
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					idc=11737;
					text="$STR_UI_DEBUG_1";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.500001 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class TextVar2: TextVar1
				{
					idc=11738;
					text="$STR_UI_DEBUG_2";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="2 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class TextVar3: TextVar1
				{
					idc=11739;
					text="$STR_UI_DEBUG_3";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="3.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class TextVar4: TextVar1
				{
					idc=11740;
					text="$STR_UI_DEBUG_4";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class TextWatch: RscText
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					idc=11741;
					text="$STR_UI_DEBUG_WATCH";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="11.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
			};
		};
		class B_Apply: RscButtonMenu
		{
			idc=102;
			shortcuts[]=
			{
				"0x00050000 + 2",
				"512 + 0x1C",
				"512 + 0x9C"
			};
			text="$STR_UI_DEBUG_BUT_APPLY";
			x="21 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="18 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="4.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + Enter";
		};
		class B_OK: RscButtonMenu
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			text="$STR_DISP_OK";
			x="26 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="18 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Enter";
		};
		class B_Cancel: RscButtonMenu
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_CANCEL";
			x="1 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="18 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="9.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Escape";
		};
		class B_Camera: RscButtonMenu
		{
			action="cameraOn spawn bis_fnc_cameraOld;";
			onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2";
			text="<img image='\A3\ui_f\data\igui\cfg\islandmap\iconcamera_ca.paa' size='0.7' /> Camera";
			shortcuts[]=
			{
				"512 + 0x12"
			};
			idc=13155;
			x="11 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="18 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="4.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + E";
		};
		class B_CameraNew: RscButtonMenu
		{
			action="[] call bis_fnc_camera;";
			onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2";
			shortcuts[]=
			{
				"512 + 0x12"
			};
			idc=13142;
			text="Splendid Cam";
			x="16 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="18 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="4.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + E";
		};
		class FrameLog: RscFrame
		{
			idc=12537;
			x="11.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="11.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="14 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="6 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
		};
		class ValueLogFilter: RscEdit
		{
			idc=152;
			sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x="11.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="11.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="14 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
		};
		class ValueLog: RscListBox
		{
			idc=103;
			sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x="11.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="12 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="14 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="5.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
		};
		class B_Clear: RscButtonMenu
		{
			idc=151;
			size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x=-10;
			y=-10;
			w=0;
			h=0;
			text="Clear";
		};
		class G_Diag: RscControlsGroup
		{
			y="2 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + safezoneY";
			h="9.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + (safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			class VScrollbar: VScrollbar
			{
				width=0;
			};
			class HScrollbar: HScrollbar
			{
				height=0;
			};
			idc=13036;
			x="25.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			w="5.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			class controls
			{
				class DiagListSearch: RscEdit
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					idc=12238;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class DiagList: RscTree
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					h="7.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + (safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
					idcSearch=12238;
					disableSearchHighlight=1;
					colorLines[]={0,0,0,0};
					idc=12236;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
				};
				class DiagButton: RscButtonMenu
				{
					y="8 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + (safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
					shortcuts[]=
					{
						"512 + 0x14"
					};
					idc=13138;
					text="Toggle";
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + T";
				};
				class DiagFrame: RscFrame
				{
					h="8.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + (safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
					idc=12535;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
				};
			};
		};
		class G_Draw: RscControlsGroup
		{
			class VScrollbar: VScrollbar
			{
				width=0;
			};
			class HScrollbar: HScrollbar
			{
				height=0;
			};
			idc=13039;
			x="25.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="11 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="5.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="7 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			class controls
			{
				class DrawText: RscText
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					idc=11748;
					text="diag_drawmode";
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class DrawList: RscTree
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					colorLines[]={0,0,0,0};
					idc=12237;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class DrawButton: RscButtonMenu
				{
					shortcuts[]=
					{
						"512 + 0x20"
					};
					idc=13139;
					text="Draw";
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="5.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + D";
				};
				class DrawFrame: RscFrame
				{
					idc=12536;
					x="0.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="4.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="6 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
			};
		};
		class G_Design: RscControlsGroup
		{
			class VScrollbar: VScrollbar
			{
				width=0;
			};
			class HScrollbar: HScrollbar
			{
				height=0;
			};
			idc=13037;
			x="1.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="11.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="8 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="6 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			class controls
			{
				class DesignHTML: RscHTML
				{
					idc=11735;
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="0 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="7.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="1.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
				};
				class CreateJIRAIssue: RscButtonMenu
				{
					shortcuts[]=
					{
						"512 + 0x24"
					};
					idc=13143;
					text="REPORT ISSUE";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="2 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="7.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					colorBackground[]={0.12548999,0.31372601,0.50588202,1};
					tooltip="Ctrl + J";
				};
				class DebugFlow: RscButtonMenu
				{
					onButtonClick="diag_debugfsm bis_fnc_missionFlow_fsm";
					shortcuts[]=
					{
						"512 + 0x32"
					};
					style=0;
					idc=13140;
					text="FSM";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="3 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="3.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + M";
				};
				class DebugCapture: DebugFlow
				{
					action="diag_captureFrame 30";
					onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2";
					shortcuts[]=
					{
						"512 + 0x19"
					};
					idc=13164;
					text="Capture";
					x="4 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="3 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="3.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + P";
				};
				class DebugGUI: DebugFlow
				{
					action="[] spawn (uinamespace getvariable 'BIS_fnc_GUIeditor');";
					onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2";
					shortcuts[]=
					{
						"512 + 0x16"
					};
					idc=13144;
					text="GUI";
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="4 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="3.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + U";
				};
				class DebugAnim: DebugFlow
				{
					onButtonClick="[] call (uinamespace getvariable 'bis_fnc_animVIewer'); (ctrlParent (_this select 0)) closeDisplay 2";
					shortcuts[]=
					{
						"512 + 0x1E"
					};
					idc=13141;
					text="Anim";
					x="4 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="4 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="3.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + A";
				};
				class DebugConfig: DebugFlow
				{
					action="[] call (uinamespace getvariable 'bis_fnc_configviewer');";
					onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2";
					text="<img image='\A3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_config_ca.paa' size='0.7' /> Config";
					shortcuts[]=
					{
						"512 + 0x22"
					};
					idc=13154;
					x="0 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="3.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + G";
				};
				class DebugFunctions: DebugFlow
				{
					action="[] call (uinamespace getvariable 'bis_fnc_help');";
					onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2";
					text="<img image='\A3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_functions_ca.paa' size='0.7' /> Fnc";
					shortcuts[]=
					{
						"512 + 0x21"
					};
					idc=13145;
					x="4 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					y="5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					w="3.9 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
					h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
					tooltip="Ctrl + F";
				};
			};
		};
		class ButtonScript1: RscButtonMenu
		{
			action="_nil = [] execvm '\A3\@debug\debug1.sqf';";
			shortcuts[]=
			{
				"512 + 0x02"
			};
			class Attributes
			{
				font="RobotoCondensedLight";
				color="#E5E5E5";
				align="center";
				shadow="false";
			};
			idc=13157;
			text="1";
			x="9.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="11.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="2 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + 1 (\A3\@debug\debug1.sqf)";
		};
		class ButtonScript2: ButtonScript1
		{
			action="_nil = [] execvm '\A3\@debug\debug2.sqf';";
			shortcuts[]=
			{
				"512 + 0x03"
			};
			idc=13158;
			text="2";
			x="9.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="12.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="2 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + 2 (\A3\@debug\debug2.sqf)";
		};
		class ButtonScript3: ButtonScript1
		{
			action="_nil = [] execvm '\A3\@debug\debug3.sqf';";
			shortcuts[]=
			{
				"512 + 0x04"
			};
			idc=13159;
			text="3";
			x="9.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="13.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="2 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + 3 (\A3\@debug\debug3.sqf)";
		};
		class ButtonScript4: ButtonScript1
		{
			action="_nil = [] execvm '\A3\@debug\debug4.sqf';";
			shortcuts[]=
			{
				"512 + 0x05"
			};
			idc=13160;
			text="4";
			x="9.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="14.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="2 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + 4 (\A3\@debug\debug4.sqf)";
		};
		class ButtonScript5: ButtonScript1
		{
			action="_nil = [] execvm '\A3\@debug\debug5.sqf';";
			shortcuts[]=
			{
				"512 + 0x06"
			};
			idc=13161;
			text="5";
			x="9.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="15.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="2 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + 5 (\A3\@debug\debug5.sqf)";
		};
		class ButtonScript6: ButtonScript1
		{
			action="_nil = [] execvm '\A3\@debug\debug6.sqf';";
			shortcuts[]=
			{
				"512 + 0x07"
			};
			idc=13163;
			text="6";
			x="9.5 * 					(		((safezoneW / safezoneH) min 1.2) / 32) + 		(safezoneX + (safezoneW - 				((safezoneW / safezoneH) min 1.2))/2)";
			y="16.5 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 		(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))";
			w="2 * 					(		((safezoneW / safezoneH) min 1.2) / 32)";
			h="0.9 * 					(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
			tooltip="Ctrl + 6 (\A3\@debug\debug6.sqf)";
		};
	};
};
class RscDisplayDebugPublic
{
	idd=316000;
	movingEnable=1;
	enableSimulation=0;
	scriptName="RscDisplayDebugPublic";
	scriptPath="GUI";
	onLoad="[""onLoad"",_this,""RscDisplayDebugPublic"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload="[""onUnload"",_this,""RscDisplayDebugPublic"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	class controlsBackground
	{
	};
	class Controls
	{
		class DebugConsole: RscDebugConsole
		{
			x="9 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="22 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="21.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonCancel: RscButtonMenuCancel
		{
			x="9 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="23.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="7.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayFunctionsViewer
{
	scriptName="RscDisplayFunctionsViewer";
	scriptPath="GUI";
	onLoad="[""onLoad"",_this,""RscDisplayFunctionsViewer"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload="[""onUnload"",_this,""RscDisplayFunctionsViewer"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	idd=1321;
	movingEnable=1;
	enableSimulation=0;
	class controls
	{
		class Title: RscText
		{
			colorBackground[]=
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
			};
			w="safezoneW - 2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			moving=1;
			idc="IDC_RSCDISPLAYFUNCTIONSVIEWER_TITLE";
			text="$STR_A3_RscFunctionsViewer_Caption";
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundLeft: RscText
		{
			colorBackground[]={0,0,0,0.69999999};
			h="safezoneH - 4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=1001;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="13.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		};
		class BackgroundRight: RscText
		{
			colorBackground[]={0,0,0,0.69999999};
			h="safezoneH - 4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="safezoneW - 15.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			idc=1002;
			x="14.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
		};
		class BackgroundMeta: RscText
		{
			w="safezoneW - 15.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			idc=1003;
			x="14.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			h="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={0,0,0,1};
		};
		class Sources: RscCombo
		{
			idc=2100;
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx="0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Tags: RscCombo
		{
			idc=2101;
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx="0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Categories: RscCombo
		{
			idc=2102;
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="5.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx="0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Functions: RscListBox
		{
			h="safezoneH - 9.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=1500;
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			sizeEx="0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Name: RscEdit
		{
			sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
			shadow=0;
			w="safezoneW - 15.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			style=512;
			canModify=0;
			idc=1401;
			x="14.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			h="1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Author: RscText
		{
			font="RobotoCondensedLight";
			sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			shadow=0;
			w="safezoneW - 15.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			idc=1005;
			x="14.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="3.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			h="0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={1,1,1,0.5};
		};
		class Preview: RscControlsGroup
		{
			h="safezoneH - 6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="safezoneW - 15.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			idc=2300;
			x="14.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			class controls
			{
				class CodeBackground: RscText
				{
					h="safezoneH - 6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w=4;
					idc="IDC_RSCDISPLAYFUNCTIONSVIEWER_CODEBACKGROUND";
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[]={1,1,1,1};
				};
				class Code: RscEdit
				{
					style="0x00 + 0x10 + 0x200";
					linespacing=1;
					font="EtelkaMonospacePro";
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					canModify=0;
					shadow=0;
					h="safezoneH - 6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w=4;
					idc=1400;
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[]={0,0,0,1};
				};
			};
		};
		class ButtonClose: RscButtonMenuCancel
		{
			y="safezoneY + safezoneH - 1.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text="$STR_DISP_CLOSE";
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			w="6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonRecompileAll: RscButtonMenu
		{
			y="safezoneY + safezoneH - 1.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=2400;
			text="$STR_A3_RscFunctionsViewer_btnRecompileAll";
			x="7.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			w="6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonRecompileSelected: RscButtonMenu
		{
			y="safezoneY + safezoneH - 1.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=2401;
			text="$STR_A3_RscFunctionsViewer_btnRecompileSelected";
			x="13.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			w="6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayConfigViewer
{
	scriptName="RscDisplayConfigViewer";
	scriptPath="GUI";
	onLoad="[""onLoad"",_this,""RscDisplayConfigViewer"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload="[""onUnload"",_this,""RscDisplayConfigViewer"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	idd=2928;
	movingEnable=1;
	enableSimulation=0;
	class controlsBackground
	{
		class TitleBackground: RscText
		{
			idc=-1;
			moving=1;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="SafezoneY + (1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			w="safezoneW - 2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]=
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
			};
		};
		class MainBackground: RscText
		{
			idc=11000;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="SafezoneY + (2.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			w="safezoneW - 2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="SafezoneH - (4.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			colorBackground[]={0,0,0,0.69999999};
		};
	};
	class controls
	{
		class Title: CA_Title
		{
			idc=1000;
			text="$STR_A3_RscDisplayConfigViewer_Title";
			x="2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="37 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class TitleIcon: RscPicture
		{
			idc=1200;
			text="\A3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_config_ca.paa";
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ListClasses: RscListBox
		{
			font="EtelkaMonospacePro";
			h="safezoneH - 4.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorbackground[]={0,0,0,0.5};
			idc=1500;
			x="1.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			sizeEx="0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ListFavorites: ListClasses
		{
			font="RobotoCondensedBold";
			y="safezoneY + safezoneH - 7.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=1502;
			x="1.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			w="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx="0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SearchClasses: RscText
		{
			sizeEx="(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.55";
			font="RobotoCondensedBold";
			idc=1001;
			x="1.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundCustom: RscText
		{
			colorbackground[]={0,0,0,0.5};
			w=0;
			h=0;
			idc=1005;
			x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
		};
		class GroupDefault: RscControlsGroupNoScrollbars
		{
			w="safezoneW - (					((safezoneW / safezoneH) min 1.2) - (40-15.2) * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
			h="safezoneH - 4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=2300;
			x="14 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			class controls
			{
				class ListParams: ListClasses
				{
					w="safezoneW - (					((safezoneW / safezoneH) min 1.2) - (40-15.2) * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
					h="safezoneH - 7.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					idc=1501;
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx="0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class SearchParams: SearchClasses
				{
					sizeEx="(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.55";
					font="RobotoCondensedBold";
					idc=1002;
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="24.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class PathText: RscText
				{
					w="safezoneW - (					((safezoneW / safezoneH) min 1.2) - 16.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
					y="0.75 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneH - 7.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
					idc=1003;
					text="$STR_A3_RscDisplayConfigViewer_PathText";
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx="0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class PathValue: RscEdit
				{
					font="EtelkaMonospacePro";
					shadow=0;
					w="safezoneW - (					((safezoneW / safezoneH) min 1.2) - (40-18.2) * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
					y="0.75 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneH - 7.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
					idc=1400;
					x="3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx="0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ParentsText: RscText
				{
					y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneH - 7.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
					idc=1004;
					text="$STR_A3_RscDisplayConfigViewer_ParentsText";
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					w="3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx="0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ParentsValue: RscEdit
				{
					font="EtelkaMonospacePro";
					shadow=0;
					w="safezoneW - (					((safezoneW / safezoneH) min 1.2) - (40-18.2) * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
					y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneH - 7.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
					idc=1401;
					x="3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx="0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class GroupCustom: RscControlsGroup
		{
			w="safezoneW - (					((safezoneW / safezoneH) min 1.2) - (40-15.2) * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
			h="safezoneH - 4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=2301;
			x="14 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			class controls
			{
				class CustomText: RscStructuredText
				{
					w="safezoneW - (					((safezoneW / safezoneH) min 1.2) - (40-15.2) * 					(			((safezoneW / safezoneH) min 1.2) / 40))";
					idc=1100;
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					h="1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonClose: RscButtonMenuCancel
		{
			y="safezoneY + safezoneH - 2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text="$STR_DISP_CLOSE";
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			w="6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonPreviewClass: RscButtonMenu
		{
			y="safezoneY + safezoneH - 2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=2400;
			text="$STR_A3_RscDisplayConfigViewer_ButtonPreviewClass";
			x="8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			w="11.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonPreviewParam: RscButtonMenu
		{
			y="safezoneY + safezoneH - 2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc=2401;
			text="$STR_A3_RscDisplayConfigViewer_ButtonPreviewParam";
			x="20 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			w="12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonOK: RscButtonMenuOK
		{
			idc=2600;
			x="32.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX)";
			y="23 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY)";
			w="6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};