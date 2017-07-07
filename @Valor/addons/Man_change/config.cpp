
class CfgPatches
{
	class Man_change
	{
		units[] = {"C_man_w_worker_F","I_Survivor_F","O_Survivor_F","B_Survivor_F"};
		weapons[] = {};
		author[]= {"Barney"};
	};
};


class CfgVehicles
{
	class Man
	{
		extCameraPosition[] = {0, 0, 0};
	};
	class C_man_w_worker_F : Man // civs
	{
		extCameraPosition[] = {0.4, -0.1, -1.2};
	};

	class I_Survivor_F : Man // civs
	{
		extCameraPosition[] = {0.4, -0.1, -1.2};
	};

	class O_Survivor_F : Man // civs
	{
		extCameraPosition[] = {0.4, -0.1, -1.2};
	};
	class B_Survivor_F : Man // civs
	{
		extCameraPosition[] = {0.4, -0.1, -1.2};
	};
};
