setdepth()

if global.interact {
	x += xspd
	y += yspd
	z += zspd
	
	if z > 0 {
		xspd = 0
		yspd = 0
		z = 0
		zspd = 0
		
		if !place_meeting(x,y,obj_drool)
			instance_create_depth(( x div 32 ) * 32,( y div 32 ) * 32,depth,obj_drool)
		
		part_particles_burst(psystem[0],( x div 32 ) * 32,( y div 32 ) * 32,part_drool)
		
		part_system_depth(psystem[0],-9000)
		
		instance_destroy()
	} else {
		if zspd < 10 {
			zspd += grav	
		}		
	}
	
	image_angle = point_direction(x,y+z,x+xspd,y+yspd+z+zspd)
	
}