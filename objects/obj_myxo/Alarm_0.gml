mp_grid_clear_all(path_grid)

for (var i = 0; i < array_length(walls); i++) {
	mp_grid_add_instances(path_grid,walls[i], true);
}

ipx = targetx
ipy = targety

alarm[0] = 5