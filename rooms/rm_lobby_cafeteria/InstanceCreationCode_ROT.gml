if !array_contains(global.unlockedentities,"rot") {
	instance_destroy()
}

step_func =
function() {
	if !variable_instance_exists(id,"closesfx") {
		closesfx = snd_rot_mouthopen
		farawaysfx = snd_rot_mouthclosed
	}
			
	if image_index = 0 {
		audio_stop_sound(closesfx)
    	
		if !audio_is_playing(farawaysfx) {
			farawaysfx = audio_play_sound_on(emitter,snd_rot_mouthclosed, false,0)
		}
	}
			
	if image_index = 1 {
		audio_stop_sound(farawaysfx)
    		
		if !audio_is_playing(closesfx) {
			closesfx = audio_play_sound_on(emitter,snd_rot_mouthopen, false,0)
		}
	}	
}

draw_func =
function() {
	var shake_strength = 2
	var shakex = irandom_range(-shake_strength,shake_strength)
	var shakey = irandom_range(-shake_strength,shake_strength)

	for (var i = 0; i < 10; i++) {
		backshadowshakex[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)
		backshadowshakey[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)

		draw_sprite_ext(sprite_index,image_index,x + backshadowshakex[i],y + backshadowshakey[i],image_xscale,image_yscale,image_angle,c_black,0.2)
	}
		
	part_particles_burst(psystem,x,y,part_flies)
		
	part_system_depth(psystem,depth)
		
	if irandom(10) = 0 {
		if image_index = 1
			image_index = 0
		else {
			image_index = 1	
		}
	}
		
	if !deac
		draw_selected(sprite_index,image_index,x + shakex,y + shakey)
	draw_sprite(sprite_index,image_index,x + shakex,y + shakey)	
}

textlist = [
	[
		"YER ABSOLUTELY REPULSIVE, YER KNOW?",
		"IT ABSOLUTELY.",
		"ASTOUNDS ME.",
		"HOW SOMEONE'S AS UNLIKEABLE AND IDIOTIC AS YOUSE.",
		"IS ABOUT TO GET MARRIED.",
		"THAT SUNFLOWER DAME YOUSE GOT THERE?",
		"ABSOLUTE ANGEL OF A WOMAN.",
		"YOU?",
		"IF I SAW YOU OUT ON THE STREET...",
		"BLAH! I WOULDA THOUGHT I WAS IN HELL BEFORE I GOT EVEN JUDGED!",
		"HAR HAR HAR!",
		"...",
		"REALLY THOUGH...",
		"I HATE YER GUTS, KID.",
		"YER CONTINUED EXISTENCE IS AN AFRONT TO LIFE, DEATH, AND ALL STAGES INBETWEENS.",
		"YOUSE THINK YER ON TOPPA THE WORLD!!",
		"YER WERE DISMEMBERED?",
		"NO PROBLEM!!",
		"YOUSE JUST LET YER GIRL DO ALL THE WORKS!",
		"YER LUCKY HER CAFETERIA SERVICE IS AS GREAT AS IT IS.",
		"ELSEWISE, I'D BE THE ONE DISMEMBERIN' YOUSE!",
		"I'D LIKES TO SEE YOU CRY TO HER AFTER THAT ONE!!",
		"HAR HAR HAR HAR HAR!!",
		"...",
		"...HAR!",
	],
	[
		"WHAT DO YOUSE WANT FROM ME?",
		"A KISS??",
		"QUITS LAZIN' AROUND AND GET TO THE NEXT FLOOR ALREADY!",
		"FACE ME LIKE A MAN, TWERP!",
	],
	[
		"WE GOTS NOTHIN' TO DISCUSS.",
		"NOTHIN'! AND THAT'S FINAL!"
	]
]