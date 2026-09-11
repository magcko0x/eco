var collidinginstancex, collidinginstacey

var spdx = lengthdir_x(spd,image_angle)
var spdy = lengthdir_y(spd,image_angle)

collidinginstancex = instance_place(x + spdx,y,validcol)
collidinginstacey = instance_place(x,y + spdy,validcol)

if global.interact {
	if collidinginstancex {
		with collidinginstancex {
			move_and_collide(spdx,0,tag_get_asset_ids("solid",asset_object))	
		}
	}

	if collidinginstacey {
		with collidinginstacey {
			move_and_collide(0,spdy,tag_get_asset_ids("solid",asset_object))	
		}
	}
}