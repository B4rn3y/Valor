private ["_control","_index","_display","_header","_listbox","_classname"];
_control = _this select 0;
_index = _this select 1;
disableSerialization
_display = findDisplay 3003;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;

_classname = _listbox lbdata _index;

if(isnil "Valor_preview_vehicle") then {
	Valor_preview_vehicle = _classname createVehicleLocal [0,0,0];
	Valor_preview_vehicle setdir 171.278;
	Valor_preview_vehicle setposatl [4197.73,7278.64,0.13736];
} else {
	deleteVehicle Valor_preview_vehicle;
	Valor_preview_vehicle = _classname createVehicleLocal [0,0,0];
	Valor_preview_vehicle setdir 171.278;
	Valor_preview_vehicle setposatl [4197.73,7278.64,0.13736];
};

