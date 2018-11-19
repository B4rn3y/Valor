private ["_seller","_display","_header","_listbox"];
closedialog 0;
_seller = param[3,[],["",[],objNull]]; // default in DB "survivor_camp"
if(_seller isEqualTo []) exitWith {systemChat "Valor Error :: No Seller Config specified!"};

valor_intro_cam = "camera" camCreate [0, 0, 0];
valor_intro_cam cameraEffect ["Internal", "BACK"];
valor_intro_cam camSetFocus [-1, -1];
showCinemaBorder false;
valor_intro_cam camCommit 0;
valor_intro_cam camSetTarget [4197.73,7278.64,1.13736];
valor_intro_cam camSetPos [4193.72,7264.33,2.00146484];
valor_intro_cam camCommit 0;

disableSerialization;
if(!createDialog "carshop") exitWith {systemChat "Valor Error :: Could not create the dialog!";valor_intro_cam cameraEffect ["TERMINATE","BACK"];camDestroy valor_intro_cam;};
_display = findDisplay 3003;
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;


_id = _listbox lbAdd "Starting Function";
_listbox lbSetColor[_id,[0.016,0.706,0.016,1]];
_id = _listbox lbAdd "Creating Camera";
_listbox lbSetColor[_id,[0.016,0.706,0.016,1]];
_id = _listbox lbAdd "Creating Dialog";
_listbox lbSetColor[_id,[0.016,0.706,0.016,1]];
_id = _listbox lbAdd "Sending Request to Server";
_listbox lbSetColor[_id,[0.016,0.706,0.016,1]];
_id = _listbox lbAdd "Waiting for Response...";
_listbox lbSetColor[_id,[1,0.502,0,1]];
_id = _listbox lbAdd "Processing Response...";
_listbox lbSetColor[_id,[1,0,0,1]];
_id = _listbox lbAdd "Visualizing data...";
_listbox lbSetColor[_id,[1,0,0,1]];



[_seller,player] remoteExec["valor_fnc_shop_request",2];




waitUntil {isnull(finddisplay 3003)};
valor_intro_cam cameraEffect ["TERMINATE","BACK"];
camDestroy valor_intro_cam;

if!(isnil "Valor_preview_vehicle") then {
	deleteVehicle Valor_preview_vehicle;
	Valor_preview_vehicle = nil;
};
