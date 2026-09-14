//Room generation thingies
global.rooms = array_create(101,-1)
global.darkrooms = array_create(101,false)


function reset_rooms() {
	for (var i = 0; i < 100; i++) {
		global.rooms[i] = -1
	}
	
	for (var i = 0; i < 100; i++) {
		global.darkrooms[i] = false
	}
}

function entity_picker() {
	
	var entitylist;
	
	entitylist = [obj_bunhandler,obj_tendrilhandler,obj_rothandler,obj_shihandler]
	
	for (var i = 0; i < array_length(entitylist); i++)
		if !instance_exists(entitylist[i])
			instance_create_depth(x,y,depth,entitylist[i])
	
}

function get_rooms_list(floors,part) {
	switch floors {
		case 0:
			switch part {
				case 0:
					global.importantroomslist = [rm_f1_intro,rm_elevator,rm_f1_p2_transition]

					global.saferoomslist = [rm_f1_safe1,rm_f1_safe2,rm_f1_safe3]

					global.basicroomslist = [rm_f1_basic,rm_f1_basic2,rm_f1_basic3,rm_f1_hallway,rm_f1_L];
			
					global.keyroomslist = [rm_f1_key1,rm_f1_key2,rm_f1_key3]
					
                break;
				
				case 1:
					global.importantroomslist = [rm_f1_intro,rm_elevator,rm_f1_p2_transition]

					global.saferoomslist = [rm_f1_p2_safe1,rm_f1_p2_safe2,rm_f1_p2_safe3]

					global.basicroomslist = [rm_f1_p2_basic,rm_f1_p2_basic2,rm_f1_p2_basic3];
			
					global.keyroomslist = [rm_f1_p2_key1,rm_f1_p2_key2]
					
                break;
			}
			
		break;
    
    
		case 1:
			switch part {
				case 0:
					global.importantroomslist = [rm_f2_intro,rm_elevator,rm_f2_transition]

					global.saferoomslist = [rm_f2_safe1,rm_f2_safe2]

					global.basicroomslist = [rm_f2_basic1,rm_f2_basic2,rm_f2_basic3,rm_f2_basic4]
			
					global.keyroomslist = [rm_f2_key1,rm_f2_key2,rm_f2_ball1,rm_f2_ball2,rm_f2_math1]
					
                break;
				
				case 1:
					global.importantroomslist = [rm_f2_intro,rm_elevator,rm_f2_transition]

					global.saferoomslist = [rm_f1_p2_safe1,rm_f1_p2_safe2,rm_f1_p2_basic3]

					global.basicroomslist = [rm_f1_p2_basic,rm_f1_p2_basic2,rm_f1_p2_basic3]
			
					global.keyroomslist = [rm_f1_p2_key1,rm_f1_p2_key2]
					
                break;
			}
			
		break; 
	}
    
}

function generate_rooms() {
    
    reset_rooms()

	if global.floor = 0 {
		
		for (var j = 0; j < 2; j++) {
			for (var i = 0 + (j*50); i < 50 * (j+1); i++) {
				
				get_rooms_list(global.floor,j)
				
				if global.rooms[i] == -1 {
					
			
					var chancer = irandom(100)
			
					var typechancer = irandom(100)
			
					if (chancer >= 0 && chancer < 50)
						global.rooms[i] = global.basicroomslist[irandom_range(0,array_length(global.basicroomslist)-1)]
		
					if (chancer >= 50 && chancer <= 100)
						global.rooms[i] = global.keyroomslist[irandom_range(0,array_length(global.keyroomslist)-1)]	

					if typechancer > 40 {
						if global.darkrooms[i] = false
							global.darkrooms[i] = true
					}
				}
			}
		}
		
		
		global.darkrooms[0] = false
		global.darkrooms[50] = true
		global.darkrooms[100] = false
		global.rooms[0] = rm_f1_intro
		global.rooms[50] = rm_f1_p2_transition
		global.rooms[100] = rm_elevator
		global.part = 0
	}
    
    if global.floor = 1 {
		for (var j = 0; j < 2; j++) {
			for (var i = 0 + (j*50); i < 50 * (j+1); i++) {
				
				get_rooms_list(global.floor,j)
				
				if global.rooms[i] == -1 {
					
			
					var chancer = irandom(100)
			
					var typechancer = irandom(100)
			
					if (chancer >= 0 && chancer < 70)
						global.rooms[i] = global.basicroomslist[irandom_range(0,array_length(global.basicroomslist)-1)]
		
					if (chancer >= 70 && chancer <= 100)
						global.rooms[i] = global.keyroomslist[irandom_range(0,array_length(global.keyroomslist)-1)]	

					if typechancer > 40 {
						if global.darkrooms[i] = false
							global.darkrooms[i] = true
					}
				}
			}
        }
        
        global.rooms[0] = rm_f2_intro
		global.rooms[50] = rm_f2_transition
    }
}
