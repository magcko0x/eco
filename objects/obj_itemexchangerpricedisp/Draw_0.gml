depth = owner.depth - 1
line = "C" + string_replace_all(string_format(owner.item.cost,3,0)," ","0") + "        "

draw_sprite(spr_itemexchangerdisp, 0, x, y)

gpu_set_blendenable(false)
gpu_set_colorwriteenable(false, false, false, true)
draw_set_alpha(0)
draw_rectangle(0, 0, room_width, room_height, false)
draw_set_colour(c_white)

draw_set_alpha(1)

draw_sprite(spr_itemexchangerdmask, 0, x, y)
gpu_set_blendenable(true)
gpu_set_colorwriteenable(true, true, true, true)

gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha)
gpu_set_alphatestenable(true)

draw_set_font(myfont)
var total_text_width = string_width(line) * textsize

if scroll < total_text_width * 2 {
	scroll += scrollspd
} else {
	scroll -= total_text_width
}

add++

draw_set_halign(fa_left)
draw_set_valign(fa_top)

for(var j = 0; j < 3; j++) {
	var draw_x = x - scroll + total_text_width * j
	draw_text_transformed(draw_x, y - 30, line, textsize, textsize, 0)
}

gpu_set_alphatestenable(false)
gpu_set_blendmode(bm_normal)