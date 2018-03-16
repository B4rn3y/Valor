class Quest_config {

	class Quests {
		The_quests[] = {
			{
				0, //unique quest queue ID
				0,  // unique Quest ID for Quest queue
				"Offspring", // Header for Quest in Dialog
				"Blah Blah Plane Blah Egg blah blah bring it to me you fuck idiot", // This is the Description for the Quest, u can use structued text elemts here
				"Get a Raptor Egg and bring it to me", // Description short
				"""valor_egg"" in uniformItems player || ""valor_egg"" in vestItems player || ""valor_egg"" in backpackItems player", // boolean code if quest can be submited
				"player removeitem ""valor_egg""", // code to do when submitted
				"\UIs\textures\quest\quest_pictures\Quest_0_0_1.jpg", // Path to first Picture
				"\UIs\textures\quest\quest_pictures\Quest_0_0_2.jpg", // Path to second Picture
				"You are a good boy" // Text to show when Quest is submitted




			}





		};

	};
};
