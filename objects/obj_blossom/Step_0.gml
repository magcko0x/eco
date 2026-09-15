depth = -5000

audio_emitter_position(emitter,x,y,0)

if !audio_is_playing(ambiance) {
	ambiance = audio_play_sound_on(emitter, snd_blossom_ambience, true, 0, 1, 0, random_range(0.7,1.2))
}

if alarm[0] = -1
	alarm[0] = irandom_range(20,200)

part_particles_burst(psystem,x,y,part_hearts)
		
part_system_depth(psystem,depth)
	
if place_meeting(x,y,obj_hand) {
	image_alpha = 0.5
	part_particles_clear(psystem)
} else {
	image_alpha = 1	
}

if instance_exists(target) {

	var _total = instance_number(obj_blossom)
	var _my_rank = 0
	var _me = id
    
	with (obj_blossom) {
		if (id < _me) _my_rank++
	}

	var _base_angle = (current_time * 0.05) * orbit_speed
	var _spacing = 360 / _total
	var _final_angle = _base_angle + (_my_rank * _spacing)

	x = target.x + lengthdir_x(orbit_radius, _final_angle)
	y = target.y + lengthdir_y(orbit_radius, _final_angle)
		
	target.protected = true
}


if global.interact {
	
	if instance_exists(target) {
		
		var me = self
		
		if target.state = target.dead {
			
			total_count = instance_number(object_index) - 1
			
			if my_index = total_count {
				
				target.state = target.free
				
				switch global.diedto {
					case "rot":
						instance_destroy(obj_rot)
						if instance_exists(obj_rottimer)	
							obj_rottimer.timer = MINUTE/2
					break;
				
					case "bun":
						with obj_bun {
							
							part_particles_burst(me.psystem,x,y,part_burst)
		
							part_system_depth(me.psystem,depth)
	
							audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))
							instance_destroy()
							audio_stop_sound(ambsfx)
							instance_create_depth(x,y,-10000,obj_flash)
						}
						
						if instance_exists(obj_bunhandler) {
							with obj_bunhandler {
								bunreset()
							}
						}
					break;
					
					case "meow":
					
						var meowarray = [obj_meow,obj_purr]
						
						for (var i = 0; i < array_length(meowarray) ; i++) {
							with meowarray[i] {
								if instance_exists(obj_meowhandler)
									obj_meowhandler.active = false
							
								part_particles_burst(me.psystem,x,y,part_burst)
		
								part_system_depth(me.psystem,depth)
	
								audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))
								instance_destroy()
								audio_stop_sound(closesfx)
								audio_stop_sound(farawaysfx)
								
							}
						}
						
						instance_create_depth(x,y,-10000,obj_flash)
						
						
					break;
					
					case "myxo":
					
						with obj_myxo {
							part_particles_burst(me.psystem,x,y,part_burst)
		
							part_system_depth(me.psystem,depth)
	
							audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))
							instance_destroy()
							audio_stop_sound(growlsnd)
							audio_stop_sound(stepsnd)
							audio_stop_sound(chasesnd)
							instance_create_depth(x,y,-10000,obj_flash)
						}
					break;
					
					case "shi":
						
						with obj_shi {
							part_particles_burst(me.psystem,x,y,part_burst)
		
							part_system_depth(me.psystem,depth)
	
							audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))
							instance_destroy()
							audio_stop_sound(flapsnd)
							audio_stop_sound(chargesnd)
							instance_create_depth(x,y,-10000,obj_flash)								
						}
						
						if instance_exists(obj_shihandler) {
							with obj_shihandler {
								active = false
							}
						}
						
					break;
					
					case "unborn":
						
						with obj_unborn {
							part_particles_burst(me.psystem,x,y,part_burst)
		
							part_system_depth(me.psystem,depth)
	
							audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))
							instance_destroy()
							audio_stop_sound(farawaysfx)
							audio_stop_sound(closesfx)
							instance_create_depth(x,y,-10000,obj_flash)								
						}
						
						if instance_exists(obj_unbornhandler) {
							with obj_unbornhandler {
								wandering = true
								backstagex = irandom_range(0,array_length(global.backstage))
								backstagey = irandom_range(0,array_length(global.backstage[0]))
							}
						}						
						
					break;
					
					case "mites":
						
						with obj_player.locker {
							var player = instance_nearest(x,y,obj_player)
							
							player.safe = false;
							player.visible = true
							if instance_exists(obj_soulline)
								obj_soulline.visible = true
							audio_play_sound_at(snd_dooropen, x, y, 0, 200, 300, 1, false, 0);
							open = !open
							
							timer = 100
							
							player.active = true
							player.y = y + 64;							
						}
						
					break;
				}
			
				target.protected = false
				
				global.diedto = "noone"
				
				if (instance_exists(owner)) {
				    owner.blossomcount--;
				}				
				
				instance_destroy()
			}
		}
	}
	
	if instance_exists(mylight) {
		mylight.x = x
		mylight.y = y
	}
	
}