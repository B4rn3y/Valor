private ["_middle_pos","_distance","_distance_1","_distance_2"];


_middle_pos = param[0,[],[[]]];
_distance = param[1,-1,[0]];



if(_middle_pos isEqualTo [] || _distance isEqualTo -1) exitWith {};
_distance_1 = (_distance / 3) * 2;
_distance_2 = (_distance / 3);

Valor_poising = true;

while {true} do
{
	if(player distance _middle_pos > _distance) exitWith {0 spawn valor_fnc_radiation_lowering;};
	switch (true) do
	{
		case ((player distance _middle_pos) > _distance_1):
		{
			playsound "geiger_level_1";
		};

		case ((player distance _middle_pos) > _distance_2):
		{
			playsound "geiger_level_2";
		};

		default
		{
			playsound "geiger_level_3";
		};

	};
	sleep 3;

	if(Valor_radiation < 100) then {
		Valor_radiation = Valor_radiation + 1;

		switch (Valor_radiation) do
		{
			case 25:
			{
				playsound "cough_0";
			};

			case 50:
			{
				playsound "cough_1";
			};

			case 75:
			{
				0 spawn {
					playsound "cough_0";
					sleep 2;
					playsound "cough_2";
				};
			};

			case 80:
			{
				0 spawn {
					playsound "cough_1";
					sleep 2;
					playsound "cough_0";
				};
			};

			case 85:
			{
				0 spawn {
					playsound "cough_2";
					sleep 2;
					playsound "cough_1";
					sleep 2;
					playsound "cough_0";
				};
			};

			case 90:
			{
				0 spawn {
					playsound "cough_0";
					sleep 2;
					playsound "cough_1";
					sleep 2;
					playsound "cough_2";
				};
			};

			case 95:
			{
				0 spawn {
					playsound "cough_1";
					sleep 2;
					playsound "cough_2";
					sleep 2;
					playsound "cough_0";
				};
			};
		};

	} else {
		if(Valor_alive isEqualTo 1) then {
			player setdamage 1;
		};
	};

};