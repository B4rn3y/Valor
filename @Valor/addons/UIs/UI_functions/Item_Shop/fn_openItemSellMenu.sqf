
// ["U_BG_Guerilla2_1","B_FieldPack_cbr","",["","","",""],[],"",["","","",""],[],"",["","","",""],[],[],"",[],"H_Bandanna_gry","",["ItemMap"],["valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape","valor_ducttape"]]
private ["_display","_header","_listbox","_buy_sell_BTN","_switch_BTN","_classnames","_entry","_ret"];
_display = findDisplay 3007;
if(isnull _display) exitWith {};
_header = _display displayCtrl 1001;
_listbox = _display displayCtrl 1500;
_buy_sell_BTN = _display displayCtrl 2400;
_switch_BTN = _display displayCtrl 2402;
lbClear _listbox;
_listbox lbadd "Loading item prices from server...";



_buy_sell_BTN ctrlSetText "SELL";
_buy_sell_BTN ctrlRemoveAllEventHandlers "ButtonClick";
_buy_sell_BTN ctrlSetEventHandler ["ButtonClick","[] spawn valor_fnc_ItemShop_sell;"];
_listbox ctrlRemoveAllEventHandlers "LBSelChanged";


_classnames = [];
{
	if(typeName _x isEqualTo "STRING") then {
		if!(_x isEqualTo "") then {
			_classnames pushBackUnique _x;
		};
	} else {
		{
			if!(_x isEqualTo "") then {
			_classnames pushBackUnique _x;
		};
		} foreach _x;
	};
} foreach Valor_gear;

if(_classnames isEqualTo []) exitWith {lbClear _listbox;_listbox lbadd "You dont have anything to sell O.o";};

_entry = toArray str _classnames;
_ret = [];
{
	switch (_x) do
	{
		case 91:
		{
			_ret pushBack 40;
		};

		case 93:
		{
			_ret pushBack 41;
		};

		case 34:
		{
			_ret pushBack 39;
		};

		default
		{
			_ret pushBack _x;
		};
	};
} foreach _entry;


_classnames = tostring _ret;








[[_classnames,player],"valor_fnc_Itemshop_sellprice_request",2] call valor_fnc_remoteexec;
//[_classnames,player] remoteExec["valor_fnc_Itemshop_sellprice_request",2];








