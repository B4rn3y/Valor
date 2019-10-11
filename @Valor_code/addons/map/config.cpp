class CfgPatches
{
	class ChernarusReduxValor
	{
		units[]=
		{
			"ChernarusRedux"
		};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Map_Altis"
		};
	};
};
class CfgWorlds
{
	class CAWorld;
	class ChernarusRedux: CAWorld
	{
		description="ChernarusReduxValor";
		class Sea
		{
			MaxTide=8;
		};
	};
};

class CfgMarkerClasses
{
	class valor_markers_hide
	{
		displayName="Valor Markers (HIDER)";
	};
};

class CfgMarkers
{
	class CloudHider
	{
		name="CloudHider";
		icon="\map\icons\clouds.paa";
		color[]={1,1,1,1};
		size=32;
		scope=2;
		scopeCurator=2;
		shadow=1;
		markerClass="valor_markers_hide";
	};
};