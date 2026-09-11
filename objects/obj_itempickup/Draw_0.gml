if global.interact
	draw_selected(spr_item,item,x - sprite_width/2,y - sprite_height/2)
draw_sprite_ext(spr_item,item,x - sprite_width/2,y - sprite_height/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha)


var my_string_id = room_get_name(room) + "_" + string(id);