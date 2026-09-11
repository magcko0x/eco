if moving {
	frame += 0.1 * spd / 2
	
	if frame >= 2 {
		frame = 0
		var stepsfx = audio_play_sound_at(snd_step,x,y,0,300,600,1,false,0,1,0,random_range(1,2))
	}
		
} else frame = 0


var frequency,amplitude
if moving {
    frequency = 0.12 * spd / 2
    amplitude = 3
} else {
    frequency = 0.02
    amplitude = 1.5
}

timer += frequency;

var y_offset = sin(timer) * amplitude;

var angle_offset = cos(timer) * amplitude * xdir

yoff = y_offset

angleoff = y_offset + angle_offset

if ydir = -1 {

	headframe = 2 * head + 1
	bodyframe = 2 * body + 1
	pantsframe = 4 * pants + 2 + frame

	draw_sprite_ext(spr_playerhead,headframe,x - 8 * xdir,y + yoff + floor(frame),-xdir,1 - clamp(yoff/32,0,9999),angleoff * xdir,c_white,1)
	draw_sprite_ext(spr_playerpants,pantsframe,x,y - floor(frame)*2,xdir,1,0,c_white,1)
	draw_sprite_ext(spr_playerbody,bodyframe,x,y - floor(frame)*2,xdir,1,angleoff * xdir,c_white,1)
}

if ydir = 1 {
	
	headframe = 2 * head
	bodyframe = 2 * body 
	pantsframe = 4 * pants + frame
	
	draw_sprite_ext(spr_playerpants,pantsframe,x,y - floor(frame)*2,xdir,1,0,c_white,1)
	draw_sprite_ext(spr_playerbody,bodyframe,x,y - floor(frame)*2,xdir,1,angleoff * xdir,c_white,1)
	draw_sprite_ext(spr_playerhead,headframe,x - 8 * xdir,y + yoff + floor(frame),xdir,1 - clamp(yoff/32,0,9999),angleoff * xdir,c_white,1)
}

draw_set_font(fnt_UI)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)