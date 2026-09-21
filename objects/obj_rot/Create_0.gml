event_inherited()

owner = noone

spd = 0
maxspd = 8
cursor = 6
closesfx = -1
farawaysfx = -1

shake_strength = 0
maxshakestrength = 4

emitter = audio_emitter_create()
audio_emitter_falloff(emitter, 200, 300, 1);

die = function() {
	part_particles_burst(psystem[0],x,y,part_burst)
		
	part_system_depth(psystem[0],depth)
	
	var playpunch = true
	
	if instance_exists(obj_rottimer) {
		with obj_rottimer {
			event_user(0)	
		}		
		if obj_rottimer.timer > 0 {
			playpunch = false	
		}
	}
	
	
	audio_play_sound(snd_burst,0,false,0.5,0,random_range(0.7,1.2))
	if playpunch audio_play_sound(snd_punch,0,false,0.5,0,random_range(0.7,1.2))
			
	var hurtsounds = [snd_rot_ow,snd_rot_ow2]
	
	if instance_exists(obj_rottimer) {
		if obj_rottimer.timer > 0 {
			hurtsounds = [snd_rot_thatscheap]	
		}
	}
			
	audio_play_sound(hurtsounds[irandom(array_length(hurtsounds)-1)],0,false,2.5)
	instance_destroy()
	audio_stop_sound(closesfx)
	audio_stop_sound(farawaysfx)
	instance_create_depth(x,y,-10000,obj_flash)
	exit	
}

layer_create(depth,"Particles")
psystem[0] = part_system_create_layer("Particles",false);