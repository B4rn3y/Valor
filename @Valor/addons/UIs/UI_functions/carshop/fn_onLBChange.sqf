private ["_display","_header","_listbox","_sel","_config","_classname"];
disableSerialization;
_display = findDisplay 3003;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_sel = lbCurSel _listbox;
if(_sel isEqualTo -1) exitWith {};
_config = _listbox lbdata _sel;
_classname = (call compile _config) select 0;
if(_classname isEqualTo "") exitWith {};
if(isnil "Valor_preview_vehicle") then {
	Valor_preview_vehicle = _classname createVehicleLocal [0,0,0];
	Valor_preview_vehicle setdir 171.278;
	Valor_preview_vehicle setposatl [4197.73,7278.64,0.13736];
} else {
	if((typeOf Valor_preview_vehicle) isEqualTo _classname) exitWith {};
	deleteVehicle Valor_preview_vehicle;
	sleep 0.07;
	Valor_preview_vehicle = _classname createVehicleLocal [0,0,0];
	Valor_preview_vehicle setdir 171.278;
	Valor_preview_vehicle setposatl [4197.73,7278.64,0.13736];
};

