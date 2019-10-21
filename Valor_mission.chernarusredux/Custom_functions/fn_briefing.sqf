/*


	player createDiaryRecord ["Info", "Information gathered.<br /><img image='rules.paa' />"];

	player createDiaryRecord ["Diary", ["Intel", "Enemy base is on grid <marker name='enemyBase'>161170</marker>"]]

	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];

*/

waitUntil {!isNull player && player == player};
if(player diarySubjectExists "placeholder")exitwith{};

player createDiarySubject ["placeholder","======================="];

player createDiarySubject ["controls","> Controls"];



player createDiaryRecord ["controls",
	[		"Controls:<br/><br/>
			Left Windows - Interactionkey<br/>
			U - Unlock/Lock vehicles/bases<br/>
			Z - Open Main Menu<br/>
			0 - Lower Sound<br/>
			Shift + H - Holster Weapon<br/>
			Shift + R - Restrain<br/>
			Shift + L - Siren on/off"
	]
];
