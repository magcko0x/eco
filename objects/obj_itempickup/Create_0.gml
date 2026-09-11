event_inherited();
mylight = instance_create_depth(x, y, depth, obj_light);
mylight.radius = 48;

cursor = 1;

randomize();
get_item_loot_table();

if (global.inbackstage) {
	destroyed = false;
	unique_id = room_get_name(room) + "_" + object_get_name(object_index) + "_" + string(xstart) + "_" + string(ystart);
	stagex = global.backstagex;
	stagey = global.backstagey;
}

if (image_index == 0) {
	item = weighted_random(item_loot_table);
	if (item == -1) {
		alarm[0] = 3;
	}
} else {
	item = image_index - 1;
}

timer = irandom_range(0, 100);