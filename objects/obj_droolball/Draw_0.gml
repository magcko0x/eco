draw_sprite_ext(sprite_index,image_index,x,y,clamp(image_xscale + z / 128,0,1),clamp(image_yscale + z / 128,0,1),image_angle,c_black,0.5)

gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle(0,0, room_width,room_height, false);

draw_set_alpha(1);

draw_sprite(sprite_index,image_index,x,y+z)

gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

draw_sprite_tiled(spr_rabiesback,0,0,0)

gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

draw_sprite_ext(spr_droolballshadow,0,x,y + z,image_xscale,image_yscale,image_angle,image_blend,clamp(image_alpha,0,0.2))