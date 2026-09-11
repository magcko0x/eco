
/*
var otherobj = instance_find(object_index,my_index+1)

var startobj = instance_find(object_index,0)

if instance_exists(otherobj) {
	draw_line(x,y,otherobj.x,otherobj.y)
}

if my_index = instance_number(object_index) - 1 {
	draw_line(x,y,startobj.x,startobj.y)	
}
*/

shakex = irandom_range(-shake_strength,shake_strength)
shakey = irandom_range(-shake_strength,shake_strength)

if shake_strength > 0 {
    shake_strength -= 0.25
}

if shake_strength < 0 {
	shake_strength = 0	
}

draw_sprite_ext(sprite_index,image_index,x + shakex,y + shakey,image_xscale,image_yscale,image_angle + shakex * 2.5,image_blend,image_alpha)