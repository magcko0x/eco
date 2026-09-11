var endframe = 1

if opendoor {
	if frame < endframe {
		frame++
	} 
}

if charge > 0 {
	if !locked {
		doorshakex = irandom_range(-doorshake_strength,doorshake_strength)
		
		if doorshake_strength > 0 {
			doorshake_strength -= 0.25	
		}
	
		cursor = 1
		draw_selected(sprite_index,image_index,x+doorshakex)
		draw_sprite(spr_door1,image_index+frame,x + doorshakex,y)
	} else if locked {
		
		draw_sprite(spr_door1,image_index+frame,x + doorshakex,y)
		
		lockshakex = irandom_range(-lockshake_strength,lockshake_strength)
		
		if lockshake_strength > 0 {
			lockshake_strength -= 0.25	
		}
		cursor = 3 + obj_playerhandler.key
		draw_selected(spr_lock,0,x - sprite_width/2 + lockshakex)
		draw_sprite(spr_lock,0,x - sprite_width/2 + lockshakex,y)	
	}
} else {
	draw_sprite(spr_door1,image_index+frame,x + doorshakex,y)
		
	if locked {
		draw_sprite(spr_lock,0,x - sprite_width/2 + lockshakex,y)	
	}
		
	cursor = 8
	draw_selected(spr_laser,0,x - sprite_width/2 + lockshakex)
	draw_sprite(spr_laser,0,x - sprite_width/2 + lockshakex,y)		
}
