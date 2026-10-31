draw_rectangle_colour(0,0,display_get_gui_width(),display_get_gui_height(),#661B4A,#661B4A,#661B4A,#661B4A,false)

draw_set_colour(c_white)
draw_set_halign(fa_middle)
draw_set_valign(fa_top)
draw_set_font(fnt_UI)

draw_text(display_get_gui_width()/2,0,"MENU IS IN BETA AND IS SUBJECT TO CHANGE")

draw_set_halign(fa_left)
draw_set_valign(fa_top)

var cursor = 0

var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)

// exit button
var _exit_hovered = point_in_rectangle(_mouse_x,_mouse_y,16,16,48,48)

if _exit_hovered {
	
	if mouse_check_button_pressed(mb_left) {
		mouse_clear(mb_left)
		menu_exit()
	}
	
	cursor = 1
}

draw_sprite(spr_exitbutton,_exit_hovered,16,16)




//draw mouse
draw_sprite_ext(spr_hand,cursor,_mouse_x,_mouse_y,1,1,0,c_white,1)
