mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 32


cursor = 1
deac = false

xspd = 0
yspd = 0

fric = 0.01

collisions = tag_get_asset_ids("solid",asset_object)

movingentities = tag_get_asset_ids("movingentity",asset_object)

collisions[array_length(collisions)] = obj_ball

hitsound = snd_step

colliding = false

prevcollide = colliding

if randomball
	image_index = irandom(image_number-1)