if instance_exists(self) {
	if active {
		if array_contains(viruses,"rabies") {
			if !instance_exists(obj_rabies) {
				var chancer, xx, yy
		
				
				chancer = irandom(3) 

				switch chancer {
					case 0:
						xx = 0 - sprite_width
						yy = 0 - sprite_height
						break
			
					case 1:
						xx = room_width + sprite_width
						yy = 0 - sprite_height
		
					case 2:
						xx = room_width + sprite_width
						yy = room_height + sprite_height
				
					case 3:
						xx = 0 - sprite_width
						yy = room_height + sprite_height
				}
	
				var rabies = instance_create_depth(xx,yy,depth,obj_rabies)
				rabies.owner = self
			}
		}
	}
}