mp_grid_clear_all(path_grid)

for (var i = 0; i < array_length(walls); i++) {
	mp_grid_add_instances(path_grid,walls[i], true);
}

alarm[1] = 5