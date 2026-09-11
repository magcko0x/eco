randomise()
head = irandom_range(0,(sprite_get_number(spr_playerhead)/2)-1)
body = irandom_range(0,(sprite_get_number(spr_playerbody)/2)-1)
pants = irandom_range(0,(sprite_get_number(spr_playerpants)/4)-1)

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.owner = self
mylight.radius = 64

slowdownspd = 0

frame = 0

image_speed = random_range(0.4,0.5)

alarm[0] = 5

alarm[1] = 5

tolerance = 30

targetx = 0
targety = 0

stepsnd = -1
growlsnd = -1
chasesnd = -1

growltimer = irandom_range(60,120)

addx = irandom_range(-10,10)
addy = irandom_range(-10,10)

ipx = targetx
ipy = targety

roamtimer = 0

path_grid = mp_grid_create(0, 0, room_width div 8, room_height div 8, 8, 8);
my_path = path_add();

walls = tag_get_asset_ids("solid",asset_object)

for (var i = 0; i < array_length(walls); i++) {
	mp_grid_add_instances(path_grid,walls[i], true);
}

spd = 0

walkspd = 5
running = false

timer = 400

moving = false

xdir = 1
ydir = 1

prevx = x
prevy = y

haskey = false
target = noone

deadlycol = [
    obj_bun,
    obj_shi,
    obj_rot,
    obj_myxo,
    obj_meow
]

interactsound = snd_pickup

runforyourlife = false

free = function() {
	
	if path_position < 1 && spd > 0 {
		image_speed = 0.5
	} else {
		image_speed = 0
	}
	
	roamtimer--
	
	if roamtimer <= 0 {
        
        randomise()
        
        var player 
        
        if irandom(30) != 0 {
            if irandom(20) = 0 {
                
                if irandom(20) = 0 {
                    player = instance_nearest(x,y,obj_player)
                } else player = instance_find(obj_fakeplayer,irandom(instance_number(obj_fakeplayer)))
                
            } else {
                player = self
            }
        } else {
            state = getthroughroom
            player = noone
        }
        
        if player != noone {
            targetx = player.x + irandom_range(-64,64) * xdir
            targety = player.y + irandom_range(-64,64) * ydir
        }
        roamtimer = irandom_range(256,512)
	}
    
    if point_distance(x,y,targetx,targety) < 32 {
        roamtimer = 0
    }
    
    if point_distance(x,y,targetx,targety) > 96 {
        running = true
    } else running = false
	
	my_path = path_add();
	if mp_grid_path(path_grid, my_path, x, y, ipx, ipy, true) {
		
		
        if !running {
            spd = walkspd - slowdownspd
        } else {
            spd = walkspd + walkspd/2 - slowdownspd
        }
		path_start(my_path, spd, path_action_stop, false); 
	} else {
        roamtimer = irandom(20);
		spd = 0;
	}
}

getthroughroom = function () {
	
	if path_position < 1 && spd > 0 {
		image_speed = 0.5
	} else {
		image_speed = 0
	}
    
    if instance_exists(obj_door) {
        if instance_exists(obj_bunhandler) {
            if obj_bunhandler.bunactive {
                if instance_exists(obj_safespot) {
                    
                    runforyourlife = true
                    
                    var safespot = instance_nearest(x,y,obj_safespot)
                    targetx = safespot.x
                    targety = safespot.y
                }
            } else runforyourlife = false
        } else runforyourlife = false
        
        if runforyourlife = false {
            var door = instance_nearest(x,y,obj_door)
            var key = instance_nearest(x,y,obj_key)
            
            if !door.locked || haskey{
                targetx = door.x
                targety = door.y
                target = door
            } else {
                if instance_exists(key) {
                    targetx = key.x
                    targety = key.y
                    target = key
                }
            }
        }
        
    } else {
        state = free
    }
    
    if point_distance(x,y,targetx,targety) < 32 {
        if instance_exists(target) {
            if target.object_index = obj_key {
                haskey = true
                interactsound = audio_play_sound_at(snd_pickup,x,y,0,300,600,1,false,0)
            }
            
            if target.object_index = obj_door {
                var key = instance_nearest(x,y,obj_key)
                instance_destroy(key)
                target.locked = false
                interactsound = audio_play_sound_at(snd_dooropen,x,y,0,300,600,1,false,0)
                instance_destroy()
            }
        } else state = free
    }
    
    if point_distance(x,y,targetx,targety) > 96 {
        running = true
    } else running = false
	
	my_path = path_add();
	if mp_grid_path(path_grid, my_path, x, y, ipx, ipy, true) {
		  
        if !running {
            spd = walkspd - slowdownspd
        } else {
            spd = walkspd + walkspd/2 - slowdownspd
        }
		path_start(my_path, spd, path_action_stop, false); 
	} else {
		state = free
	} 
}

dead = function() {
    var myhead = instance_create_depth(x,y,depth,obj_fakeplayerpart)
    myhead.sprite_index = spr_playerhead
    myhead.image_index = 2 * head
    
    var mybody = instance_create_depth(x,y,depth,obj_fakeplayerpart)
    mybody.sprite_index = spr_playerbody
    mybody.image_index = 2 * body
    
    var mypants = instance_create_depth(x,y,depth,obj_fakeplayerpart)
    mypants.sprite_index = spr_playerpants
    mypants.image_index = 4 * pants
    
    instance_destroy()
}

state = free