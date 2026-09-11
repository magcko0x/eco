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
	
var textsize = 0.5 

stringheight = ( string_height_ext(textpart,string_height(text[page]),200 * textsize) * textsize) + 16 * textsize
stringwidth = ( string_width_ext(textpart,string_width(text[page]),200 * textsize) * textsize) + 24 * textsize

lastchar = string_length(textpart)

if latestchar != "" {
	draw_sprite_stretched(spr_lemone_speech_bubble,0,x,y - stringheight,stringwidth,stringheight)
}

if lastchar == string_length(filtered_text) {
	creator.image_speed = 0
	creator.image_index = 0
} else {
	creator.image_speed = 1	
}

draw_set_colour(c_black)
draw_set_halign(fa_left)

var addx, addy

addx = 0
addy = 0


if shaking {
	var shake_strength = 1
	
	addx = random_range(-shake_strength,shake_strength)
	addy = random_range(-shake_strength,shake_strength)
}

draw_text_ext_transformed(10 * textsize + x + addx,y + addy + 2 - stringheight,textpart,string_height(text[page]),200 * textsize,textsize,textsize,0)

draw_set_colour(c_white)
