if !instance_exists(obj_shi) {
		var chancer, xx, yy
		
		randomize()
		chancer = irandom(3) 

		switch chancer {
			case 0:
				xx = sprite_width
				yy = sprite_height
			break
		
			case 1:
				xx = room_width - sprite_width
				yy = 0 + sprite_height
			break
					
			case 2:
				xx = room_width - sprite_width
				yy = room_height - sprite_height
			break
			
			case 3:
				xx = sprite_width
				yy = room_height - sprite_height
			break
		}
	
	var myshi = instance_create_depth(xx,yy,depth,obj_shi)
	myshi.owner = self
}