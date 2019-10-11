


Valor_poising = false;


while {!Valor_poising} do
{
	sleep 6;
	if(Valor_radiation > 0) then {
		Valor_radiation = Valor_radiation - 1;
	};
	if(Valor_radiation isEqualTo 0) exitWith {};
};