
_display = findDisplay 3007;
_switch_BTN = _display displayCtrl 2402;

if(isnull _display) exitWith {};
_switch_BTN ctrlEnable false;
if(isnil "Valor_item_shop_sell") then {
	Valor_item_shop_sell = true;
	[nil,nil,nil,VALOR_SELLER_SHOP] spawn valor_fnc_openItemShop;
} else {
	Valor_item_shop_sell = nil;
	[nil,nil,nil,VALOR_SELLER_SHOP] spawn valor_fnc_openItemShop;
};

sleep 5;
_switch_BTN ctrlEnable true;
