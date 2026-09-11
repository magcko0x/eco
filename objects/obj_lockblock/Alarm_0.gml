	for (var i = -1; i < 2; i++) {
		
		var lockblockx,lockblocky
		
		lockblockx = instance_place(x + i * 16,y,obj_lockblock)
		
		if lockblockx {
			if lockblockx.image_blend = image_blend
				lockblockx.state = "open"
		}
		
		lockblocky = instance_place(x,y + i * 16,obj_lockblock)
		
		if lockblocky {
			if lockblocky.image_blend = image_blend
				lockblocky.state = "open"
		}		
	}