chance = irandom_range(0,7)


mytendrils = -1

if chance = 0 {
	TA = (irandom_range(10,100) div 10)
	
	repeat TA {
		spawn_across_area(obj_tendril,obj_spawnzone,collist)
	}
}
