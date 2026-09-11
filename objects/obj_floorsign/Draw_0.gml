number = global.floor + 2

draw_sprite(spr_floorsignframe,0,x,y);

gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle(0,0, room_width,room_height, false);

draw_set_alpha(1);

draw_sprite(spr_floorsignmask,0,x,y);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);


if scroll < 24 {
	scroll += 0.125
} else scroll = 0




draw_sprite(spr_doorsignbackground,0,x,y)
var num = string_replace_all(string_format(number,2,0)," ","0")


d[1] = real(string_char_at(num,1))
d[2] = real(string_char_at(num,2))

add++

for (var j = 0; j < 2; j++) {
	for (var i = 0; i < 2; i++) {
		draw_sprite(spr_doorsignnumbers,d[i+1],x + (((i+1)*8) - scroll) + j * 24,y-4 + sin((add+i*50)/100));
	}
}

gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);