if lock {
	if global.interact {
		shakex = irandom_range(-shake_strength,shake_strength)
		
		if shake_strength > 0 {
			shake_strength -= 0.25	
		}
		
		if obj_playerhandler.key = false && obj_playerhandler.keycolor != image_blend
			cursor = 3
		
		if obj_playerhandler.key = true && obj_playerhandler.keycolor = image_blend
			cursor = 4
	}
	if !deac
		draw_selected(sprite_index,image_index,x + shakex)
		
	if state = "open" {
		gpu_set_fog(true,c_white,0,0)
		draw_sprite_ext(sprite_index,image_index,x + shakex,y,image_xscale,drawyscale * image_yscale,image_angle,image_blend,image_alpha)
		gpu_set_fog(false,c_white,0,0)
	} else {
		draw_sprite_ext(sprite_index,image_index,x + shakex,y,image_xscale,drawyscale * image_yscale,image_angle,image_blend,image_alpha)
	}
} else {
	if state = "open" {
		gpu_set_fog(true,c_white,0,0)
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,drawyscale * image_yscale,image_angle,image_blend,image_alpha)
		gpu_set_fog(false,c_white,0,0)
	} else {
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,drawyscale * image_yscale,image_angle,image_blend,image_alpha)
	}
}