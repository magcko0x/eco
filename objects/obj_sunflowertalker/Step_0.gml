//textcodes

// /default
if (string_pos(textcode[0], text[page]) > 0) {
    creator.expression = "default"
}

// /frown
if (string_pos(textcode[1], text[page]) > 0) {
    creator.expression = "frown"
}

// /sad
if (string_pos(textcode[2], text[page]) > 0) {
    creator.expression = "sad"
}

// /angry
if (string_pos(textcode[3], text[page]) > 0) {
    creator.expression = "angry"
}

// /mischievious
if (string_pos(textcode[4], text[page]) > 0) {
    creator.expression = "mischievious"
}

// /horny
if (string_pos(textcode[5], text[page]) > 0) {
    creator.expression = "horny"
}

// /surprised
if (string_pos(textcode[6], text[page]) > 0) {
    creator.expression = "surprised"
}

if restart global.interact = true

//pagepass
	if mouse_check_button_pressed(mb_left) || timer <= 0 {
		if (page+1<array_length(text)) {
		
			if charcount = string_length(filtered_text) {
				alarm[0] = 1
			}
		
		} else if charcount = string_length(filtered_text) {
			if !restart {
				instance_destroy()
				if creator.randomtext {
					creator.alarm[0] = 1
				}
				creator.expression = "default"
			} else {
				creator.expression = "default"
				global.backfromdeath = true
				global.floor = clamp(global.floor - 1,-1,9999)				
				game_restart()
			}
		}
		 if charcount != string_length(filtered_text) {
			 charcount = string_length(filtered_text)
		 }
	}
	
	if mouse_check_button_pressed(mb_right) {
		if !restart {
			instance_destroy()
			if creator.randomtext {
				creator.alarm[0] = 1
			}
			creator.expression = "default"
		}
		else {
			creator.expression = "default"
			global.backfromdeath = true
			global.floor = clamp(global.floor - 1,-1,9999)
			game_restart()
		}
	}

	if charcount = string_length(filtered_text) {
		timer--	
	}

