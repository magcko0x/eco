if doroutine {
	draw_set_alpha(current_alpha)

	var xx, yy, w, h;
	xx = 0
	yy = 0
	w = display_get_gui_width()
	h = display_get_gui_height()

	draw_rectangle_color(xx, yy, w, h,fade_color, fade_color, fade_color, fade_color, false)

	draw_set_alpha(1)
}