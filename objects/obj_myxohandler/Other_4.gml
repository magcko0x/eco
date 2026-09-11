randomize()

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
    	
    			if instance_exists(obj_spawnzone) {
    				for (var i = TA; i > 0; i--) {
    					var zone = instance_find(obj_spawnzone,irandom(instance_number(obj_spawnzone) - 1))
    					var me = self

    					with zone {
    						randomize()
    						var mymyxo = instance_create_depth((irandom_range(x,x+sprite_width) div 32) * 32,(irandom_range(y,y+sprite_height) div 32) * 32,depth,obj_myxo)
    						
							mymyxo.owner = me
							
							me.mymyxos[clamp(array_length(me.mymyxos) - 1,0,9999)] = mymyxo
						}
						
    				}
    			}
    		}
    	}
    
    }
