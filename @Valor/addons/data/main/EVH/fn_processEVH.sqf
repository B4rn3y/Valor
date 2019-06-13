



_vendor = param[0,objNull,[objNull]];
_text  = param[1,"",[""]]; // UPP
Vendor = _vendor;
EVHText = _text;
_code = "";

if(isnull _vendor) exitWith {};
Vendor setvariable["percent",0];
switch (true) do
{
	case (typeof Vendor isEqualTo "Land_InfoStand_V1_F"):
	{

		_code = {

		    private ["_obj","_pos","_sPos","_ctrl2","_ctrl","_distance","_perc"];
			_obj = Vendor;
		    _pos = [visiblePosition _obj select 0, visiblePosition _obj select 1, (getPosATL _obj select 2) + 1.5];
		    _sPos = worldToScreen _pos;
		    if!(_sPos isEqualTo []) then {
		    	_sPos = [(_sPos select 0) - 0.15, _sPos select 1];
		    };
		    _ctrl2 = controlNull;
		    _ctrl = controlNull;
		    _distance = (positionCameraToWorld [0,0,0]) distance _obj;

		    if(!(_sPos isEqualTo []) &&  _distance < 6) then {
		        if(isnull ((finddisplay 46) displayctrl 1234)) then {
		            _ctrl = (finddisplay 46) ctrlCreate ["valor_RscProgress", 1234];
		            _ctrl2 = (finddisplay 46) ctrlCreate ["valor_RscStructuredText", 1235];

		        } else {
		            _ctrl = ((finddisplay 46) displayctrl 1234);
		            _ctrl2 = ((finddisplay 46) displayctrl 1235);
		        };

		        _ctrl ctrlSetPosition _sPos;

		        _perc = _obj getvariable["percent",100];
		        _ctrl progressSetPosition (_perc/100);
		        _ctrl2 ctrlSetStructuredText parsetext format["<t size='0.65' align='center'>%1 (%2%3)...</t>",EVHText,round _perc,"%"];
		        _ctrl ctrlCommit 0;
		        _ctrl2 ctrlSetPosition (ctrlPosition _ctrl);
		        _ctrl2 ctrlCommit 0;
		    } else {
			    ctrldelete ((finddisplay 46) displayctrl 1234);
			    ctrldelete ((finddisplay 46) displayctrl 1235);
			};
		};

	};

	case (typeof Vendor isEqualTo "Land_Sink_F"):
	{

		_code = {

		    _obj = Vendor;
		    _pos = [visiblePosition _obj select 0, visiblePosition _obj select 1, (getPosATL _obj select 2) + 1.5];
		    //_pos set[2,1.5];
		    _sPos = worldToScreen _pos;

		    if!(_sPos isEqualTo []) then {
		    	_sPos = [(_sPos select 0) - 0.15, _sPos select 1];
		    };
		    _ctrl2 = controlNull;
		    _ctrl = controlNull;
		    _distance = (positionCameraToWorld [0,0,0]) distance _obj;

		    if(!(_sPos isEqualTo []) &&  _distance < 6) then {
		        if(isnull ((finddisplay 46) displayctrl 1234)) then {
		            _ctrl = (finddisplay 46) ctrlCreate ["valor_RscProgress", 1234];
		            _ctrl2 = (finddisplay 46) ctrlCreate ["valor_RscStructuredText", 1235];

		        } else {
		            _ctrl = ((finddisplay 46) displayctrl 1234);
		            _ctrl2 = ((finddisplay 46) displayctrl 1235);
		        };

		        _ctrl ctrlSetPosition _sPos;


		        _perc = _obj getvariable["percent",0];
		        _ctrl progressSetPosition (_perc/100);
		        _ctrl2 ctrlSetStructuredText parsetext format["<t size='0.65' align='center'>%1 (%2%3)...</t>",EVHText,round _perc,"%"];
		        _ctrl ctrlCommit 0;
		        _ctrl2 ctrlSetPosition (ctrlPosition _ctrl);
		        _ctrl2 ctrlCommit 0;
		    } else {
			    ctrldelete ((finddisplay 46) displayctrl 1234);
			    ctrldelete ((finddisplay 46) displayctrl 1235);
			};
		};
	};


	case (Vendor iskindof "Man"):
	{

		_code = {

			    private ["_obj","_pos","_sPos","_ctrl2","_ctrl","_distance","_perc"];
				_obj = Vendor;
			    _pos = [visiblePosition _obj select 0, visiblePosition _obj select 1, ((_obj modelToWorld (_obj selectionPosition "head")) select 2)+.4];
			    _sPos = worldToScreen _pos;

			    if!(_sPos isEqualTo []) then {
		    		_sPos = [(_sPos select 0) - 0.15, _sPos select 1];
		   		 };
			    _ctrl2 = controlNull;
			    _ctrl = controlNull;
			    _distance = (positionCameraToWorld [0,0,0]) distance _obj;

			    if(!(_sPos isEqualTo []) &&  _distance < 6) then {
			        if(isnull ((finddisplay 46) displayctrl 1234)) then {
			            _ctrl = (finddisplay 46) ctrlCreate ["valor_RscProgress", 1234];
			            _ctrl2 = (finddisplay 46) ctrlCreate ["valor_RscStructuredText", 1235];

			        } else {
			            _ctrl = ((finddisplay 46) displayctrl 1234);
			            _ctrl2 = ((finddisplay 46) displayctrl 1235);
			        };

			        _ctrl ctrlSetPosition _sPos;

			        _perc = _obj getvariable["percent",0];
			        _ctrl progressSetPosition (_perc/100);
			        _ctrl2 ctrlSetStructuredText parsetext format["<t size='0.65' align='center'>%1 (%2%3)...</t>",EVHText,round _perc,"%"];
			        _ctrl ctrlCommit 0;
			        _ctrl2 ctrlSetPosition (ctrlPosition _ctrl);
			        _ctrl2 ctrlCommit 0;
			    } else {
				    ctrldelete ((finddisplay 46) displayctrl 1234);
				    ctrldelete ((finddisplay 46) displayctrl 1235);
				};
			};
	};



	case (typeof Vendor isEqualTo "Land_TableBig_01_F"):
	{

		_code = {

		    private ["_obj","_pos","_sPos","_ctrl2","_ctrl","_distance","_perc"];
			_obj = Vendor;
		    _pos = [visiblePosition _obj select 0, visiblePosition _obj select 1, (getPosATL _obj select 2) + 1.5];
		    _sPos = worldToScreen _pos;

		    if!(_sPos isEqualTo []) then {
		    	_sPos = [(_sPos select 0) - 0.15, _sPos select 1];
		    };
		    _ctrl2 = controlNull;
		    _ctrl = controlNull;
		    _distance = (positionCameraToWorld [0,0,0]) distance _obj;

		    if(!(_sPos isEqualTo []) &&  _distance < 6) then {
		        if(isnull ((finddisplay 46) displayctrl 1234)) then {
		            _ctrl = (finddisplay 46) ctrlCreate ["valor_RscProgress", 1234];
		            _ctrl2 = (finddisplay 46) ctrlCreate ["valor_RscStructuredText", 1235];

		        } else {
		            _ctrl = ((finddisplay 46) displayctrl 1234);
		            _ctrl2 = ((finddisplay 46) displayctrl 1235);
		        };

		        _ctrl ctrlSetPosition _sPos;

		        _perc = _obj getvariable["percent",100];
		        _ctrl progressSetPosition (_perc/100);
		        _ctrl2 ctrlSetStructuredText parsetext format["<t size='0.65' align='center'>%1 (%2%3)...</t>",EVHText,round _perc,"%"];
		        _ctrl ctrlCommit 0;
		        _ctrl2 ctrlSetPosition (ctrlPosition _ctrl);
		        _ctrl2 ctrlCommit 0;
		    } else {
			    ctrldelete ((finddisplay 46) displayctrl 1234);
			    ctrldelete ((finddisplay 46) displayctrl 1235);
			};
		};
	};

	default
	{

		_code = {

		    private ["_obj","_pos","_sPos","_ctrl2","_ctrl","_distance","_perc"];
			_obj = Vendor;
		    _pos = [visiblePosition _obj select 0, visiblePosition _obj select 1, (getPosATL _obj select 2) + 1.5];
		    _sPos = worldToScreen _pos;

		    _sPos = [(_sPos select 0) - 0.15, _sPos select 1];
		    _ctrl2 = controlNull;
		    _ctrl = controlNull;
		    _distance = (positionCameraToWorld [0,0,0]) distance _obj;

		    if(!(_sPos isEqualTo []) &&  _distance < 6) then {
		        if(isnull ((finddisplay 46) displayctrl 1234)) then {
		            _ctrl = (finddisplay 46) ctrlCreate ["valor_RscProgress", 1234];
		            _ctrl2 = (finddisplay 46) ctrlCreate ["valor_RscStructuredText", 1235];

		        } else {
		            _ctrl = ((finddisplay 46) displayctrl 1234);
		            _ctrl2 = ((finddisplay 46) displayctrl 1235);
		        };

		        _ctrl ctrlSetPosition _sPos;

		        _perc = _obj getvariable["percent",100];
		        _ctrl progressSetPosition (_perc/100);
		        _ctrl2 ctrlSetStructuredText parsetext format["<t size='0.65' align='center'>%1 (%2%3)...</t>",EVHText,round _perc,"%"];
		        _ctrl ctrlCommit 0;
		        _ctrl2 ctrlSetPosition (ctrlPosition _ctrl);
		        _ctrl2 ctrlCommit 0;
		    } else {
			    ctrldelete ((finddisplay 46) displayctrl 1234);
			    ctrldelete ((finddisplay 46) displayctrl 1235);
			};
		};

	};
};





_evh_id = addMissionEventHandler ["EachFrame", _code];



waitUntil {isnil "valor_is_processing"};

removeMissionEventHandler["EachFrame",_evh_id];
ctrldelete ((finddisplay 46) displayctrl 1234);
ctrldelete ((finddisplay 46) displayctrl 1235);
Vendor setvariable["percent",nil];

