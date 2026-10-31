function get_message(){
	var dialogarray
	
	dialogarray = [
		[
			"Greetings! It's so nice to see you, honey!",
			"I'm aware things are a little scary right now, but don't worry.",
			"I'll be there for you!",
			"Like how you were for me.",
			"Now, this place you're standing in is my old coffee shop.",
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
			"/laughingLove you!!"
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
					"And at the same time, his mouth starts closing in on your vision!",
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
					
					"Hi, honey!!!",
					"Who got you now?",
					"/frownOh.",
					"/defaultThis should be simple enough.",
					"You have been killed by old college roomate, also known as \"Shi\".",
					"Years of being friends with Rot have made her a bit more of a...",
					"/frownAnd excuse me for my language here,",
					"/angry\"Jerk\".",
					"/defaultWhich had resulted in her...",
					"/angry\"Erratic behaviour\".",
					"/defaultWhen Shi is in the same room as you, you must simply dodge her attacks!",
					"She will circle a little bit before attacking as a warning,",
					"And when she does, she'll dash straight for you!",
					"Luckily, my degree in physics had payed off, as I can calculate exactly where she'll land and mark her crosshair on the ground for you!",
					"So you must simply dodge the crosshair and Shi as when she is dashing!",
					"That should be about it.",
					"/frownOh, and when you get back there,",
					"/mischieviousKnock 'em dead, honey!",
					"/laughingHehe!"
				]
			]
		break;	
		
		case "rot":
			textlist = [
				[
					"Hey, hun!",
					"/sadAwww, you seem upset. What got you this time?",
					"/frownAh.",
					"/defaultYou were claimed by an old college friend of mine known as \"Rot\".",
					"According to my observations, you must attempt to keep your timer above zero!",
					"/frownFailing to do so allows him to manifest.",
					"/defaultTo keep your timer above zero, you must collect the multiple syringes on the floor!",
					"However!",
					"Though not recommended, when he is there, you ARE able to punch rot to temporarily stop his manifestation!",
					"/laughingDoing so buys you some time to attempt to give yourself... more time!",
					"/defaultStill, you are better off attempting to find the syringes on the floor.",
					"That's all though!",
					"/laughingSee you soon!"
				]
			]
		break;
		
		case "myxo":
			textlist = [
				[
					"Hi, sugar!",
					"/frownWhat now?",
					"Hm...",
					"/defaultOh, you were killed by my former college friend, \"MC Myxo\"!",
					"Or just \"Myxo\", for short!",
					"You see, due to being an MC, he loves clubbing in the dark.",
					"He's got a pretty active social life, so he brings his friends along, which are mostly just himself!",
					"Though, due to liking clubbing in the dark, shining a light upon him makes him rather...",
					"/frownMad.",
					"/sadAnd when he is mad...",
					"You... saw what happened.",
					"/defaultRed flags aside, to avoid his anger, simply do not flash a light on him and let him club in peace!",
					"That being said though...",
					"/laughingI wish you the best out there! You can do it hun!",
					"Hehe!"
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
					"/frownYou... died to the HIDEOUS beasts known as...",
					"/angry\"Meow\".",
					"/sadEughh...",
					"They used to be Tendril's cats before this place made them horrifically aggressive...",
					"/frownThey slowly chase after you, and when they catch you...",
	                "/angryThey SHRED you to PIECES!",
	                "To escape their HIDEOUS grasp, make sure to click on them with your hand to punch them.",
	                "/frownGood luck next time, hun.",
	                "/sadI hate those things."
				]
			]
		break;
		
    }
}