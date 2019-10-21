private ["_base_box_classname","_objs","_var","_box","_config_id","_range"];


_base_box_classname = getarray(missionConfigFile >> "Valor_settings" >> "bases" >> "base_box_classnames");
if(_base_box_classname isEqualTo []) exitWith {};
_objs = [];
{
    _objs = _objs + allMissionObjects _x;
} foreach _base_box_classname;

{
    _var = _x getVariable["valor_base_ids",[-1,-1,-1]];
    if!(_var isEqualTo [-1,-1,-1]) then {
        _box = _x;
        _config_id = _var select 1;
        _range = (([_config_id,0] call valor_fnc_base_config) select 2) select 0;
        {
            _x hideObject true;
        } foreach (nearestTerrainObjects[_box,["TREE","SMALL TREE","BUSH"],_range]);
    };
} foreach _objs;