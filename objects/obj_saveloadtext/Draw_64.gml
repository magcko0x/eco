draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_UI)

if textalpha < 2 {
    if type = 0 {
        draw_text_colour(0,0,"CREATED SAVE #1",color,color,color,color,textalpha)
    }
    if type = 1 {
        draw_text_colour(0,0,"LOADED SAVE #1",color,color,color,color,textalpha)
    }
    if type = 2 {
        draw_text_colour(0,0,"FAILED TO RECOVER SAVE #1",color,color,color,color,textalpha)
    }
}