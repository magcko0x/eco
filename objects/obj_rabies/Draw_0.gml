shakex = irandom_range(-shake_strength,shake_strength)
shakey = irandom_range(-shake_strength,shake_strength)

if shake_strength > maxshakestrength {
    shake_strength -= 0.25
}

if shake_strength < maxshakestrength {
    shake_strength += 0.25
}

for (var i = 0; i < 10; i++) {
	backshadowshakex[i] = irandom_range(-shake_strength - i,shake_strength + i)
	backshadowshakey[i] = irandom_range(-shake_strength - i,shake_strength + i)

	draw_sprite_ext(sprite_index,image_index,x + backshadowshakex[i],y + backshadowshakey[i],image_xscale,image_yscale,image_angle,c_black,0.2)
}
draw_selected(sprite_index,image_index,x + shakex,y + shakey)
draw_sprite(sprite_index,image_index,x + shakex,y + shakey)