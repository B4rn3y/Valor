
private ["_requester","_classname","_stock","_price","_shop","_cop","_query"];
_requester = param[0,objNull,[objnull]];
_classname = param[1,"",[""]];
_stock = param[2,0,[0]];
_price = param[3,-1,[-1]];
_shop = param[4,"survivor_city",["",[]]];
_cop = param[5,false,[false]];

if(_classname isEqualTo "" || _price isEqualTo -1 || isnull _requester) exitWith {};
_query = "";
if(_cop) then {
	_query = format["Insert into item_shop (classname,price,stock,seller,cop) VALUES ('%1','%2','%3','%4','%5')",(str _classname),_price,_stock,[_shop],1];
} else {
	_query = format["Insert into item_shop (classname,price,stock,seller,cop) VALUES ('%1','%2','%3','%4','%5')",(str _classname),_price,_stock,[_shop],0];
};
[_query,1] call valor_fnc_db_sync;



