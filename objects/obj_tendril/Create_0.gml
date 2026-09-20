owner = noone

goaway = false
lerper = 0
harmless = true
iframe = 80
flicker_timer = 0
flicker_speed = 1
reverse = false
xlerper = 0
ambsfx = audio_play_sound_at(snd_tendril_ambience,x,y,0,200,400,1,false,0,1,random(0.2))

alarm[0] = 2

emitter = audio_emitter_create()
audio_emitter_falloff(emitter, 96, 128, 1)