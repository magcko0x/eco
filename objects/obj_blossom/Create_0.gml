spd = 4
timer = 0
image_speed = 0

save_entity_to_cafeteria("blossom")

layer_create(depth,"Particles")
psystem = part_system_create_layer("Particles",false);

shake_strength = 0
maxshakestrength = 0

target = obj_player; 

orbit_radius = 96; 

my_index = -1;

for (var i = 0; i < instance_number(object_index); i++) {
    if (instance_find(object_index, i) == id) {
        my_index = i;
        break;
    }
}

orbit_angle = 0; 

orbit_speed = 2;

target.protected = true

savesounds = [snd_blossom_save1,snd_blossom_save2,snd_blossom_save3,snd_blossom_save4]

image_index = irandom(image_number-2)

prevface = image_index

owner = noone

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 64