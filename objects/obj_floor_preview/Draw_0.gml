draw_sprite(spr_floor_preview_screen,0,x,y)

if instance_exists(obj_floorselector_head) {
	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false,false,false,true)
	draw_set_alpha(0)
	draw_rectangle(0,0, room_width,room_height, false)

	draw_set_alpha(1)

	draw_sprite(spr_floor_preview_screen_mask,0,x,y)
	gpu_set_blendenable(true)
	gpu_set_colorwriteenable(true,true,true,true)

	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha)
	gpu_set_alphatestenable(true)
	
	var floor_sin = sin(current_time / 2000) * 21
	
	floor_sprite = obj_floorselector_head.floorsprites[obj_floorselector_head.index]
	
	draw_sprite(floor_sprite,0,x + floor_sin,y)

	gpu_set_alphatestenable(false)
	gpu_set_blendmode(bm_normal)
}