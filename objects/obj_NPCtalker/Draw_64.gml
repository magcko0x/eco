draw_set_alpha(1)

//draw_sprite_ext(spr_textbox,0,x,y,0.5,0.5,0,c_white,1)

draw_set_font(fnt_courier)

draw_set_valign(fa_left)

draw_set_halign(fa_center)

draw_set_colour(c_white)

filtered_text = text[page];
for (var i = 0; i < array_length(textcode); i++) {
    var _blacklisted_word = textcode[i];
    filtered_text = string_replace_all(filtered_text, _blacklisted_word, "");
}


if charcount < string_length(filtered_text) {
	charcount += txtspd
} else { 
	charcount = string_length(filtered_text)	
}

textpart = string_copy(filtered_text,1,charcount)

var letter = string_upper(string_char_at(textpart,string_length(textpart)))

var sound_index = speechsound

if lastchar != string_length(textpart) {
	if (sound_index != -1) {
		randomise()
		audio_play_sound(sound_index,1,false,1,0,irandom_range(1,1.5))	
	}
} else {
	audio_stop_sound(sound_index)	
}

var latestchar = string_char_at(textpart,string_length(textpart))

if latestchar = "." || latestchar = ","
	txtspd = 0.075
else 
	txtspd = 0.25

stringheight = string_height_ext(textpart,string_height(text[page]),400) + 8
stringwidth = string_width_ext(textpart,string_width(text[page]),400) + 12

lastchar = string_length(textpart)

if latestchar != "" {
	var flickering = flicker(10)
	if page = 0 {
		draw_sprite_ext(spr_mouseGUI,0,480 - 16 - stringwidth / 2,480 - 8 - stringheight/2,1,1,0,c_white,flickering)
		draw_sprite_ext(spr_mouseGUI,1,480 + 16 + stringwidth / 2,480 - 8 - stringheight/2,1,1,0,c_white,flickering)
	}
	draw_sprite_stretched(spr_textdisplay,0,480 - stringwidth / 2,480 - 8 - stringheight,stringwidth,stringheight)
}
draw_text_ext_transformed(480,480 - 6 - stringheight,textpart,string_height(text[page]),400,1,1,0)
