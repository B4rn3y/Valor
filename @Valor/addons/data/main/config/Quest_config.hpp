class Quest_config {

	class Quests {
		The_quests[] = {
			{
				0, //unique quest queue ID
				0,  // unique Quest ID for Quest queue
				"Offspring", // Header for Quest in Dialog
				"A Cargo Plane with deadly mutated raptors on it crashed somewhere. The Raptors should have survived this crash, they are very territorial so they probably stay somewhere near the Plane. Can you go and find these raptors and get me an egg of them?", // This is the Description for the Quest, u can use structued text elemts here
				"Find a Raptor Egg and bring it to me", // Description short
				"""valor_Raptor_Egg"" in uniformItems player || ""valor_Raptor_Egg"" in vestItems player || ""valor_Raptor_Egg"" in backpackItems player", // boolean code if quest can be submited
				"player removeitem ""valor_Raptor_Egg""", // code to do when submitted
				"\UIs\textures\quest\quest_pictures\Quest_0_0_1.jpg", // Path to first Picture
				"\UIs\textures\quest\quest_pictures\Quest_0_0_2.jpg", // Path to second Picture
				"Thanks for the egg, here is your reward" // Text to show when Quest is submitted




			},
			{
				0, //unique quest queue ID
				1,  // unique Quest ID for Quest queue
				"Test", // Header for Quest in Dialog
				"Barney got a big dick!", // This is the Description for the Quest, u can use structued text elemts here
				"Do IT", // Description short
				"true", // boolean code if quest can be submited
				"hint ""test"";", // code to do when submitted
				"\UIs\textures\quest\quest_pictures\Quest_0_0_1.jpg", // Path to first Picture
				"\UIs\textures\quest\quest_pictures\Quest_0_0_2.jpg", // Path to second Picture
				"Thanks dude" // Text to show when Quest is submitted




			}





		};

	};
};
