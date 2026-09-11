shake_strength = 0
maxshakestrength = 4
target = obj_player
spd = 0
maxspd = 2
ambientsfx = snd_rabies_ambience

spewtimer = 300
spew = -1

cursor = 6
deac = false

layer_create(depth,"Particles")
psystem[0] = part_system_create_layer("Particles",false);

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = sprite_width

save_entity_to_cafeteria("rabies")