if global.interact {
	if state = "sleeping" {
		frame = 0
		
		if timer < 50 {
			maxshake = 4	
		}
		
		if timer > 0 {
			timer--	
		} else {
			state = "awake"
			maxshake = 0
			timer = 25	
		}
	}
	
	if state = "awake" {
		
		if obj_player.moving = true || point_distance(obj_hand.x,obj_hand.y,obj_hand.xprevious,obj_hand.yprevious) > 8 {
			
			state = "pissed"
			
			timer = 5
		}
		
		if timer < 15 {
			maxshake = 4	
		}
		
		frame = 1
		if timer > 0 {
			timer--	
		} else {
			state = "sleeping"
			maxshake = 0
			timer = 200
		}
	}
	
	if state = "pissed" {
	
		maxshake = 8
		
		frame = 2
		if timer > 0 {
			timer--	
		} else {
			
			global.diedto = "sleepy"
			
			if obj_player.state != obj_player.dead {
				obj_player.state = obj_player.dead	
			}
		}
	}	
}