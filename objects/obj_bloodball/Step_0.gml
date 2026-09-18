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
		
		if !place_meeting(x,y,obj_bloodcell) {
			if layer_exists("Tiles_1") {
					var _lay_id = layer_get_id("Tiles_1");
					var _tile_id = layer_tilemap_get_id(_lay_id);
					var _tile = tilemap_get(_tile_id, x div 32, y div 32)
					if tile_get_empty(_tile) {
						instance_destroy()
					}
			}			
			
			if instance_exists(id)
				instance_create_depth(( x div 32 ) * 32,( y div 32 ) * 32,depth,obj_bloodcell)
		}
		
		part_particles_burst(psystem[0],( x div 32 ) * 32,( y div 32 ) * 32,part_burst)
		
		part_system_depth(psystem[0],-9000)
		
		instance_destroy()
	} else {
		if zspd < 10 {
			zspd += grav	
		}		
	}
	
	image_angle = point_direction(x,y+z,x+xspd,y+yspd+z+zspd)
	
}