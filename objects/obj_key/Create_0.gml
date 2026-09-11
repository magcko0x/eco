event_inherited()
mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 16

tempblend = c_white

depth = 5000

bannedcol = [
	!obj_spawnzone,
	obj_tendril,
	obj_collision,
	obj_syringe
]

image_angle = irandom_range(0,360)

if !customcolor image_blend = c_yellow

cursor = 1

if spawnlock {
	if instance_exists(obj_door) {
		if place_meeting(x,y,obj_collision) {
			obj_door.locked = false
			instance_destroy()
		}

		if (x > room_width) || (x < 0) || (y > room_width) || (y < 0) {
			obj_door.locked = false
			instance_destroy()
		}

		if !place_meeting(x,y,obj_spawnzone){
			obj_door.locked = false
			instance_destroy()
		}
	}
}