var _hspd = lengthdir_x(spd * 2, dir)
var _vspd = lengthdir_y(spd * 2, dir)

var _total_speed = point_distance(0, 0, _hspd, _vspd)

visual_angle = (visual_angle + _total_speed) % 360

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	visual_angle,
	image_blend,
	image_alpha
)