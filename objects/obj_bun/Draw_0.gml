//draw_path(my_path,x,y,true)

if player.safe = false{
    image_index = 1
} else {
    image_index = 0
}

shakex = irandom_range(-shake_strength,shake_strength)
shakey = irandom_range(-shake_strength,shake_strength)

draw_sprite(sprite_index,image_index,x + shakex,y + shakey)
draw_set_colour(c_red)
draw_set_colour(c_white)