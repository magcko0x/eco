event_inherited();
mylight = instance_create_depth(x, y, depth, obj_light);
mylight.radius = 32;

cursor = 1;

get_item_loot_table();

if (image_index == 0) {
	item = variable_clone(get_item_definition(weighted_random(item_loot_table)))
	if (item == -1) {
		alarm[0] = 3
	}
} else {
	item = global.itemlist[image_index - 1]
}

timer = irandom_range(0, 100);

depthoffset = 0

z = 0

z_offset = 0

false_angle = 0