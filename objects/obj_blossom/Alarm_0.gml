if global.interact {
	image_index = irandom(image_number-2)

	var sounds = [snd_blossom_spawn1,snd_blossom_spawn2,snd_blossom_spawn3]

	if image_index != prevface {
		audio_play_sound(sounds[irandom(array_length(sounds)-1)],0,false,1,0,random_range(1,1.2))
		shake_strength = irandom_range(4,8)
	}
	prevface = image_index
}