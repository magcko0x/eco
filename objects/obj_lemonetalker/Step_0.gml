//textcodes

// /default
if (string_pos(textcode[0], text[page]) > 0) {
    creator.sprite_index = spr_lemone
}

// /evil
if (string_pos(textcode[1], text[page]) > 0) {
    creator.sprite_index = spr_lemone_evil
}

// /shock
if (string_pos(textcode[2], text[page]) > 0) {
    creator.sprite_index = spr_lemone_shock
}

// /sideeye
if (string_pos(textcode[3], text[page]) > 0) {
    creator.sprite_index = spr_lemone_sideeyed
}

// /silly
if (string_pos(textcode[4], text[page]) > 0) {
    creator.sprite_index = spr_lemone_silly
}

// /shake
if (string_pos(textcode[5], text[page]) > 0) {
	shaking = true
} else shaking = false

//pagepass


if mouse_check_button_pressed(mb_left) || timer <= 0 {
	if (page+1<array_length(text)) {
		if charcount = string_length(filtered_text) {
			alarm[0] = 1
		}
	} else if charcount = string_length(filtered_text) {
		instance_destroy()
	}
		
	if charcount != string_length(filtered_text) {
		charcount = string_length(filtered_text)
	}
}
	
	
if mouse_check_button_pressed(mb_right) {
	instance_destroy()
}

if charcount = string_length(filtered_text) {
	timer--	
}


