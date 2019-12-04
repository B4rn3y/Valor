class CfgPatches
{
	class ChernarusReduxValor
	{
		units[]=
		{
			"ChernarusReduxValor"
		};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]={"ChernarusRedux_C"};
	};
};
class CfgWorlds
{
	class ChernarusRedux;
	class ChernarusReduxValor: ChernarusRedux
	{
		description="ChernarusReduxValor";
		class Sea
		{
			MaxTide=7;
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