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


