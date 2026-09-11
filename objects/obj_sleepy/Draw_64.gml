if shake_strength < maxshake {
	shake_strength += 0.25	
} else {
	shake_strength -= 0.25
}

shakex = irandom_range(-shake_strength,shake_strength)
shakey = irandom_range(-shake_strength,shake_strength)

draw_sprite_ext(spr_sleepy,frame,960 - 64 + shakex,64 + shakey,2,2,0,c_white,1)