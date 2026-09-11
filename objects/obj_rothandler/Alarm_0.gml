if !instance_exists(obj_syringe)
	if instance_exists(obj_spawnzone) {
		var zone = instance_find(obj_spawnzone,irandom(instance_number(obj_spawnzone) - 1))
		
		with zone {
			randomize()
			var mysyringe = instance_create_depth(x + (irandom_range(0,sprite_width)),y + (irandom_range(0,sprite_height)),depth,obj_syringe)
			
			with mysyringe {
				for (var i = array_length(bannedcol)-1; i > 0; i--) {
					var col = bannedcol[i]
	
					if place_meeting(x,y,col)
						instance_destroy()
					
					var syrzone = instance_find(obj_spawnzone,irandom(instance_number(obj_spawnzone) - 1))
		
					with syrzone {
						randomize()
						if instance_exists(mysyringe) {
							mysyringe.x = x + (irandom_range(0,sprite_width))	
							mysyringe.y = y + (irandom_range(0,sprite_height))
						}
					}
				}
			}
		}
	}
	
roomcount = irandom_range(5,7 + clamp(floor(obj_rottimer.timer / 36),0,4))