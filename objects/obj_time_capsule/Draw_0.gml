if global.interact
	if item = -1 && !deac
		draw_selected(sprite_index,image_index,x,y + z + z_offset,image_xscale,image_yscale,image_angle + false_angle)
draw_sprite_ext(sprite_index,image_index,x,y + z + z_offset,image_xscale,image_yscale,image_angle + false_angle,image_blend,image_alpha)


if item != -1 {
	if global.interact && !deac
		draw_selected(item.sprite,item.image,x,y + item_z + z_offset,image_xscale,image_yscale,image_angle + item_false_angle)
	draw_sprite_ext(item.sprite,item.image,x,y + item_z + z_offset,image_xscale,image_yscale,image_angle + item_false_angle,image_blend,image_alpha)
}