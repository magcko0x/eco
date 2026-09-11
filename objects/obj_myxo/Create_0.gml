image_speed = random_range(0.4,0.5)

alarm[0] = 5

moving = false

prevx = 0
prevy = 0

owner = noone

tolerance = 10

targetx = 0
targety = 0
target = noone

stepsnd = -1
growlsnd = -1
chasesnd = -1

growltimer = irandom_range(60,120)

addx = irandom_range(-10,10)
addy = irandom_range(-10,10)

ipx = targetx
ipy = targety

roamtimer = 0

aftereffectimer = 10

path_grid = mp_grid_create(0, 0, room_width div 8, room_height div 8, 8, 8);
my_path = path_add();

walls = tag_get_asset_ids("solid",asset_object)

for (var i = 0; i < array_length(walls); i++) {
	mp_grid_add_instances(path_grid,walls[i], true);
}

spd = 0

basespd = 4

timer = 400

statetext = "free"

free = function() {
    
    statetext = "free"
	
	if path_position < 1 && spd > 0 {
		image_speed = 0.5
	} else {
		image_speed = 0
	}
	
	var light = instance_place(x,y,obj_light)
	
	roamtimer--
	
	if roamtimer <= 0 {
		if irandom(10) = 10 {
			state = scurry
		} else {
			targetx = x + irandom_range(-64,64)
			targety = y + irandom_range(-64,64)
			roamtimer = irandom_range(60,120)
		}
	}
	
	my_path = path_add();
	
	var slowdown = instance_place(x,y,tag_get_asset_ids("slowdown",asset_object)) 
	
	if slowdown {
		slowdownspd = slowdown.slowdownspd	
	} else {
		slowdownspd = 0
	}	
	
	if mp_grid_path(path_grid, my_path, x, y, ipx, ipy, true) {
		spd = ( basespd - slowdownspd )/6
		path_start(my_path, spd, path_action_stop, false); 
	} else {
		spd = 0;
	}
	
    if place_meeting(x,y,light) {
    	if light.owner.object_index = obj_player || light.owner.object_index = obj_hand || light.owner.object_index = obj_fakeplayer{
    		tolerance--
    			
    			if tolerance <= 0 {
    				path_end()
    				image_speed = random_range(3,3.2)
    				spd = 5
                    
                    if light.owner.object_index = obj_fakeplayer {
                        target = light.owner
                    } 
                    
                    if light.owner.object_index = obj_player || light.owner.object_index = obj_hand {
                        target = obj_player
                    }
                    
    				state = aggressive
    			}
    	
    	}
    } else tolerance = 10
}

aggressive = function() {
    
    statetext = "aggressive"
	
	var light = instance_nearest(x,y,obj_light)
	
    if target.object_index = obj_player {
    	if !place_meeting(obj_hand.x,obj_hand.y,obj_collision) && point_distance(x,y,target.x,target.y) > 325 {
    		targetx = (target.x + obj_hand.x)/2
    		targety = (target.y + obj_hand.y)/2
    	} else {
    		targetx = target.x
    		targety = target.y
    	}
    } else {
        targetx = target.x
        targety = target.y
    }
	
	my_path = path_add();
	
	var slowdown = instance_place(x,y,tag_get_asset_ids("slowdown",asset_object)) 

	if slowdown {
		slowdownspd = slowdown.slowdownspd	
	} else {
		slowdownspd = 0
	}	
	
	if mp_grid_path(path_grid, my_path, x, y, ipx, ipy, true) {
		
		spd = clamp(basespd * (point_distance(x,y,targetx,targety) / 100),8 - slowdownspd,12 - slowdownspd)	
		path_start(my_path, spd, path_action_stop, false); 
		
	} else {
		tolerance = 10
		state = free
	}
    
    if place_meeting(x,y,target) || !instance_exists(target){
        tolerance = 10  
        state = free
    }
	
	if !place_meeting(x,y,light) {
		timer--
		
		if timer <= 0 {
			image_speed = random_range(0.4,0.5)
			path_end()
			spd = 0
			timer = 400
			state = free
		}
	}
    
    if place_meeting(x,y,obj_player){ 
        if obj_player.state != obj_player.dead { 
            global.diedto = "myxo" 
            obj_player.state = obj_player.dead 
        }
    }
    
    if place_meeting(x,y,target) {
        target.state = target.dead
    }
    
    aftereffectimer--
	
	if aftereffectimer = 0 {
		var effect = instance_create_depth(x,y,depth + 5,obj_aftereffect)
		effect.owner = self
		aftereffectimer = 10
	}
}

scurry = function() {
    
    statetext = "scurry"
	
	if path_position < 1 && spd > 0 {
		image_speed = 3
	} else {
		image_speed = 0
	}
	
	var light = instance_nearest(x,y,obj_light)
	
	var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y);
	var away_dir = dir_to_player + 180;
	targetx = x + lengthdir_x(128, away_dir);
	targety = y + lengthdir_y(128, away_dir);
	
	my_path = path_add();
	
	
	var slowdown = instance_place(x,y,tag_get_asset_ids("slowdown",asset_object)) 
	
	if slowdown {
		slowdownspd = slowdown.slowdownspd	
	} else {
		slowdownspd = 0
	}	
	
	if mp_grid_path(path_grid, my_path, x, y, ipx, ipy, true) {
		spd = clamp(basespd * (point_distance(x,y,targetx,targety) / 100),8 - slowdownspd,12 - slowdownspd)	
		path_start(my_path, spd, path_action_stop, false); 
		
	} else {
		spd = 0;
	}
	
	timer -= 5
		
	if timer <= 0 {
		image_speed = random_range(0.4,0.5)
		path_end()
		spd = 0
		timer = 400
		state = free
	}
}

state = scurry

save_entity_to_cafeteria("myxo")