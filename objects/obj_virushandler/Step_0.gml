var me = self

for (var i = 0;i < instance_number(obj_virushandler);i++) {
	if instance_find(obj_virushandler,i + 1) != noone {
		if (instance_find(obj_virushandler,i).virus = instance_find(obj_virushandler,i+1).virus) && (instance_find(obj_virushandler,i).infected = instance_find(obj_virushandler,i+1).infected){
			instance_destroy()
		}
	}
}

with infected {
	
	if global.interact {
		if me.virus = "rabies" {
			
			if !variable_instance_exists(self,"rabidtimer") {
				rabidtimer = 300
			}
		
			if !variable_instance_exists(self,"rabidsfx") {
				rabidsfx = snd_rabies_ambience
			}		

			if !variable_instance_exists(self,"rabid") {
				rabid = -1
			}			
			
			randomise()
			chancer = irandom(5000)
			
			if chancer = 0 {
				if object_index != obj_player {
					
					if instance_exists(obj_mothervirushandler) {
						if !array_contains(obj_mothervirushandler.viruses,"rabies") {
							obj_mothervirushandler.viruses[clamp(array_length(obj_mothervirushandler.viruses)-1,0,9999)] = "rabies"
						}
					}					
						
					burstsfx = audio_play_sound_at(snd_rabies_infect,x,y,0,300,600,1,0,false,1,0,random_range(0.7,1.2))

						
					part_particles_burst(me.psystem[0],x,y,part_burst)
	
					part_system_depth(me.psystem[0],-9000)
					
					if alarm[0] = -1 alarm[0] = 60
					me.caller = self
					
					instance_destroy()
					
					instance_create_depth(x,y,depth,obj_rabies)
					
					audio_stop_sound(rabidsfx)
						
					instance_destroy(me)
				}
			}			
		
			var _spd = 8		
		
			me.drawallow = true
		
			if rabidtimer > 0 {
				rabidtimer--	
			} else {
				rabid = -rabid
				
				rabidtimer = 300
			}
		
			if rabid {
				
				if !audio_is_playing(rabidsfx) {
					rabidsfx = audio_play_sound_at(snd_rabies_ambience,x,y,0,300,600,1,0,false,1,0,random_range(0.7,1.2))
			    }			
				
				if (part_system_exists(me.psystem[0])) {
					part_particles_burst(me.psystem[0],x,y,part_drool)
		
					part_system_depth(me.psystem[0],-9000)
				}
				
				if object_index = obj_player moving = true
				move_and_collide(irandom_range(-1*_spd,1*_spd),irandom_range(-1*_spd,1*_spd),tag_get_asset_ids("solid",asset_object))
				
				if instance_number(obj_droolball) < 10
					instance_create_depth(x,y,depth,obj_droolball)
			} else audio_stop_sound(rabidsfx)
		}
	}
}