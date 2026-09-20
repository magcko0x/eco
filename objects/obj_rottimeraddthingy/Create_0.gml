var addy = 0

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

ypos = 480 - 20 - addy

timer = 0