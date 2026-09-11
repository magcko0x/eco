randomize()

global.path_grid = mp_grid_create(0, 0, room_width div 8, room_height div 8, 8, 8); 

mp_grid_add_instances(global.path_grid, obj_collision, false); 

my_path = path_add();

owner = noone

stillhere = true

spd = 20

ambsfx = -1

shake_strength = 4

player = instance_nearest(x,y,obj_player)

save_entity_to_cafeteria("bun")