if instance_exists(orbit_target) && instance_exists(interest_point){
	
	orbit_angle = point_direction(orbit_target.x,orbit_target.y,interest_point.x,interest_point.y)
	
	dist = point_distance(orbit_target.x,orbit_target.y,interest_point.x,interest_point.y)
	maxdist = 32
	
	currentdist = clamp((dist/maxdist),0.1,1)
	
	image_angle = orbit_angle - 90
	x = orbit_target.x + lengthdir_x(orbit_distance, orbit_angle) * currentdist
	y = orbit_target.y + lengthdir_y(orbit_distance, orbit_angle) * currentdist

	image_xscale = currentdist
	image_yscale = currentdist
	image_alpha = currentdist
	
} else {
    instance_destroy(); 
}