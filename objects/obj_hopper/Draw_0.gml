if z < 0
	draw_sprite_ext(spr_droolballmask,image_index,x,y,clamp(image_xscale + z / 128,0,1),clamp(image_yscale + z / 128,0,1),image_angle,c_black,0.5)

if item != -1 {
	draw_sprite_ext(item.sprite,item.image,x,y + z - 12,0.5,0.5,image_angle,image_blend,image_alpha)
}

draw_selected(sprite_index,image_index,x,y+z)
draw_sprite_ext(sprite_index,image_index,x,y + z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)