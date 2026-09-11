var spdx = lengthdir_x(spd,image_angle)
var spdy = lengthdir_y(spd,image_angle)

var collidinginstance = instance_place(x,y,validcol)

if global.interact
	if instance_exists(collidinginstance) {
		if collidinginstance {
			with collidinginstance {
				move_and_collide(spdx,spdy,tag_get_asset_ids("solid",asset_object))	
			}
		}
	}

image_speed = spd / 2