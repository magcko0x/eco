depth = 5000

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 64

charge = 0
ballnumber = -1

closed = false

layer_create(depth,"Particles")
psystem = part_system_create_layer("Particles",false);