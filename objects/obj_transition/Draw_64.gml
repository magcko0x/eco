draw_set_alpha(current_alpha)

var xx, yy, w, h;
xx = -64
yy = -64
w = display_get_gui_width() + 64
h = display_get_gui_height() + 64

draw_rectangle_color(xx, yy, w, h,fade_color, fade_color, fade_color, fade_color, false)

draw_set_alpha(1)