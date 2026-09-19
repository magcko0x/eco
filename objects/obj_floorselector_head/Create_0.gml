index = 0
available_floors = ["floor_industry","floor_floating_plateau"]

var temp_array = []

for (var i = 0; i < array_length(available_floors); i++) {
	if array_contains(global.unlockedfloors,available_floors[i]) {
		array_push(temp_array,available_floors[i])
	}
}

available_floors = temp_array