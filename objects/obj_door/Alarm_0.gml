if locked {
	if !instance_exists(obj_key)
		if instance_exists(obj_spawnzone) {
			var zone = instance_find(obj_spawnzone,irandom(instance_number(obj_spawnzone) - 1))
		
			with zone {
				randomize()
				var mykey = instance_create_depth(x + (irandom_range(0,sprite_width) div 16), (y + irandom_range(0,sprite_height) div 16),depth,obj_key)
			
				with mykey {
					spawnlock = true
					
					for (var i = array_length(bannedcol)-1; i > 0; i--) {
						var col = bannedcol[i]
	
						if place_meeting(x,y,col) {
					
							var keyzone = instance_find(obj_spawnzone,irandom(instance_number(obj_spawnzone) - 1))
		
							with keyzone {
								randomize()
								if instance_exists(mykey) {
									mykey.x = x + (irandom_range(0,sprite_width) div 16)
									mykey.y = y + (irandom_range(0,sprite_width) div 16)
								}
							}
						}
					}
				}
			}
		}
}