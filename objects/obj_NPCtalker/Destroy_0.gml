global.interact = true
creator.talkedto = false
if (page+1 = array_length(text))
	creator.text = clamp(creator.text + 1,0,array_length(creator.textlist)-1)
audio_stop_sound(speechsound)