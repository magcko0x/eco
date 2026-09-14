if room != rm_death
    if global.darkrooms[global.currentroom] = true {
    	
    	chance = irandom_range(0,10)
		
		mymyxos = -1
    	
    	if room_width > 480 && room_height > 320 {
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
					spawn_across_area(obj_myxo,obj_spawnzone,collist)
		
				}
    		}
    	}
    
    }
