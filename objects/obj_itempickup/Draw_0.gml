if item != -1 {
	if global.interact
		draw_selected(item.sprite,item.image,x,y + z + z_offset,image_xscale,image_yscale,image_angle + false_angle)
	draw_sprite_ext(item.sprite,item.image,x,y + z + z_offset,image_xscale,image_yscale,image_angle + false_angle,image_blend,image_alpha)
}

var my_string_id = room_get_name(room) + "_" + string(id);