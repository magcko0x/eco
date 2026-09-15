event_inherited()

cursor = 1
drawitem = true

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.hue = 60
mylight.saturation = 100
mylight.radius = 32

item = global.time_capsule_item

timer = irandom(100)

item_timer = irandom(100)

z = 0
z_offset = 0
false_angle = 0

item_z = 0
item_false_angle = 0

vanishing = false

launching_item = false

item_to_launch = -1

item_yforce = 10