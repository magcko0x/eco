for (var i = 0; i < array_length(spawnsounds);i++)
	audio_stop_sound(spawnsounds[i])
audio_play_sound(spawnsounds[irandom(array_length(spawnsounds)-1)],0,false,2.5)