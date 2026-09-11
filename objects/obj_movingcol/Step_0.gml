if targetplatform != noone {
	spd = targetplatform.spd
	moving = targetplatform.moving
	
	if !door {
		if !colliding {
			colliding = targetplatform.colliding
		}
	} else {
		colliding = targetplatform.colliding
	}
}


var spdx = lengthdir_x(spd,image_angle)
var spdy = lengthdir_y(spd,image_angle)

if global.interact {
	if moving {
		x += spdx
		y += spdy
	}
	
	if colliding {
		mask_index = sprite_index	
	} else {
		mask_index = spr_null	
	}
}
