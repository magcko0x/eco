if global.currentroom > -1 && global.currentroom < array_length(global.rooms)+1
	if array_contains(global.saferoomslist,global.rooms[global.currentroom])
		chance = irandom_range(0,3)
else
	chance = irandom_range(0,7)


mytendrils = -1

if chance = 0 {
	TA = (irandom_range(10,100) div 10)
	
	repeat TA {
		spawn_across_area(obj_tendril,obj_spawnzone,collist)
	}
}
