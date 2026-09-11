if debug_mode {
	if global.inbackstage {
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_set_colour(c_white)
		draw_text(0,0,$"STAGEX: {global.backstagex} STAGEY: {global.backstagey}")
	}
}