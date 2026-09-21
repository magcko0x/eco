draw_func()

/*
switch sprite_index {
	default:
		if !deac
			draw_selected()
		draw_self()
		break;
		
	case spr_rot:
		var shake_strength = 2
		var shakex = irandom_range(-shake_strength,shake_strength)
		var shakey = irandom_range(-shake_strength,shake_strength)

		for (var i = 0; i < 10; i++) {
			backshadowshakex[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)
			backshadowshakey[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)

			draw_sprite_ext(sprite_index,image_index,x + backshadowshakex[i],y + backshadowshakey[i],image_xscale,image_yscale,image_angle,c_black,0.2)
		}
		
		part_particles_burst(psystem,x,y,part_flies)
		
		part_system_depth(psystem,depth)
		
		if irandom(10) = 0 {
			if image_index = 1
				image_index = 0
			else {
				image_index = 1	
			}
		}
		
		if !deac
			draw_selected(sprite_index,image_index,x + shakex,y + shakey)
		draw_sprite(sprite_index,image_index,x + shakex,y + shakey)
		break;
		
	case spr_bun:
		var shake_strength = 2
		var shakex = irandom_range(-shake_strength,shake_strength)
		var shakey = irandom_range(-shake_strength,shake_strength)		
		if !deac
			draw_selected(sprite_index,image_index,x + shakex,y + shakey)
		draw_sprite(sprite_index,image_index,x + shakex,y + shakey)
		break;
	
	case spr_rabiesspit:
	case spr_rabies:
		if sprite_index = spr_rabies {
			var shake_strength = 2
		} else {
			var shake_strength = 8
		}
		var shakex = irandom_range(-shake_strength,shake_strength)
		var shakey = irandom_range(-shake_strength,shake_strength)

		for (var i = 0; i < 10; i++) {
			backshadowshakex[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)
			backshadowshakey[i] = irandom_range(-shake_strength - i * 2,shake_strength + i * 2)

			draw_sprite_ext(sprite_index,image_index,x + backshadowshakex[i],y + backshadowshakey[i],image_xscale,image_yscale,image_angle,c_black,0.2)
		}
		
		part_particles_burst(psystem,x,y,part_rabiesfog)
		
		part_system_depth(psystem,depth)
		
		if irandom(10) = 0 {
			if image_index = 1
				image_index = 0
			else {
				image_index = 1	
			}
		}
		
		if !deac
			draw_selected(sprite_index,image_index,x + shakex,y + shakey)
		draw_sprite(sprite_index,image_index,x + shakex,y + shakey)
		break;
		
		case spr_shi:
			var shake_strength = 4
		
			shakex = irandom_range(-shake_strength, shake_strength);
			shakey = irandom_range(-shake_strength, shake_strength);
			if !deac
				draw_selected(sprite_index,image_index,x + shakex,y + shakey)			
			draw_sprite_ext(sprite_index,image_index,x + shakex,y + shakey,image_xscale,image_yscale,image_angle,image_blend,image_alpha)		
		break;
}