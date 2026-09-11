var w,h

w = display_get_gui_width()
h = display_get_gui_height()

if !fadingout {
	if alpha < 5 {
		alpha += 0.05
	} else {
		fadingout = true	
	}
} else {
	if alpha > 0 {
		alpha -= 0.05	
	} else {
		instance_destroy()	
	}
}

var size = 1.5
draw_sprite_ext(titlecardsprite,0,w/2,4 + ( ( sprite_get_height(titlecardsprite) * size ) / 2 ),size,size,0,c_white,alpha)