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

if global.interact {
	draw_sprite_ext(spr_hand, image_index, x + shakex, y + shakey, image_xscale, image_yscale, angle, color, alpha)
	
	var currentitem = obj_playerhandler.playerinventory[obj_inventory.pos]
	
	if drawitem && currentitem != -1 {

		var offset_dist = point_distance(0, 0, 8, 8)
		var offset_dir = point_direction(0, 0, 8, 8) + angle

		var item_x = x + shakex + lengthdir_x(offset_dist, offset_dir)
		var item_y = y + shakey + lengthdir_y(offset_dist, offset_dir)
		
		draw_sprite_ext(currentitem.sprite, currentitem.image, item_x, item_y, image_xscale / 2.5, image_yscale / 2.5, angle, color, alpha)
	}
}