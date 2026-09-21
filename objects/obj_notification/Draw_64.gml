draw_set_font(fnt_courier)

rank = 0
for (var i = 0; i < instance_number(object_index); i++) {
	var inst = instance_find(object_index, i)
	if inst.time_created < time_created {
		rank++
	}
}

notificonwidth = 0
notificonheight = 0
var _gap = 0

if notificon != -1 {
	notificonwidth = sprite_get_width(notificon)
	notificonheight = sprite_get_height(notificon)
	_gap = icongap
}

width = ceil((string_width(notiftext) + notificonwidth + _gap + margin_left + margin_right) / 16) * 16	
height = ceil((max(string_height(notiftext), notificonheight) + margin_up + margin_down) / 16) * 16

var targety = margin_up + (height + margin_down) * rank
ypos = lerp(ypos, targety, 0.2)

if state == "appearing" {
	var targetx = display_get_gui_width() - width - margin_right
	
	xpos = lerp(xpos, targetx, 0.2)
	
	if xpos - targetx < 0.5 {
		xpos = targetx
		state = "idle"
	}
} else if state == "idle" {
	if timer > 0 {
		timer--	
	} else {
		state = "retreat"
	}
} else if state == "retreat" {
	var targetx = display_get_gui_width() + width
	
	xpos = lerp(xpos, targetx, 0.2)
	
	if targetx - xpos < 64 {
		instance_destroy()
	}
}

draw_sprite_stretched(spr_notifGUI, 0, xpos, ypos, width, height)
	
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_yellow)

var text_x = xpos + margin_left
if notificon != -1 {
	text_x += notificonwidth + _gap
}
var text_y = ypos + (height - string_height(notiftext)) / 2

draw_text(text_x, text_y, notiftext)
draw_set_colour(c_white)

if notificon != -1 {
	var icon_x = xpos + margin_left + sprite_get_xoffset(notificon)
	var icon_y = ypos + (height - notificonheight) / 2 + sprite_get_yoffset(notificon)
	
	draw_sprite(notificon, 0, icon_x, icon_y)
}