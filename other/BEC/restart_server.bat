@echo off
timeout 5
::KILL SERVER
taskkill /f /im arma3server_x64.exe
taskkill /f /im arma3server_x64.exe
taskkill /f /im arma3server_x64.exe
taskkill /f /im BEC.exe
taskkill /f /im BEC.exe
taskkill /f /im BEC.exe

timeout 10
start /min "" "C:\Arma3\A3Server\arma3server_x64.exe" -client -nosound -connect=127.0.0.1 -port=2302 "-mod=@extDB3;@Valor_HC;@[Discontinued]Fox_SurvivalCars;@Advanced Urban Rappelling;@BB Raptors & Zombies & more;@Bloodwyn's hats and masks;@Chernarus Redux;@CUP_Terrains_Core;@CUP_Units;@CUP_Vehicles;@CUP_Weapons;@DS Houses;@Hidden Ghillies;@RHSAFRF;@Valor;@Zombies and Demons;@CBA_A3"

timeout 5

 start /min "" "C:\Arma3\A3Server\arma3server_x64.exe" -cfg=basic.cfg -config=config.cfg -bepath=C:\Arma3\A3Server\battleye -profiles=C:\Arma3\A3Server -autoinit "-servermod=@extDB3;@Valor_Server" "-mod=@[Discontinued]Fox_SurvivalCars;@Advanced Urban Rappelling;@BB Raptors & Zombies & more;@Bloodwyn's hats and masks;@Chernarus Redux;@CUP_Terrains_Core;@CUP_Units;@CUP_Vehicles;@CUP_Weapons;@DS Houses;@Hidden Ghillies;@RHSAFRF;@Valor;@Zombies and Demons;@CBA_A3"

timout 7

start /min "" "C:\Arma3\A3Server\BEC\Bec.exe"

exit