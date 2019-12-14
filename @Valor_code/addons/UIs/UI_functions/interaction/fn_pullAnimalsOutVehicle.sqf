_car = param [0,objNull,[objNull]];
if(isNull _car)exitWith{["No vehicle to pull out animals"] spawn valor_fnc_exp_hint;};
if(abs(speed _car) > .2)exitWith{["Vehicle has to stand still"] spawn valor_fnc_exp_hint;};
_animals = (attachedObjects _car) select {(typeOf _x) in (getArray(missionConfigFile >> "Valor_settings" >> "animals" >> "availableAnimals"))};
if(_animals isEqualTo [])exitWith{["No animals to pull out"] spawn valor_fnc_exp_hint;};
_animals apply {
	detach _x; 
	_x setPosASL (_car modelToWorldWorld [3,0,0])
};