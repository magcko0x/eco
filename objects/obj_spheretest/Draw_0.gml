setdepth()

draw_sprite(spr_spheretest,0,x,y);

gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle(0,0, room_width,room_height, false);

draw_set_alpha(1);
draw_sprite(spr_spheretest,1,x,y);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

if scroll < 64 {
	scroll += 0.25	
} else scroll = 0

draw_sprite(spr_spheretest,2,x-64 + scroll,y);
draw_sprite(spr_spheretest,2,x + scroll,y);

gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

draw_sprite(spr_spheretest,3,x,y);
