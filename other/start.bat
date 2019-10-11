COLOR 0A
set exe=arma3server_x64.exe
set dir=C:\Arma3\A3Server
set dir2=C:\Arma3\A3Server\battleye\BEC
set mod=@[Discontinued]Fox_SurvivalCars;@Advanced Urban Rappelling;@BB Raptors & Zombies & more;@Bloodwyn's hats and masks;@Chernarus Redux;@CUP_Terrains_Core;@CUP_Units;@CUP_Vehicles;@CUP_Weapons;@DS Houses;@Hidden Ghillies;@RHSAFRF;@Valor;@Zombies and Demons;@CBA_A3
set smod=@extDB3;@Valor_Server
set port=2302
set profiles=profile
set config=config.cfg
set cfg=basic.cfg
set bepath=battleye
echo.
echo KILL server
taskkill /im %exe% /f
timeout 1
taskkill /im %exe% /f
cd "%dir%"
start "" "%exe%" -mod="%mod%" -serverMod="%smod%" -port=%port% -profiles=%profiles% -config=%config% -cfg=%cfg% -bepath=%bepath% -enableHT -loadMissionToMemory -autoInit -noSound
timeout 20
cd "%dir2%"
start "" "Bec"