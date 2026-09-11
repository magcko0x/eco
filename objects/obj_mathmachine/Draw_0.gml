draw_self()
//draw_text(x,y,expression)

var yoffset = 5

draw_sprite_ext(spr_ball,expression.value_1,x - 16,y - yoffset,0.5,0.5,0,c_white,1)

var operationsign = expression.addition ? " + " : " - "

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_UI)
draw_text_transformed_colour(x,y - yoffset,operationsign,0.5,0.5,0,c_white,c_white,c_white,c_white,1)

draw_sprite_ext(spr_ball,expression.value_2,x + 16,y - yoffset,0.5,0.5,0,c_white,1)