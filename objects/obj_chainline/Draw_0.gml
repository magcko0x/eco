if instance_exists(owner) && instance_exists(target) {
	chainlength = point_distance(owner.x,owner.y, target.x, target.y )
	chainangle = point_direction(owner.x,owner.y, target.x, target.y )
	
	maxpieces = point_distance(owner.x,owner.y, target.x, target.y - 8) div sprite_get_width(sprite_index)
	
	chainspace = chainlength/maxpieces;



	image_angle = chainangle
	image_xscale = chainlength / sprite_get_width(sprite_index)
	image_angle = chainangle

	for (var i = 1; i <= maxpieces; i += 1) {
		xspot = x + lengthdir_x(chainspace*i, chainangle);
		yspot = y + lengthdir_y(chainspace*i, chainangle);
		draw_sprite_ext(sprite_index, image_index + i, round(xspot), round(yspot),1,1,image_angle,c_white,1);
	}
}