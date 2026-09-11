shakex = irandom_range(-shake_strength,shake_strength)
shakey = irandom_range(-shake_strength,shake_strength)

if shake_strength > maxshakestrength {
    shake_strength -= 0.25
}

if shake_strength < maxshakestrength {
    shake_strength += 0.25
}

if !deac
    draw_selected(sprite_index,image_index, x + shakex, y + shakey)

draw_sprite(sprite_index,image_index,x + shakex,y + shakey)