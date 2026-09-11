var xx,yy

shakex = irandom_range(-shake_strength, shake_strength);
shakey = irandom_range(-shake_strength, shake_strength);

if shake_strength > 0 {
	shake_strength -= 0.25	
}

var addy
addy = 0

var textdisplays = tag_get_asset_ids("textdisplay",asset_object)
var textdisplay = noone
	
for (var i = 0; i < array_length(textdisplays); i++)
	if instance_exists(textdisplays[i]) {
		textdisplay = instance_find(textdisplays[i],0)	
		break
	}
	
if textdisplay != noone {
	if string_char_at(textdisplay.textpart,string_length(textdisplay.textpart)) != "" {
		addy = textdisplay.stringheight + 10
	} else {
		addy = 26 + 15	
	}
}	

xx = 480 + shakex
yy = 480 - 20 + shakey - addy


draw_sprite(spr_rottimer,0,xx,yy)

var secs, mins, disp;

disp = timer div 60;
secs = string_replace(string_format(disp mod 60,2,0)," ","0");
mins = string_replace(string_format(disp div 60,2,0)," ","0");

var d1,d2,d3,d4

if (disp mod 60) != prevtime {
	audio_play_sound(snd_rot_timer_tick,0,false,1,0,random_range(0.9,1.1))
	if disp == 0 {
		audio_play_sound(snd_rot_timesup,0,false,1,0)
	}
	prevtime = (disp mod 60)
	shake_strength = 4
}

d1 = real(string_char_at(secs,1))
d2 = real(string_char_at(secs,2))
d3 = real(string_char_at(mins,1))
d4 = real(string_char_at(mins,2))


draw_sprite(spr_rottimernumber,d3,xx - 24,yy)
draw_sprite(spr_rottimernumber,d4,xx - 12,yy)
draw_sprite(spr_rottimernumber,10,xx,yy)
draw_sprite(spr_rottimernumber,d1,xx + 12,yy)
draw_sprite(spr_rottimernumber,d2,xx + 24,yy)

