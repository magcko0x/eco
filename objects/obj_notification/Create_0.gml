notiftext = "IT IS ME LEMONE!!"
notificon = -1
draw_set_font(fnt_courier)

margin_left = 16
margin_right = 16
margin_up = 16
margin_down = 16

time_created = current_time

notificonwidth = 0
notificonheight = 0
var _gap = 0


icongap = 8

if notificon != -1 {
	notificonwidth = sprite_get_width(notificon)
	notificonheight = sprite_get_height(notificon)
	_gap = icongap
}

width = ceil((string_width(notiftext) + notificonwidth + _gap + margin_left + margin_right) / 16) * 16	
height = ceil((max(string_height(notiftext), notificonheight) + margin_up + margin_down) / 16) * 16

rank = 0
for (var i = 0; i < instance_number(object_index); i++) {
	var inst = instance_find(object_index, i)
	if inst.time_created < time_created {
		rank++
	}
}

xpos = display_get_gui_width() + width
ypos = margin_up + (height + margin_down) * rank

state = "appearing"
timer = 400