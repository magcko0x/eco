var spdx = lengthdir_x(spd,image_angle)
var spdy = lengthdir_y(spd,image_angle)

mylight.x = x
mylight.y = y

if global.interact {
	if !stopped {
		if place_meeting(x,y,validcol) && !moving{
			obj_player.x += spdx
			obj_player.y += spdy
			moving = true
		}
	
		if moving {
			colliding = true
		
			x += spdx
			y += spdy
		
			var collidinginstance = instance_place(x,y,validcol)
		
			if collidinginstance {
				with collidinginstance
					move_and_collide(spdx,spdy,obj_collision)	
			}
		} else {
			colliding = false	
		}
	} else {
		colliding = false
		moving = false
	}
}
