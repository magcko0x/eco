draw_sprite(spr_roomalarm,0,x,y)

if instance_exists(obj_rottimer) {
	var secs, mins, disp;

	disp = (obj_rottimer.timer) div 60;
	secs = string_replace(string_format(disp mod 60,2,0)," ","0");
	mins = string_replace(string_format(disp div 60,2,0)," ","0");

	var d1,d2,d3,d4

	if (disp mod 60) != prevtime {
		prevtime = (disp mod 60)
	}

	d1 = real(string_char_at(secs,1))
	d2 = real(string_char_at(secs,2))
	d3 = real(string_char_at(mins,1))
	d4 = real(string_char_at(mins,2))

	add++

	draw_sprite_ext(spr_rottimernumber,d3,x - 24,y + sin((add+1*50)/50),image_xscale,image_yscale,image_angle,color,image_alpha)
	draw_sprite_ext(spr_rottimernumber,d4,x - 12,y + sin((add+2*50)/50),image_xscale,image_yscale,image_angle,color,image_alpha)
	draw_sprite_ext(spr_rottimernumber,10,x,y + sin((add+3*50)/50),image_xscale,image_yscale,image_angle,color,image_alpha)
	draw_sprite_ext(spr_rottimernumber,d1,x + 12,y + sin((add+4*50)/50),image_xscale,image_yscale,image_angle,color,image_alpha)
	draw_sprite_ext(spr_rottimernumber,d2,x + 24,y + sin((add+5*50)/50),image_xscale,image_yscale,image_angle,color,image_alpha)
}