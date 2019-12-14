_animal = param [0,objNull,[objNull]];
if(isNull _animal)exitWith{systemChat "Valor Error :: Animal is null";};

_vehicles = (nearestObjects[player,["Landvehicle","Air","Ship"],16]) select {alive _x && ((locked _x) < 2)} apply {[_x distance player,_x]};	// [[4,car1],[10,car2],[30,car3]]
if(_vehicles isEqualTo [])exitWith{["No vehicle available"] spawn valor_fnc_exp_hint;};
_car = (selectMin _vehicles) # 1;

_availableSeatIndexes = (fullCrew [_car, "cargo", true]) - (fullCrew [_car, "cargo", false]) apply {_x#2};

_availableSeats = 
((selectionNames cursorObject) select {
	_x find "proxy" > -1 && _x find "cargo" > -1
}) apply {
	// convert "proxy:\ca\temp\proxies\truck\cargo01.013" to 12
	_ar = _x splitString ".";
 	_seatIndex = (parseNumber (_ar #(count _ar - 1))) - 1;
 	[_seatIndex,_x]; 	
} select {
	(_x#0 in _availableSeatIndexes) && ! (_car lockedCargo (_x#0));
};

if(_availableSeats isEqualTo [])exitWith{["No free seat available"] spawn valor_fnc_exp_hint;};

_car lockCargo [_availableSeats#0#0, true];
_animal attachTo [_car,(_car selectionPosition (_availableSeats#0#1)) vectoradd [0,0.7,-0.2]];
_availableSeats;