depthoffset = 32

if !array_contains(global.unlockedentities,"shi") {
	instance_destroy()
}

speechsound = snd_shi_charge

step_func = function() {
	if !variable_instance_exists(id,"add") {
		add = 0	
	}

	if (image_index >= image_number - 1) {
		if (!sound_triggered) {
			sound_triggered = true
			audio_play_sound_on(emitter,snd_shi_flap, false, 0, 0.5)
		}
	} else if (image_index < 1) {
			sound_triggered = false;
	}
	
	image_speed = 0.25
	
	add++
	
	x = x + cos(add/10)
	y = y + sin(add/10)
			
	mylight.x = x
	mylight.y = y	
}

draw_func = function() {
	var shake_strength = 4
		
	shakex = irandom_range(-shake_strength, shake_strength);
	shakey = irandom_range(-shake_strength, shake_strength);
	if !deac
		draw_selected(sprite_index,image_index,x + shakex,y + shakey)			
	draw_sprite_ext(sprite_index,image_index,x + shakex,y + shakey,image_xscale,image_yscale,image_angle,image_blend,image_alpha)			
}

textlist =
[
	[
		"oh.",
		"...",
		"hello.",
		"...",
		"sup.",
		"sorry i was distracted.",
		"by the sweet sounds of my flaps.",
		"sweet.",
		"...",
		"ha.",
		"...",
		"hey eco-unit.",
		"...do you think you can outrun death?",
		"...",
		"dont actually answer that.",
		"the answer is yes.",
		"the main question is actually...",
		"do you think you deserve to?",
		"...",
		"ok new hypothetical.",
		"so theres this island.",
		"its got like multiple people in it.",
		"and youre like.",
		"real hungry.",
		"like.",
		"youre gonna die in 2 minutes hungry.",
		"do you.",
		"like.",
		"eat. the people.",
		"or. do you like.",
		"die.",
		"...",
		"okay theres no choice prompt.",
		"ill answer with what id do.",
		"id die.",
		"but not because i have empathy.",
		"i dont.",
		"its because. i think. nature should take its course.",
		"attempting. to like. kill the guys before their expiration date is due.",
		"its interfering nature.",
		"that makes you think though right.",
		"if i think nature should take its course.",
		"why do i try rushing your death.",
		"why do you think that is?",
		"...",
		"ok no answer prompt.",
		"again.",
		"fine. ok. sure.",
		"i think. its because. youre not nature.",
		"i think that because of that, your inability to die.",
		"it should be remedied.",
		"thats why i do what i do.",
		"i rush in.",
		"and kill you.",
		"or try to.",
		"...",
		"that brings me back to the beginning.",
		"do you think you can outrun death?",
		"i guess. the answer is yes.",
		"sure sucks doesnt it?"
	],
	[
		"dont talk to me.",
		"i dont like you."
	],
	[
		"hi.",
		"bye."
	]
]