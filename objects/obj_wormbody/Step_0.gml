setdepth()

if instance_exists(target) {

	ipx = target.x
	ipy = target.y

	var xdiff = ipx-x;
	var ydiff = ipy-y;
	var dir = point_direction(x,y,ipx,ipy);
	var dist = point_distance(x,y,ipx,ipy);

	direction = dir

	image_angle = direction - 90

	spd = target.spd

	mylight.x = x
	mylight.y = y
	mylight.radius = sprite_get_width(sprite_index)*image_xscale

	var orbit_angle = point_direction(x,y,ipx,ipy) + 180
	
	var orbit_dist = point_distance(x,y,ipx,ipy)
	var orbit_maxdist = (sprite_get_width(sprite_index)*image_xscale)/4
	
	var currentdist = clamp((orbit_dist/orbit_maxdist),1,1)

	backx = x + lengthdir_x(orbit_maxdist, orbit_angle) * currentdist
	backy = y + lengthdir_y(orbit_maxdist, orbit_angle) * currentdist

	timer += 0.05 * spd

	move_towards_point(target.backx, target.backy, spd); 
} else instance_destroy()

if place_meeting(x,y,obj_player) {
	global.diedto = "worm"
	
	if obj_player.state != obj_player.dead {
		obj_player.state = obj_player.dead	
	}
}