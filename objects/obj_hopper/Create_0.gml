image_speed = 0

z = 0
prevz = z
spd = 0
dir = 0
zspd = -20
grav = 1
item = -1
previtem = -1

cursor = 6
deac = false
target = obj_player

save_entity_to_cafeteria("hopper")

layer_create(depth,"Particles")
psystem[0] = part_system_create_layer("Particles",false);