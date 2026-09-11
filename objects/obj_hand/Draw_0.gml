shakex = irandom_range(-shake_strength, shake_strength);
shakey = irandom_range(-shake_strength, shake_strength);

if state = free {
	if currentdist >= 0.8 {
		if shake_strength < 4 {
			shake_strength += 0.25	
		}
	} else {
		if shake_strength > 0 {
			shake_strength -= 0.25
		}
	}
} else {
	if shake_strength > 0 {
		shake_strength -= 0.25
	}
}

if global.interact
	draw_sprite_ext(spr_hand,image_index,x + shakex,y + shakey,image_xscale,image_yscale,angle,color,alpha)