_Map_center = [worldSize / 2, worldsize / 2, 0];
_objs_classnames = getarray(missionConfigFile >> "Valor_settings" >> "settings" >> "Objects_refueling");
_objs_classnames pushBack "Land_seno_balik";
if(_objs_classnames isEqualTo []) exitWith {};
VALOR_FUELSTATIONS = nearestObjects[_Map_center,_objs_classnames,worldsize];
publicVariable "VALOR_FUELSTATIONS";
