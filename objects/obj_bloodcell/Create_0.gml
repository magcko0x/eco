layer_create(depth,"Particles")
psystem[0] = part_system_create_layer("Particles",false);

deac = false
cursor = 6

reverse = false

save_entity_to_cafeteria("tim")

if place_meeting(x,y,tag_get_asset_ids("solid",asset_object)) || place_meeting(x,y,tag_get_asset_ids("movingentity",asset_object)) instance_destroy()

image_speed = random_range(0.5,1)