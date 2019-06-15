

sleep 5;

[(format["UPDATE valor_settings SET varvalue='%1' WHERE varname='COP_BANK'",(save_object getvariable["COP_BANK",0])]),1] call valor_fnc_db_sync;