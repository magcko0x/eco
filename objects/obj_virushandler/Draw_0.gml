var me = self

with infected {
	if me.virus = "rabies" {
		if me.drawallow {
			
			if !variable_instance_exists(self,"rabidtimer") {
				rabidtimer = 300
			}			
			
			if !variable_instance_exists(self,"rabid") {
				rabid = -1
			}			
			
			var timer
			
			if !rabid {
				timer = rabidtimer/300	
			} else {
				timer = (300 -rabidtimer)/300	
			}
			
			
			draw_rectangle_colour(x - 9, y + 17,x + 17, y + 27,c_black,c_black,c_black,c_black,false)
			
			gpu_set_blendenable(false)
			gpu_set_colorwriteenable(false,false,false,true);
			draw_set_alpha(0);
			draw_rectangle(0,0, room_width,room_height, false);

			draw_set_alpha(1);

			draw_healthbar(x-8,y + 18, x + 16, y + 26,timer * 100,c_black,c_white,c_white,0,false,false)
			
			gpu_set_blendenable(true);
			gpu_set_colorwriteenable(true,true,true,true);
			gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
			gpu_set_alphatestenable(true);
			
			var timer2
			
			timer2 = (300 - rabidtimer)/300
			
			draw_sprite_tiled(spr_rabiesback,0,x+timer2*64,y+timer2*64)

			gpu_set_alphatestenable(false);
			gpu_set_blendmode(bm_normal);



			if rabid {
				shakex = irandom_range(-2,2)
				shakey = irandom_range(-2,2)
			} else {
				shakex = 0
				shakey = 0
			}
			
			draw_sprite(spr_minirabies,clamp(rabid,0,1),x - 16+shakex,y+22+shakey)
		}
	}
}