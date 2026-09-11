depth = 5000

validcol = [
	obj_player,
	obj_fakeplayer,
	obj_myxo
]

stopped = false

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.owner = self
mylight.radius = 96