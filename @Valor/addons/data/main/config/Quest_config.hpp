class Quest_config {

	class Quests {
		The_quests[] = {
			{
				1,  // unique Quest ID
				"Offspring", // Header for Quest in Dialog
				"Blah", // This is the Description for the Quest, u can use structued text elemts here
				"Get am Raptor Egg", // Description short
				"""valor_egg"" in uniformItems player || ""valor_egg"" in vestItems player || ""valor_egg"" in backpackItems player", // boolean code if quest can be submited
				"player removeitem ""valor_egg""", // code to do when submitted




			}





		};

	};
};
