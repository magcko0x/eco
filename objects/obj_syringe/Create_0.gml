event_inherited()
mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 16

randomize()

depth = 5000

bannedcol = [
	obj_tendril,
	obj_collision,
	obj_key,
	obj_door
]

cursor = 1

image_angle = irandom_range(0,360)

chancer = irandom_range(0,20)

if chancer < 20 {
	timeradd = MINUTE/2	
} else timeradd = MINUTE