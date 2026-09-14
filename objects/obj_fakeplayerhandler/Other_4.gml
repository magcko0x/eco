
	
chance = irandom_range(0,clamp(75 - global.currentroom,25,75))

if chance = 0 { 
    //TA = (irandom_range(10,30) div 10)
			
    var amountchancer = irandom_range(0,100)
		
    if amountchancer < 70 {
		TA = 1
	}
		
	if amountchancer >= 70 && amountchancer < 90 {
		TA = 2	
	}
			
	if amountchancer >= 90 {
		TA = 3	
	}
	
	repeat TA {
		
		var collist = tag_get_asset_ids("solid",asset_object)
		collist = array_concat(collist,tag_get_asset_ids("pickup",asset_object))
		spawn_across_area(obj_fakeplayer,obj_spawnzone,collist)
		
	}
}
