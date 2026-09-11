shakex = irandom_range(-shake_strength, shake_strength);
shakey = irandom_range(-shake_strength, shake_strength);
draw_sprite_ext(sprite_index,image_index,x + shakex,y + shakey,image_xscale,image_yscale,image_angle,image_blend,image_alpha)