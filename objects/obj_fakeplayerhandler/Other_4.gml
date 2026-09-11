randomize()
	
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
	
	if instance_exists(obj_spawnzone) {
    	for (var i = TA; i > 0; i--) {
    		var zone = instance_find(obj_spawnzone,irandom(instance_number(obj_spawnzone) - 1))
    		
    		with zone {
    			randomize()
    			var mymyxo = instance_create_depth((irandom_range(x,x+sprite_width) div 32) * 32,(irandom_range(y,y+sprite_height) div 32) * 32,depth,obj_fakeplayer)
    		}
    	}
    }
}
