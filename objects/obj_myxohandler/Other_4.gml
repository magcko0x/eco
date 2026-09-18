if room != rm_death {
	if is_struct(global.rooms[global.currentroom]) {
		if struct_exists(global.rooms[global.currentroom],"dark") && !asset_has_tags(global.rooms[global.currentroom].room_asset,"room_important"){
		    if global.rooms[global.currentroom].dark = true {
    	
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
		}	
	}
}
