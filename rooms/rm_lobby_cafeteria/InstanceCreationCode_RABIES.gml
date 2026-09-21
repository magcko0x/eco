if !array_contains(global.unlockedentities,"rabies") {
	instance_destroy()
}

step_func = function() {
	if (!variable_instance_exists(id,"rabiestimer")) {
		rabiestimer = 300	
	}
		
	if rabiestimer > 0 {
		rabiestimer--	
	} else {
		sprite_index = choose(spr_rabiesspit,spr_rabies)
		rabiestimer = irandom_range(20,300)	
	}
		
	if !variable_instance_exists(id,"mouthsfx") {
		mouthsfx = audio_play_sound_on(emitter, snd_rabies_ambience, true, 0, 0.5)
	}
}

draw_func = function() {
	if sprite_index = spr_rabies {
		var shake_strength = 2
	} else {
		var shake_strength = 8
	}
	var shakex = irandom_range(-shake_strength,shake_strength)
	var shakey = irandom_range(-shake_strength,shake_strength)

	for (var i = 0; i < 10; i++) {
		backshadowshakex[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)
		backshadowshakey[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)

		draw_sprite_ext(sprite_index,image_index,x + backshadowshakex[i],y + backshadowshakey[i],image_xscale,image_yscale,image_angle,c_black,0.2)
	}
		
	part_particles_burst(psystem,x,y,part_rabiesfog)
		
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

speechsound = snd_rabies_infect

textlist = [
	[
		"3344GHUHGHHHH",
		"344DHGHHHHHH",
		"H1!",
		"H3LL0, 50RRY 1 W45 JU549404-91-093",
		"91239192-3900",
		"H33LH00 5UNNY5'5 L0V3RR!! MY N34M3 155THHHHHHH...",
		"UHHHHH",
		"UHHHHHHHHHHHHHHH",
		"389373YU4DU4DHUO4DH4OU1DH",
		"R4B135!!!",
		"1'V333 B33N R3444LLYYY 33XC11T3DD T0 M33T Y0U000U!!!!!",
		"BC3C4U533",
		"MY FR13ND R0THH H4455H T4L4K33D 4B00UT YU0U 4 L000000T!!",
		"H3'5 H4D V3RRY N0TT N1CC3 TH1NG5 T0 54YY 4B0UTT YU0U!!",
		"H3 C4L3L3D Y0U 44N \"1D100TT\" N4ND 54D1D THH444T YU00U \"D0NT'T D353RV33 T00 G3TT M4R1R13D\"!!",
		"H33 S411D H3 4LS00 0FT33NN TH1NK55 4B00TU H0WW M4YB33 1TT1 \"DT1DN'TT H4V3 T0 B333 TH155 W4YY\",",
		"0R THAT H3 0FT3N3 1M4GIN335 WH4TT 1T'D B333 L11K13 T000 5P33ND T1M333 W1TH YOU",
		"\"45 FR13NDD5\"",
		"TH33444T555 W3331RRD R11GHT???, Y0U D000000000D0D0000D00D0D0D040D4DH4D9D004D500D40-59419-D4D-04D09D4D0U91",
		"44T1T11T3131GGHGHHGHHHHHH",
		"UGHHHHH!!!!! 111 H4T3333333 H00WW H4RD 1T 15 T0 T4LKKK F000RR M3333!!!",
		"431G1GHGHH",
		"500 L11K33",
		"5P3334444K11NG 00FFF FR13ND55...",
		"1 W455 W44NDD33RR1NNGG 1F1F",
		"...",
		"W33 C000CULD B3 FR3I3ND5???",
		"FR00MM TH33 3B0TT0M 0FFF0F MY H434RTT",
		"1'MM 50RRY 1F 1 3V33RR 1NFF3CT33DDD Y0UUU,",
		"0RRR 44NNY0N3 4T 4LLL,",
		"1T W4455 4N 4CC1D3NTTT :[",
		"11'M BL1NDD, 4NDD YU0UR 5T33P5 4R33 V3RRY H3LPFFULL T0 N444V1G43T!!",
		"PL5 B3 MD1NDFUL :]",
		"Y0U'R33 C0L00L TH0UGUH 4NDDD W3'R3 B451C4LLYLY B35TTT FR13ND55 5000 L111K3KK31J1301U30U1JOUJ391903U1119U3901U3119309",
		"490U4820U9108U4911J93U0911K3J10931J031KO3",
		"44UR8UHG8UGH0U9GJ",
		"YY0UU G0TTT 4LL TH4T R1GHTT???????",
		"N00??",
		"T44LK T00 M3 L4TT3RRR TH33NN!!"
	],
	[
		"00HHH 51T555 L4T33RR 4LR334DYYY????",
		"C000LL!!",
		"...",
		"...",
		"H1!!!!",
		"50RRYR 1 BL4NK33D 00UTUT!!!",
		"GL444D Y00U'R33 H3R333 TH00UGHH",
		"...",
		"...",
		"...",
		"...",
		"0KKK 1M B0RR3D",
		"1MMM G000N44 G000 B4CK4KCK T0 D0001NNGGG N00TH1NGG!"
	],
	[
		"449484114141331313545GHHGHGHGHHG",
		":]"
	]
]