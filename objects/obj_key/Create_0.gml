event_inherited()
mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 16

tempblend = c_white

depth = 5000

image_angle = irandom_range(0,360)

if !customcolor image_blend = c_yellow

cursor = 1