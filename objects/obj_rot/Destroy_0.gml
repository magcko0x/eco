part_particles_burst(psystem[0],x,y,part_burst)

part_system_depth(psystem[0],depth)

audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))
audio_play_sound(snd_punch,0,false,1,0,random_range(0.7,1.2))
instance_destroy()
audio_stop_sound(closesfx)
audio_stop_sound(farawaysfx)
instance_create_depth(x,y,-10000,obj_flash)