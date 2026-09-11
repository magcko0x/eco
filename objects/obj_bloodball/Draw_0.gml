draw_sprite_ext(sprite_index,image_index,x,y,clamp(image_xscale + z / 128,0,1),clamp(image_yscale + z / 128,0,1),image_angle,c_black,0.5)

draw_sprite_ext(sprite_index,image_index,x,y + z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)