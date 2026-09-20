index = 0
available_floors = ["floor_industry","floor_floating_plateau"]
floorsprites = [spr_floor_industry_icon,spr_floor_floating_plateau_icon]

var temp_array = []
var temp_array_icon = []

for (var i = 0; i < array_length(available_floors); i++) {
	if array_contains(global.unlockedfloors,available_floors[i]) {
		array_push(temp_array,available_floors[i])
		array_push(temp_array_icon,floorsprites[i])
	}
}

floorsprites = temp_array_icon

available_floors = temp_array