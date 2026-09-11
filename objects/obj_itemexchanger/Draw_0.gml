gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle(0,0, room_width,room_height, false);
draw_set_colour(c_white)

draw_set_alpha(1);

draw_sprite(spr_itemexchangermask,0,x,y);

gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

var c1,c2

c1 = merge_colour(c_red,c_blue,abs(sin(timer / 25)))
c2 = merge_colour(c_blue,c_red,abs(sin(timer / 25)))

draw_rectangle_colour(x - 16,y - 96,x + 16,y - 32,c1,c1,c2,c2,false)

draw_sprite_ext(spr_item,item,x - 16,y + floor(itemy) - 80,image_xscale,image_yscale,floor(itema),image_blend,image_alpha)

gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

draw_self()