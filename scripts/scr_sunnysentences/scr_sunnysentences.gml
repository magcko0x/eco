function get_message(){
	var dialogarray
	
	dialogarray = [
		[
			"Greetings! It's so nice to see you, honey!",
			"I'm aware things are a little scary right now, but don't worry.",
			"I'll be there for you!",
			"Like how you were for me.",
			"Now, this place you're standing in is my old coffee shop.",
			"I used to be a barista here before I Ascended!",
			"We used to go here all the time, so many great memories!",
			"/frownThe place never really took off though.",
			"/defaultSo, while we're stuck in...",
			"/frownWell, I don't know.",
			"/defaultI decided to spruce the place up a bit, added some fryers.",
			"Now it's a perfectly valid cafeteria!",
			"Here you can relax, change your appearence in the Wardrobifier on the right...",
			"And some of...",
			"/angryHIS.",
			"/default\"Friends\" might join us here!",
			"/frownOnly...",
			"If you find them first though.",
			"/defaultSo whenever you encounter them, check back here!",
			"/angryMaybe they'll EXPLAIN THEMSELVES.",
			"/defaultUntil then, though,",
			"Good luck dear! Wish you the best!"
		],
		[
			"Remember what I said,",
			"Check back when you find more people!",
			"Love you!!"
		]
	]
	
	textlist = dialogarray
}


function get_death_message(){
	switch global.diedto {
		default:
			textlist = [
				[
					"/surprisedError! Error!",
					"Who this?",
					"Who this???"
				]
			]
		break;
		
		case "bun":
			textlist = [
				[
					"Hi dear!",
					"Who killed you?",
					"/frownHm? Him?",
					"/defaultIt seems you were maimed by my dear friend, \"Bun\"!",
					"When he makes a plan of attack, he runs so fast your head begins shaking!",
					"If that happens, it is imperative you run forward a couple of rooms until you find one with a safe zone.",
					"/frownI don't have much control over this... place, but...",
					"/defaultWith the little I COULD do, I sprouted some flowers for you to indicate a safe zone!",
					"So... stand behind the flowers to be safe!",
					"/frownOh, and when you go back there...",
					"/angryI suggest writing a STRONGLY worded letter to Bun."
				]
			]
		break;
		
		case "shi":
			textlist = [
				[
					"What got you now?",
					"/frownOh.",
					"/defaultThis should be simple enough.",
					"You died to the bringer of death otherwise known as 'Shi'.",
					"When Shi is in the same room as you...",
					"All you must do is avoid its crosshair.",
					"That is all there is to say on the matter."
				]
			]
		break;	
		
		case "rot":
			textlist = [
				[
					"Hey, hun!",
					"/sadAwww, you seem upset. What got you this time?",
					"/frownAh.",
					"/defaultYou were claimed by the essence of blight otherwise known as 'Rot'.",
					"You must keep your timer above '0'.",
					"Failing to do so allows its manifestation.",
					"You can dodge death by using your hand to punch Rot.",
					"/frownHowever, this is not reliable...",
					"/defaultYou're better off collecting syringes to add to your timer.",
					"Enjoy your new attempt."
				]
			]
		break;
		
		case "myxo":
			textlist = [
				[
					"Hey!",
					"/frownWhat now?",
					"Hm...",
					"/defaultIt seems you were taken by the photophobic ones, otherwise known as 'Myxo'.",
					"They hate light as it disturbs their 'eyesight'.",
					"Keep away from shining your light at them and they won't charge at you.",
					"Fail to do so, however...",
					"That's all."
				]
			]
		break;
    
		case "meow":
			textlist = [
				[
					"/frownOh wow.",
					"Oh wow, oh wow, oh wow.",
					"/angry...Those??",
					"/sadThose...",
					"/angryMonstrosities.",
					"/frownAhem-",
					"/frownYou... died to the HIDEOUS beast known as...",
					"/angry'Meow'.",
					"/sadEughh...",
					"/frownThey slowly chase after you, and when they catch you...",
	                "/angryThey SHRED you to PIECES!",
	                "To guarantee your survival, punch them by clicking on them.",
	                "/frownGood luck next time, hun.",
	                "/sadI hate those things."
				]
			]
		break;
		
    }
}