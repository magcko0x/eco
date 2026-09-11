draw_self()
draw_set_colour(c_white)
draw_sprite(spr_knob,mouseon,x + clamp(progressx,8,10 * 32 - 8),y)

/*
draw_set_font(fnt_UI)
draw_text(x + image_xscale * 32,y - 24,( (progressx div 32 ) * 10) )